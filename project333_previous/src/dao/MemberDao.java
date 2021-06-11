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

		String sql = "select m_pass from member where m_id = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				if (rs.getString("m_pass").equals(m_pass)) {
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
}
