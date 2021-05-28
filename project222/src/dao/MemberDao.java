package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
				if(rs.getString("m_pass").equals(m_pass)) {
					return 1;	//성공
				} else {
					return 0;	//실패
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
	
	public int join(Member member) throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "insert into member values (?,?,?,?,?,?,?,?,0)";
		
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
				member.setM_pic(rs.getNString(9));
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
}
