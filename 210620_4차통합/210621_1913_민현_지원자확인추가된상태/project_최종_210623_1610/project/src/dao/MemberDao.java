package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDao {

	
	public static final int joinedIndividual = 1;
	public static final int closedIndividual = 2;
	public static final int joinedCompany = 0;
	public static final int closedCompany = 22;

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
					if (rs.getString("m_tf").equals("2")) {
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
			pstmt.setString(9, "1");
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
	
	// 기업 회원가입
	public int companyJoin(Member member) throws SQLException {
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
			pstmt.setString(9, "0");
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

	// m_tf 조회
	public String m_tfCheck(String m_id) throws SQLException {
		String result = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select m_tf from member where m_id = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getString(1);
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
	public int resumeCnt(String m_id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int tot = 0;

		String sql = "SELECT COUNT(*) FROM resume where m_id = ?";
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

	// 개인 자기소개서 갯수
	public int introCnt(String m_id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int tot = 0;

		String sql = "SELECT COUNT(*) FROM self_intro where m_id = ?";
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

	// 이력서 리스트 보기
	public List<Resume> resume_list(int startRow, int endRow, String m_id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Resume> al = new ArrayList<Resume>();

//		String sql = "SELECT * FROM (SELECT rownum rn, a.* FROM (SELECT * FROM resume) a) WHERE rn BETWEEN ? AND ? and m_id=?";
		String sql = "SELECT * FROM (SELECT rownum rn, a.* FROM (SELECT * FROM resume WHERE m_id=?) a) WHERE rn BETWEEN ? AND ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			pstmt.setString(1, m_id);
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

		String sql = "SELECT * FROM (SELECT rownum rn, a.* FROM (SELECT * FROM self_intro WHERE m_id=?) a) WHERE rn BETWEEN ? AND ?";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			pstmt.setString(1, m_id);
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
	public int resumePreAdd(Resume resume) throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "insert into resume (r_num, m_id, r_title, r_date) values (?,?,?, sysdate)";
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
			pstmt.setString(3, "제목 미입력");
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

	// 이력서 (자기소개서) 추가
	public int resumeIntroAdd(int r_num, int si_num) throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "insert into re_self_rel (r_num, si_num) values (?,?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, r_num);
			pstmt.setInt(2, si_num);
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

	// 이력서 (자격증) 추가
	public int resumeLicenceAdd(int r_num, int lc_num, String mylc_date) throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "insert into my_licence values (?, ?, ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, r_num);
			pstmt.setInt(2, lc_num);
			pstmt.setString(3, mylc_date);
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

	// 이력서 (학력) 추가
	public int resumeEduAdd(int r_num, int edu_num, String myedu_sdate, String myedu_edate, int edu_type)
			throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "insert into my_edu values (?, ?, ?, ?, ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, r_num);
			pstmt.setInt(2, edu_num);
			pstmt.setString(3, myedu_sdate);
			pstmt.setString(4, myedu_edate);
			pstmt.setInt(5, edu_type);
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

	// 이력서 (경력) 추가
	public int resumeCareerAdd(int r_num, String cr_name, String cr_grade, int cr_salary, String cr_job,
			String cr_sdate, String cr_edate) throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "insert into career values (?, ?, ?, ?, ?, ?, ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, r_num);
			pstmt.setString(2, cr_name);
			pstmt.setString(3, cr_grade);
			pstmt.setInt(4, cr_salary);
			pstmt.setString(5, cr_job);
			pstmt.setString(6, cr_sdate);
			pstmt.setString(7, cr_edate);
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
	

	// 이력서 (경력) 추가
	public int resumeCareerUpdate(int r_num, String cr_name, String cr_grade, int cr_salary, String cr_job,
			String cr_sdate, String cr_edate) throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "update career set cr_name = ?, cr_grade, cr_salary=?, cr_job=?, cr_sdate=?, cr_edate=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, r_num);
			pstmt.setString(2, cr_name);
			pstmt.setString(3, cr_grade);
			pstmt.setInt(4, cr_salary);
			pstmt.setString(5, cr_job);
			pstmt.setString(6, cr_sdate);
			pstmt.setString(7, cr_edate);
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

	// 검색된 자격증 수
	public int getLicenceTotalCnt(String replacedWord) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int tot = 0;

		String sql = "SELECT COUNT(*) FROM licence where lc_name like ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + replacedWord + "%");
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

	// 검색된 학력 수
	public int getEduTotalCnt(String replacedWord) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int tot = 0;

		String sql = "SELECT COUNT(*) FROM edu where edu_school like ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + replacedWord + "%");
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

	// 자격증 리스트 팝업
	public List<Licence> listLicenceSearch(String replacedWord) throws SQLException {
		List<Licence> list = new ArrayList<Licence>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from licence where lc_name like ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + replacedWord + "%");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Licence licence = new Licence();
				licence.setLc_num(rs.getInt("lc_num"));
				licence.setLc_organ(rs.getString("lc_organ"));
				licence.setLc_name(rs.getString("lc_name"));
				list.add(licence);
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
		return list;
	}

	// 학력 리스트 팝업
	public List<Edu> listEduSearch(String replacedWord) throws SQLException {
		List<Edu> list = new ArrayList<Edu>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from edu where edu_school like ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + replacedWord + "%");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Edu edu = new Edu();
				edu.setEdu_num(rs.getInt("edu_num"));
				edu.setEdu_school(rs.getString("edu_school"));
				edu.setEdu_job(rs.getString("edu_job"));
				list.add(edu);
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
		return list;
	}

	// 이력서(학력) 가져오기
	public List<Resume_Edu> edu_select(int r_num, String m_id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Resume_Edu> list = new ArrayList<Resume_Edu>();

		String sql = "SELECT r.r_num, r.m_id, r.r_pic, r.r_file, r.r_date, m.edu_num, "
				+ "m.myedu_sdate, m.myedu_edate, m.edu_type, e.edu_school, e.edu_job "
				+ "FROM resume r, my_edu m, edu e WHERE r.r_num = m.r_num AND m.edu_num = e.edu_num "
				+ "and r.r_num = ? and r.m_id = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, r_num);
			pstmt.setString(2, m_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Resume_Edu r_edu = new Resume_Edu();
				r_edu.setR_num(rs.getInt(1));
				r_edu.setM_id(rs.getString(2));
				r_edu.setR_pic(rs.getString(3));
				r_edu.setR_file(rs.getString(4));
				r_edu.setR_date(rs.getDate(5));
				r_edu.setEdu_num(rs.getInt(6));
				r_edu.setMyedu_sdate(rs.getString(7));
				r_edu.setMyedu_edate(rs.getString(8));
				r_edu.setEdu_type(rs.getString(9));
				r_edu.setEdu_school(rs.getString(10));
				r_edu.setEdu_job(rs.getString(11));
				list.add(r_edu);
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

		return list;
	}

	// 이력서(경력) 가져오기
	public List<Career> career_select(int r_num, String m_id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Career> list = new ArrayList<Career>();

		String sql = "SELECT c.cr_name, c.cr_grade, c.cr_salary, c.cr_job, c.cr_sdate, "
				+ "c.cr_edate FROM resume r, career c  WHERE r.r_num = c.r_num " + "and r.r_num = ? and r.m_id = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, r_num);
			pstmt.setString(2, m_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Career career = new Career();
				career.setCr_name(rs.getString(1));
				career.setCr_grade(rs.getString(2));
				career.setCr_salary(rs.getInt(3));
				career.setCr_job(rs.getString(4));
				career.setCr_sdate(rs.getString(5));
				career.setCr_edate(rs.getString(6));
				list.add(career);
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

		return list;
	}

	// 이력서(자기소개서) 가져오기
	public List<Resume_Intro> intro_select(int r_num, String m_id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Resume_Intro> list = new ArrayList<Resume_Intro>();

		String sql = "SELECT rs.si_num, rs.si_order, s.si_ques, s.si_content "
				+ "FROM resume re, re_self_rel rs, self_intro s WHERE re.r_num = rs.r_num AND "
				+ "rs.si_num = s.si_num and re.r_num = ? and re.m_id = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, r_num);
			pstmt.setString(2, m_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Resume_Intro r_intro = new Resume_Intro();
				r_intro.setSi_num(rs.getInt(1));
				r_intro.setSi_order(rs.getInt(2));
				r_intro.setSi_ques(rs.getString(3));
				r_intro.setSi_content(rs.getString(4));
				list.add(r_intro);
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

		return list;
	}

	// 이력서(자격증) 가져오기
	public List<Resume_Licence> licence_select(int r_num, String m_id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Resume_Licence> list = new ArrayList<Resume_Licence>();

		String sql = "SELECT m.lc_num, m.mylc_date, l.lc_name, l.lc_organ FROM resume r, my_licence m, "
				+ "licence l WHERE r.r_num = m.r_num AND l.lc_num = m.lc_num " + "and r.r_num = ? and r.m_id = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, r_num);
			pstmt.setString(2, m_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Resume_Licence r_licence = new Resume_Licence();
				r_licence.setLc_num(rs.getInt(1));
				r_licence.setMylc_date(rs.getString(2));
				r_licence.setLc_name(rs.getString(3));
				r_licence.setLc_organ(rs.getString(4));
				list.add(r_licence);
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

		return list;
	}

	// 이력서 (자기소개서) 삭제
	public int resume_intro_delete(int r_num) throws SQLException {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;

		String sql = "delete FROM re_self_rel WHERE r_num=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, r_num);
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

	// 이력서 (학력) 삭제
	public int resume_myedu_delete(int r_num) throws SQLException {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;

		String sql = "delete FROM my_edu WHERE r_num=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, r_num);
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

	// 이력서 (자격증) 삭제
	public int resume_licence_delete(int r_num) throws SQLException {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;

		String sql = "delete FROM my_licence WHERE r_num=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, r_num);
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

	// 이력서 (경력) 삭제
	public int resume_career_delete(int r_num) throws SQLException {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;

		String sql = "delete FROM career WHERE r_num=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, r_num);
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
	
	// 이력서 (지원현황) 삭제
	public int resume_apply_delete(int r_num) throws SQLException {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;

		String sql = "delete FROM apply WHERE r_num=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, r_num);
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

	// 마이페이지 (지원현황)
		public List<ApplyRecruit> my_list(String m_id) throws SQLException {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			ArrayList<ApplyRecruit> al = new ArrayList<ApplyRecruit>();
			String sql = "select r.rc_name, r.rc_title, a.a_date, a.rc_num, a.ap_cnt from apply a, recruit r where a.rc_num=r.rc_num and m_id=?";

			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, m_id);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					ApplyRecruit ar = new ApplyRecruit(); // 객체를 만듬
					ar.setRc_name(rs.getString("rc_name"));
					ar.setRc_title(rs.getString("rc_title"));
					ar.setA_date(rs.getDate("a_date"));
					ar.setRc_num(rs.getInt("rc_num"));
					ar.setAp_cnt(rs.getInt("ap_cnt"));
					al.add(ar); // 단일객체를 더해줌
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
		
		// 마이페이지 (지원완료)
		public List<ApplyRecruit> my_list2(String m_id) throws SQLException {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			ArrayList<ApplyRecruit> al = new ArrayList<ApplyRecruit>();
			String sql = "select r.rc_name, r.rc_title, a.a_date from apply a, recruit r where a.rc_num=r.rc_num and ap_cnt=1 and m_id=?";

			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, m_id);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					ApplyRecruit ar = new ApplyRecruit(); // 객체를 만듬
					ar.setRc_name(rs.getString("rc_name"));
					ar.setRc_title(rs.getString("rc_title"));
					ar.setA_date(rs.getDate("a_date"));
					al.add(ar); // 단일객체를 더해줌
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

	// 마이페이지 (관심공고)
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
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return al2;
	}

	// 마이페이지 (이력서)
	public List<Resume> re_list(String m_id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Resume> al3 = new ArrayList<Resume>();
		String sql = "select * from resume where m_id=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Resume re = new Resume();
				re.setR_num(rs.getInt("r_num"));
				re.setR_title(rs.getString("r_title"));
				re.setR_date(rs.getDate("r_date"));
				al3.add(re);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (conn != null)
				conn.close();
			if (pstmt != null)
				pstmt.close();
			if (rs != null)
				rs.close();
		}
		return al3;
	}

	// 지원완료 개수
	public int applyCnt(String m_id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int aytot = 0;
		String sql = "select count(*) from apply where ap_cnt=1 and m_id=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				aytot = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (conn != null)
				conn.close();
			if (pstmt != null)
				pstmt.close();
			if (rs != null)
				rs.close();
		}
		return aytot;
	}

	// 지원취소 현황
	public int ap_cnt(String m_id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int ap_cnt = 2;
		String sql = "select count(*) from apply where ap_cnt=2 and m_id=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				ap_cnt = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (conn != null)
				conn.close();
			if (pstmt != null)
				pstmt.close();
			if (rs != null)
				rs.close();
		}
		return ap_cnt;
	}

	// 관심공고 개수
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
			if (rs.next()) {
				ittot = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (conn != null)
				conn.close();
			if (pstmt != null)
				pstmt.close();
			if (rs != null)
				rs.close();
		}
		return ittot;
	}

	// 지원하기
	public List<Resume> resume_list(String m_id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Resume> al = new ArrayList<Resume>();

		String sql = "SELECT * FROM (SELECT rownum rn, a.* FROM (SELECT * FROM resume) a) WHERE m_id=?";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Resume resume = new Resume();
				resume.setR_num(rs.getInt("r_num"));
				System.out.println("rs.getString(\"r_title\")" + rs.getString("r_title"));
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

	// 지원 추가
	public int applyAdd(Apply apply) throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "insert into apply values (?,?,?,sysdate,1)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, apply.getM_id());
			pstmt.setInt(2, apply.getRc_num());
			pstmt.setInt(3, apply.getR_num());
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

	// 아이디 중복체크
	public int checkId(String m_id) throws SQLException {
		int result = 0;
		Connection conn = null;
		String sql = "select m_id from member where m_id=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			if (rs.next())
				result = 1;
			else
				result = 0;

		} catch (Exception e) {
			System.out.println();
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

	// 지원 조회
	public int applyCheck(String m_id, int rc_num) throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from apply where m_id = ? and rc_num = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			pstmt.setInt(2, rc_num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = 1;
			} else {
				result = 0;
			}
			System.out.println("result in applyCheck: " + result);
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
	//지원취소
	public int myapply_delete( String m_id, int rc_num) throws SQLException {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;

		String sql = "UPDATE apply SET ap_cnt = 2 where m_id = ? and rc_num = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			pstmt.setInt(2, rc_num);
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
	
	// 채용 공고에 대한 회사 리스트 조회
	public List<Member> selectCompany(List<RecruitDto> rclist1) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Member> listCompany = new ArrayList<Member>();
		ArrayList<Member> listCompanyTemp = new ArrayList<Member>();

		String sql = "SELECT * FROM member WHERE m_tf=0";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Member member = new Member();
				member.setM_id(rs.getString(1));
				member.setM_pass(rs.getString(2));
				member.setM_birth(rs.getString(3));
				member.setM_name(rs.getString(4));
				member.setM_addr(rs.getString(5));
				member.setM_gender(rs.getString(6));
				member.setM_email(rs.getString(7));
				member.setM_phone(rs.getString(8));
				member.setM_tf(rs.getString(9));
				listCompanyTemp.add(member);
			}

			for (RecruitDto recruit : rclist1) {
				Member company = new Member();
				for (Member member : listCompanyTemp) {
					if (recruit.getRc_name().equals(member.getM_id())) {
						company.setM_id(member.getM_id());
						company.setM_pass(member.getM_pass());
						company.setM_birth(member.getM_birth());
						company.setM_name(member.getM_name());
						company.setM_addr(member.getM_addr());
						company.setM_gender(member.getM_gender());
						company.setM_email(member.getM_email());
						company.setM_phone(member.getM_phone());
						company.setM_tf(member.getM_tf());
						break;
					}
				}
				listCompany.add(company);
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return listCompany;
	}
	public int getTotalCnt() throws SQLException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int tot = 0;
		String sql = "select count(*) from member";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next())
				tot = rs.getInt(1);
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
		return tot;
	}

	public List<Member> mb_list(int startRow, int endRow) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from (select rownum rn ,a.* from " + " (select * from member order by m_name) a ) "
				+ " where rn between ? and ?";
		List<Member> memberList = new ArrayList<Member>();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
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
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (conn != null)
				conn.close();
			if (pstmt != null)
				pstmt.close();
			if (rs != null)
				rs.close();
		}
		return memberList;
	}

	public int tf_get(String m_id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sqlGetM_tf = "SELECT m_tf FROM member WHERE m_id = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sqlGetM_tf);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			rs.next();
			result = Integer.parseInt(rs.getString(1));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null)
				conn.close();
			if (pstmt != null)
				pstmt.close();
			if (rs != null)
				rs.close();
		}
		return result;
	}

	public int tf_update(String m_id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		int m_tf = tf_get(m_id);
		System.out.println("m_tf in tf_update: " + m_tf);
		String sql = "update member set m_tf=? where m_id=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			if (m_tf == joinedIndividual)
				pstmt.setInt(1, closedIndividual);
			else if (m_tf == joinedCompany)
				pstmt.setInt(1, closedCompany);
			pstmt.setString(2, m_id);
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		} finally {
			if (conn != null)
				conn.close();
			if (pstmt != null)
				pstmt.close();
		}
		return result;
	}

	public int tf_recover(String m_id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		int m_tf = tf_get(m_id);
		String sql = "update member set m_tf=? where m_id=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			if (m_tf == closedIndividual)
				pstmt.setInt(1, joinedIndividual);
			else if (m_tf == closedCompany)
				pstmt.setInt(1, joinedCompany);
			pstmt.setString(2, m_id);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		} finally {
			if (conn != null)
				conn.close();
			if (pstmt != null)
				pstmt.close();
		}
		return result;
	}

	public ArrayList<Member> md_searching(String type, String keyword, int startRow, int endRow) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Member> searchlist = new ArrayList<Member>();

		String sql = "select * from (select rownum rn ,a.* from (select * from member where m_id like '%" + keyword
				+ "%' order by m_name) a ) " + " where rn between ? and ?";
		String sql1 = "select * from (select rownum rn ,a.* from (select * from member where m_name like '%" + keyword
				+ "%' order by m_name) a ) " + " where rn between ? and ?";
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
					System.out.println("m_id: " + mb.getM_id());
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
					System.out.println("m_name: " + mb.getM_name());
					searchlist.add(mb);
				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (rs != null)
				rs.close();
			if (conn != null)
				conn.close();
		}
		return searchlist;
	}

	public int getTotalCnt(String type, String keyword) throws SQLException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int tot = 0;
		String sql;
		if (type.equals("id")) {
			sql = "select count(*) from member where m_id like '%" + keyword + "%'";
		} else {
			sql = "select count(*) from member where m_name like '%" + keyword + "%'";
		}
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next())
				tot = rs.getInt(1);
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
		return tot;
	}

	public int md_joinCnt() throws SQLException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int tot = 0;
		String sql = "select count(*) from member where m_tf=1 or m_tf=0";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next())
				tot = rs.getInt(1);
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
		return tot;
	}

	public int md_wdCnt() throws SQLException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int tot = 0;
		String sql = "select count(*) from member where m_tf=2";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next())
				tot = rs.getInt(1);
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
		return tot;
	}

	public String read_id() throws SQLException {

		String m_id = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select m_id from board where read_count=(select max(read_count) from board)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				m_id = rs.getString("m_id");
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

		return m_id;
	}

	public String write_id() throws SQLException {

		String m_id = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select m_id from board group by m_id having count(*)=(select max(count(m_id)) from board group by m_id)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				m_id = rs.getString("m_id");
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

		return m_id;
	}

	public Date rc_date() throws SQLException {

		Date rc_date = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select max(rc_date) rc_date from recruit";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				rc_date = rs.getDate("rc_date");
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

		return rc_date;
	}

	public Date reg_date() throws SQLException {

		Date reg_date = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select max(reg_date) reg_date from board";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				reg_date = rs.getDate("reg_date");
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

		return reg_date;
	}

	public int delete(int rc_num) throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sqlInApply = "DELETE apply WHERE rc_num = ?";
		String sqlInLike_company = "DELETE like_company WHERE rc_num = ?";
		String sqlInClassify = "DELETE classify WHERE rc_num = ?";
		String sql = "DELETE recruit WHERE rc_num = ?";
		try {
			conn = getConnection();

			pstmt = conn.prepareStatement(sqlInApply);
			pstmt.setInt(1, rc_num);
			pstmt.executeUpdate();
			pstmt.close();

			pstmt = conn.prepareStatement(sqlInLike_company);
			pstmt.setInt(1, rc_num);
			pstmt.executeUpdate();
			pstmt.close();

			pstmt = conn.prepareStatement(sqlInClassify);
			pstmt.setInt(1, rc_num);
			pstmt.executeUpdate();
			pstmt.close();

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rc_num);
			result = pstmt.executeUpdate();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return result;
	}
}	
