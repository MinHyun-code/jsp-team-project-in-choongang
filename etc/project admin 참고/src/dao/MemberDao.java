package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDao {

	private static MemberDao instance;

	private MemberDao() {

	}

	public static MemberDao getInstance() {
		if (instance == null) {
			instance = new MemberDao();
		}
		return instance;
	}

	private Connection getConnection() {
		Connection conn = null;

		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return conn;
	}

	// 카카오 로그인
	public int kakaoLogin(String m_id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from member where m_id = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				return 1; // 성공
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return -1;
	}

	public int login(String m_id, String m_pass) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select m_pass, m_tf from member where m_id = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				if (rs.getString("m_pass").equals(m_pass)) {
					if(rs.getString("m_tf").equals("2")) {
						return 2;
					}
					return 1; // 성공
				} else {
					return 0; // 실패
				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return -1;
	}

	// 회원가입
	public int join(Member member) throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "insert into member values (?,?,?,?,?,?,?,?,?)";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getM_id());
			pstmt.setString(2, member.getM_pass());
			pstmt.setString(3, member.getM_birth());
			pstmt.setString(4, member.getM_name());
			pstmt.setString(5, member.getM_addr());
			pstmt.setString(6, member.getM_gender());
			pstmt.setString(7, member.getM_email());
			pstmt.setString(8, member.getM_phone());
			pstmt.setString(9, "T");
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return result;
	}

	// 개인정보 가져오기
	public Member select(String m_id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member member = new Member();

		String sql = "SELECT * FROM member WHERE m_id = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				member.setM_id(rs.getString(1));
				member.setM_pass(rs.getString(2));
				member.setM_birth(rs.getString(3));
				member.setM_name(rs.getString(4));
				member.setM_addr(rs.getString(5));
				member.setM_gender(rs.getString(6));
				member.setM_email(rs.getString(7));
				member.setM_phone(rs.getString(8));
				member.setM_tf(rs.getString(9));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}

		return member;
	}

	// ??
	public int check(String m_id, String m_pass) throws SQLException {
		int result = 0;
		Connection conn = null;
		String sql = "select m_pass from member2 where m_id=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String dbPasswd = rs.getString(1);
				if (dbPasswd.equals(m_pass))
					result = 1;
				else
					result = 0;
			} else
				result = -1;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return result;
	}

	// 개인 이력서 갯수
	public int resumeCnt() throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int tot = 0;

		String sql = "SELECT COUNT(*) FROM resume";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				tot = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}

		return tot;
	}

	// 개인 자기소개서 갯수
	public int introCnt() throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int tot = 0;

		String sql = "SELECT COUNT(*) FROM self_intro";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				tot = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}

		return tot;
	}

	// 이력서 리스트 보기
	public List<Resume> resume_list(int startRow, int endRow, String m_id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Resume> al = new ArrayList<Resume>();

		String sql = "SELECT * FROM (SELECT rownum rn, a.* FROM (SELECT * FROM resume) a) WHERE rn BETWEEN ? AND ? and m_id=?";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setString(3, m_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Resume resume = new Resume();
				resume.setR_num(rs.getInt("r_num"));
				resume.setR_title(rs.getString("r_title"));
				resume.setR_file((rs.getString("r_file")));
				resume.setR_date(rs.getDate("r_date"));
				al.add(resume);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return al;
	}

	// 자기소개서 리스트 보기
	public List<Self_Intro> intro_list(int startRow, int endRow, String m_id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Self_Intro> al = new ArrayList<Self_Intro>();

		String sql = "SELECT * FROM (SELECT rownum rn, a.* FROM (SELECT * FROM self_intro) a) WHERE rn BETWEEN ? AND ? and m_id=?";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setString(3, m_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Self_Intro self = new Self_Intro();
				self.setSi_num(rs.getInt("si_num"));
				self.setM_id(rs.getString("m_id"));
				self.setSi_ques(rs.getString("si_ques"));
				self.setSi_content((rs.getString("si_content")));
				al.add(self);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return al;
	}

	// 자기소개서 추가
	public int selfAdd(Self_Intro self) throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "insert into self_intro values (?,?,?,?)";
		try {
			conn = getConnection();
			Statement stmt = conn.createStatement();
			rs = stmt.executeQuery("select self_intro_seq.nextVal from dual");
			if (rs.next()) {
				self.setSi_num(rs.getInt(1));
			}
			rs.close();
			stmt.close();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, self.getSi_num());
			pstmt.setString(2, self.getM_id());
			pstmt.setString(3, self.getSi_ques());
			pstmt.setString(4, self.getSi_content());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return result;
	}

	// 자기소개서 가져오기
	public Self_Intro self_select(int si_num, String m_id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Self_Intro self = new Self_Intro();
		String sql = "SELECT * FROM self_intro WHERE si_num=? and m_id=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, si_num);
			pstmt.setString(2, m_id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				self.setSi_num(rs.getInt(1));
				self.setM_id(rs.getString(2));
				self.setSi_ques(rs.getString(3));
				self.setSi_content(rs.getString(4));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}

		return self;
	}

	// 이력서 가져오기
	public Resume resume_select(int r_num, String m_id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Resume resume = new Resume();
		String sql = "SELECT * FROM resume WHERE r_num=? and m_id=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, r_num);
			pstmt.setString(2, m_id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				resume.setR_num(rs.getInt(1));
				resume.setM_id(rs.getString(2));
				resume.setR_title(rs.getString(3));
				resume.setR_pic(rs.getString(4));
				resume.setR_file(rs.getString(5));
				resume.setR_date(rs.getDate("r_date"));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}

		return resume;
	}

	// 자기소개서 삭제
	public int self_delete(int si_num, String m_id) throws SQLException {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;

		String sql = "delete FROM self_intro WHERE si_num=? and m_id=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, si_num);
			pstmt.setString(2, m_id);
			pstmt.executeUpdate();
			result = 1;

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}

		return result;
	}

	// 자기소개서 수정
	public int self_update(Self_Intro self) throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update self_intro set si_ques=?, si_content=? where si_num=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, self.getSi_ques());
			pstmt.setString(2, self.getSi_content());
			pstmt.setInt(3, self.getSi_num());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return result;
	}

	// 이력서 수정
	public int resume_update(Resume resume) throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update resume set r_title=?, r_pic=?, r_file=?, r_date=sysdate where r_num=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, resume.getR_title());
			pstmt.setString(2, resume.getR_pic());
			pstmt.setString(3, resume.getR_file());
			pstmt.setInt(4, resume.getR_num());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return result;
	}

	// 이력서 추가
	public int resuemPreAdd(Resume resume) throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "insert into resume (r_num, m_id) values (?,?)";
		try {
			conn = getConnection();
			Statement stmt = conn.createStatement();
			rs = stmt.executeQuery("select resume_seq.nextVal from dual");
			if (rs.next()) {
				resume.setR_num(rs.getInt(1));
			}
			rs.close();
			stmt.close();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, resume.getR_num());
			pstmt.setString(2, resume.getM_id());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return result;
	}

	// 이력서 삭제
	public int resume_delete(int r_num, String m_id) throws SQLException {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;

		String sql = "delete FROM resume WHERE r_num=? and m_id=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, r_num);
			pstmt.setString(2, m_id);
			pstmt.executeUpdate();
			result = 1;

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}

		return result;
	}

	// 개인정보 수정
	public int update(Member member) throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update member set m_pass=?, m_birth=?, m_name=?, m_addr=?, m_email=?, m_phone=? where m_id=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getM_pass());
			pstmt.setString(2, member.getM_birth());
			pstmt.setString(3, member.getM_name());
			pstmt.setString(4, member.getM_addr());
			pstmt.setString(5, member.getM_email());
			pstmt.setString(6, member.getM_phone());
			pstmt.setString(7, member.getM_id());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return result;
	}

	// 아이디 찾기
	public String findId(String m_name, String m_email) throws SQLException {
		String m_id = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select m_id from member where m_name=? and m_email=?";
//		String sql = "select m_id from member where m_name=?" ;
		try {

			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_name);
			pstmt.setString(2, m_email);
			rs = pstmt.executeQuery();
//			System.out.println("rs.next(): "+rs.next());
			if (rs.next()) {
				m_id = rs.getString("m_id");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return m_id;
	}
	// 비밀번호 찾기 아이디 이름 이메일

	public String findPass(String m_email, String m_name, String m_id) throws SQLException {

		String m_pass = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select m_pass from member where m_name=? and m_email=? and m_id=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_email);
			pstmt.setString(2, m_name);
			pstmt.setString(3, m_id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				m_pass = rs.getString("m_pass");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}

		return m_pass;
	}
	
	public List<ApplyRecruit> my_list(String m_id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ApplyRecruit> al = new ArrayList<ApplyRecruit>();
		String sql = "select r.rc_name, r.rc_title, a.a_date from apply a, recruit r where a.rc_num=r.rc_num and m_id=?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs=pstmt.executeQuery();
			while (rs.next()) {
				ApplyRecruit ar = new ApplyRecruit();
				ar.setRc_name(rs.getString("rc_name"));
				ar.setRc_title(rs.getString("rc_title"));
				ar.setA_date(rs.getDate("a_date"));
				al.add(ar);
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) rs.close();
			if (conn != null) conn.close();
		}
		return al;
	}
	
	public List<RecruitDto> inter_list(String m_id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<RecruitDto> al2 = new ArrayList<RecruitDto>();
		String sql = "select r.rc_name, r.rc_title, r.rc_salary from recruit r, like_company l where r.rc_num=l.rc_num and l.m_id=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				RecruitDto rd = new RecruitDto();
				rd.setRc_name(rs.getString("rc_name"));
				rd.setRc_title(rs.getString("rc_title"));
				rd.setRc_salary(rs.getInt("rc_salary"));
				al2.add(rd);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return al2;		
	}
	
	public List<Resume> re_list(String m_id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Resume> al3 = new ArrayList<Resume>();
		String sql = "select r_title, r_date from resume where m_id=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Resume re = new Resume();
				re.setR_title(rs.getString("r_title"));
				re.setR_date(rs.getDate("r_date"));
				al3.add(re);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (conn != null) conn.close();
			if (pstmt != null) pstmt.close();
			if (rs != null) rs.close();
		}
		return al3;
		}
	
	public int applyCnt(String m_id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int aytot = 0;
		String sql = "select count(*) from apply where m_id=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				aytot = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if(conn!=null) conn.close();
			if(pstmt!=null) pstmt.close();
			if(rs!=null) rs.close();
		}
	return aytot;
	}
	
	public int interCnt(String m_id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int ittot = 0;
		String sql = "select count(*) from like_company where m_id=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				ittot = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if(conn!=null) conn.close();
			if(pstmt!=null) pstmt.close();
			if(rs!=null) rs.close();
		}
	return ittot;
	}
	
	public int resumeCnt2(String m_id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int tot = 0;

		String sql = "SELECT COUNT(*) FROM resume where m_id=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				tot = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return tot;
	}
	
	public int getTotalCnt() throws SQLException {
		Connection conn = null;	
		Statement stmt= null; 
		ResultSet rs = null;    
		int tot = 0;
		String sql = "select count(*) from member";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) tot = rs.getInt(1);
		} catch(Exception e) {	
			System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (stmt != null) stmt.close();
			if (conn !=null) conn.close();
		}
		return tot;
	}
	
	public List<Member> mb_list(int startRow, int endRow) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from (select rownum rn ,a.* from " + 
				" (select * from member order by m_name) a ) "+
				" where rn between ? and ?";
		List<Member> memberList = new ArrayList<Member>();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2,endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Member mb = new Member();
				mb.setM_id(rs.getString("m_id"));
				mb.setM_name(rs.getString("m_name"));
				mb.setM_gender(rs.getString("m_gender"));
				mb.setM_addr(rs.getString("m_addr"));
				mb.setM_birth(rs.getString("m_birth"));
				mb.setM_email(rs.getString("m_email"));
				mb.setM_phone(rs.getString("m_phone"));
				mb.setM_tf(rs.getString("m_tf"));
				mb.setRn(Integer.parseInt(rs.getString("rn")));
				memberList.add(mb);
		} 
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			if(conn!=null) conn.close();
			if(pstmt!=null) pstmt.close();
			if(rs!=null) rs.close();
		}
		return memberList;
	}
	
	public int tf_update(String m_id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "update member set m_tf=2 where m_id=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			result = pstmt.executeUpdate();			
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (conn != null) conn.close();
			if (pstmt != null) pstmt.close();		
	} return result;
	}
	
	public int tf_recover(String m_id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "update member set m_tf=1 where m_id=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			result = pstmt.executeUpdate();			
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (conn != null) conn.close();
			if (pstmt != null) pstmt.close();		
	} return result;
}
	
	public ArrayList<RecruitDto> rclist() throws SQLException { // rda는
		ArrayList<RecruitDto> rclist = new ArrayList<RecruitDto>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from recruit";

		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				RecruitDto rdt = new RecruitDto();
				rdt.setRc_num(rs.getInt("rc_num"));
				rdt.setRc_name(rs.getString("rc_name"));
				rdt.setRc_title(rs.getString("rc_title"));
				rdt.setRc_content(rs.getString("rc_content"));
				rdt.setRc_scrap(rs.getString("rc_scrap"));
				rdt.setRc_salary(rs.getInt("rc_salary"));
				rdt.setRc_view(rs.getInt("rc_view"));
				rdt.setRc_date(rs.getDate("rc_date"));
				rdt.setRc_link(rs.getString("rc_link"));
				rclist.add(rdt); // 데이터 베이스값이 들어간 Arraylist객체 rclist 생성하는 일을 하는 메소드 rclist
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
		return rclist; // 호출한 곳에 return 호출한곳은 오직 command뿐이므로 이 값이 command로 리턴된다라는 뜻이된다.
	}

	public RecruitDto popUpHireUnion(String name) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from recruit where rc_name=?";

		conn = getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		rs = pstmt.executeQuery();
		RecruitDto rdt = new RecruitDto();
		try {
			rs.next();
			rdt.setRc_num(rs.getInt("rc_num"));
			rdt.setRc_name(rs.getString("rc_name"));
			rdt.setRc_title(rs.getString("rc_title"));
			rdt.setRc_content(rs.getString("rc_content"));
			rdt.setRc_scrap(rs.getString("rc_scrap"));
			rdt.setRc_salary(rs.getInt("rc_salary"));
			rdt.setRc_view(rs.getInt("rc_view"));
			rdt.setRc_date(rs.getDate("rc_date"));
			rdt.setRc_link(rs.getString("rc_link"));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}

		return rdt;

	}

	public ArrayList<Member> md_searching(String type, String keyword, int startRow, int endRow) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Member> searchlist = new ArrayList<Member>();
		
		String sql = "select * from (select rownum rn ,a.* from (select * from member where m_id like '%"+keyword+"%' order by m_name) a ) " + " where rn between ? and ?";
		String sql1 = "select * from (select rownum rn ,a.* from (select * from member where m_name like '%"+keyword+"%' order by m_name) a ) "+ " where rn between ? and ?";
   		conn = getConnection();
   		
		try {			    
			if (type.equals("id")) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					Member mb = new Member();
					mb.setRn(Integer.parseInt(rs.getString("rn")));
					mb.setM_id(rs.getString("m_id"));
					mb.setM_name(rs.getString("m_name"));
					mb.setM_birth(rs.getString("m_birth"));
					mb.setM_gender(rs.getString("m_gender"));
					mb.setM_email(rs.getString("m_email"));
					mb.setM_phone(rs.getString("m_phone"));
					mb.setM_addr(rs.getString("m_addr"));					
					mb.setM_tf(rs.getString("m_tf"));
					System.out.println("m_id: "+mb.getM_id());
					searchlist.add(mb);
				}
				rs.close();
				pstmt.close();
			} // if
			
			if (type.equals("name")) {
				pstmt = conn.prepareStatement(sql1);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					Member mb = new Member();
					mb.setRn(Integer.parseInt(rs.getString("rn")));
					mb.setM_id(rs.getString("m_id"));
					mb.setM_name(rs.getString("m_name"));
					mb.setM_birth(rs.getString("m_birth"));
					mb.setM_gender(rs.getString("m_gender"));
					mb.setM_email(rs.getString("m_email"));
					mb.setM_phone(rs.getString("m_phone"));
					mb.setM_addr(rs.getString("m_addr"));					
					mb.setM_tf(rs.getString("m_tf"));
					System.out.println("m_name: "+mb.getM_name());
					searchlist.add(mb);
				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		} finally {
			if (pstmt != null) pstmt.close();
			if (rs != null)	rs.close();
			if (conn != null)conn.close();
		}
		return searchlist;
	}
	
	public int getTotalCnt(String type, String keyword) throws SQLException {
		Connection conn = null;	
		Statement stmt= null; 
		ResultSet rs = null;    
		int tot = 0;
		String sql;
		if(type.equals("id")) {
			sql = "select count(*) from member where m_id like '%"+keyword+"%'";
		}
		else {
			sql = "select count(*) from member where m_name like '%"+keyword+"%'";
		}		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) tot = rs.getInt(1);
		} catch(Exception e) {	
			System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (stmt != null) stmt.close();
			if (conn !=null) conn.close();
		}
		return tot;
	}
}
