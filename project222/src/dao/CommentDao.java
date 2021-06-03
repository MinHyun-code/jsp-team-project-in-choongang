package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CommentDao {
	private static CommentDao instance;

	private CommentDao() {
	}

	public static CommentDao getInstance() {
		if (instance == null) {
			instance = new CommentDao();
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

	public List<Comment> select(Board board) throws SQLException {
		List<Comment> list = new ArrayList<Comment>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT * FROM (SELECT ROWNUM rn, a.* FROM (SELECT * FROM comments ORDER BY ref, re_step) a) WHERE bd_code = ? and bd_num = ?";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board.getBd_code());
			pstmt.setInt(2, board.getBd_num());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Comment comment = new Comment();
				comment.setBd_code(rs.getInt("bd_code"));
				comment.setBd_num(rs.getInt("bd_num"));
				comment.setBd_cm_num(rs.getInt("bd_cm_num"));
				comment.setM_id(rs.getString("m_id"));
				comment.setContent(rs.getString("content"));
				comment.setReg_date(rs.getTimestamp("reg_date"));
				comment.setRef(rs.getInt("ref"));
				comment.setRe_step(rs.getInt("re_step"));
				comment.setRe_level(rs.getInt("re_level"));
				list.add(comment);
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

		return list;

	}

	public int insertReply(Comment comment) throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int insertedRef = comment.getRef();
		int insertedRe_level = comment.getRe_level() + 1;
		
		String sqlMaxBd_cd_num = "SELECT MAX(bd_cm_num) FROM comments WHERE bd_code = ? AND bd_num = ?";
		String sqlSearchRe_step = "SELECT NVL(MIN(re_step), -3) FROM comments WHERE bd_code = ? AND bd_num = ? AND ref = ? AND re_step > ? AND re_level <= ? ";
		String sqlMaxRe_step = "SELECT MAX(re_step) FROM comments WHERE bd_code = ? AND bd_num = ? AND ref = ?";
		String sqlUpdateRe_step = "UPDATE comments SET re_step = re_step + 1 WHERE bd_code = ? AND bd_num = ? AND ref = ? AND re_step >= ?";
		String sqlInsertReply = "INSERT INTO comments VALUES (?, ?, ?, ?, ?,    SYSDATE, ?, ?, ?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sqlMaxBd_cd_num);
			pstmt.setInt(1, comment.getBd_code());
			pstmt.setInt(2, comment.getBd_num());
			rs = pstmt.executeQuery();
			rs.next(); // as reply, no check It's null.
			int insertedBd_cm_num= rs.getInt(1) + 1; // inserted bd_cm_num
			pstmt.close();
			rs.close();
			
			pstmt = conn.prepareStatement(sqlSearchRe_step);
			pstmt.setInt(1, comment.getBd_code());
			pstmt.setInt(2, comment.getBd_num());
			pstmt.setInt(3, comment.getRef());
			pstmt.setInt(4, comment.getRe_step());
			pstmt.setInt(5, comment.getRe_level());
			rs = pstmt.executeQuery();
			int insertedRe_step = -1;
			if(rs.next()) {
				insertedRe_step = rs.getInt(1);
			}
			pstmt.close();
			rs.close();
			if(insertedRe_step < 0) {
				pstmt = conn.prepareStatement(sqlMaxRe_step);
				pstmt.setInt(1, comment.getBd_code());
				pstmt.setInt(2, comment.getBd_num());
				pstmt.setInt(3, comment.getRef());
				rs = pstmt.executeQuery();
				rs.next();
				insertedRe_step = rs.getInt(1) + 1;
				pstmt.close();
				rs.close();
			}

			pstmt = conn.prepareStatement(sqlUpdateRe_step);
			pstmt.setInt(1, comment.getBd_code());
			pstmt.setInt(2, comment.getBd_num());
			pstmt.setInt(3, comment.getRef());			
			pstmt.setInt(4, insertedRe_step);	
			pstmt.executeUpdate();
			pstmt.close();
			
			pstmt = conn.prepareStatement(sqlInsertReply);
			pstmt.setInt(1, comment.getBd_code());
			pstmt.setInt(2, comment.getBd_num());
			pstmt.setInt(3, insertedBd_cm_num);
			pstmt.setString(4,comment.getM_id());
			pstmt.setString(5,comment.getContent());
			pstmt.setInt(6, insertedRef);
			pstmt.setInt(7, insertedRe_step);
			pstmt.setInt(8, insertedRe_level);
			pstmt.executeUpdate();
			pstmt.close();
			
			System.out.println("insertedBd_cm_num: " + insertedBd_cm_num);
			System.out.println("insertedRef: " + insertedRef);
			System.out.println("insertedRe_step: " + insertedRe_step);
			System.out.println("insertedRe_level: " + insertedRe_level);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}

		return result;
	}
	
	public int delete(Comment comment) throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "DELETE FROM comments WHERE bd_code = ? AND bd_num = ? AND bd_cm_num = ? AND m_id = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, comment.getBd_code());
			pstmt.setInt(2, comment.getBd_num());
			pstmt.setInt(3, comment.getBd_cm_num());
			pstmt.setString(4, comment.getM_id());
			pstmt.executeUpdate();			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();			
		}
		
		return result;
	}
	
	public int write(Comment comment) throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sqlMaxBd_cd_num = "SELECT MAX(bd_cm_num) FROM comments WHERE bd_code = ? AND bd_num = ?";
		String sqlInsertReply = "INSERT INTO comments VALUES (?, ?, ?, ?, ?,    SYSDATE, ?, ?, ?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sqlMaxBd_cd_num);
			pstmt.setInt(1, comment.getBd_code());
			pstmt.setInt(2, comment.getBd_num());
			rs = pstmt.executeQuery();
			rs.next(); // as reply, no check It's null.
			int insertedBd_cm_num= rs.getInt(1) + 1; // inserted bd_cm_num
			pstmt.close();
			rs.close();
			
			pstmt = conn.prepareStatement(sqlInsertReply);
			pstmt.setInt(1, comment.getBd_code());
			pstmt.setInt(2, comment.getBd_num());
			pstmt.setInt(3, insertedBd_cm_num);
			pstmt.setString(4,comment.getM_id());
			pstmt.setString(5,comment.getContent());
			pstmt.setInt(6, insertedBd_cm_num);
			pstmt.setInt(7, 1);
			pstmt.setInt(8, 1);
			pstmt.executeUpdate();
			pstmt.close();
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();			
		}
		
		return result;
	}
	
	public int deleteForBoard(int bd_code, int bd_num) throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "DELETE FROM comments WHERE bd_code = ? AND bd_num = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bd_code);
			pstmt.setInt(2, bd_num);
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();	
		}
		
		return result;
	}
}
