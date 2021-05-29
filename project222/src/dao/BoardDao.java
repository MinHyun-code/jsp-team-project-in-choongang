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

public class BoardDao {
	private static BoardDao instance;
	private BoardDao() {	
	}
	public static BoardDao getInstance() {
		if (instance == null) {
			instance = new BoardDao();
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
	
	
	//CommunityListAction
	public List<Board> list(int startRow, int endRow) throws SQLException {
		List<Board> list = new ArrayList<Board>();
		Connection conn = null;	
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		 String sql = "select * from (select rownum rn ,a.* from " + 
			"  (select * from board order by ref desc,re_step) a ) "+
			" where rn between ? and ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Board board = new Board();
				board.setBd_code(rs.getInt("bd_code"));
				board.setBd_num(rs.getInt("bd_num"));
				board.setM_id(rs.getString("m_id"));
				board.setSubject(rs.getString("subject"));
				board.setRead_count(rs.getInt("read_count"));
				board.setRef(rs.getInt("ref"));
				board.setRe_level(rs.getInt("re_level"));
				board.setRe_step(rs.getInt("re_step"));
				board.setReg_date(rs.getTimestamp("reg_date"));
				list.add(board);
			}
		} catch(Exception e) {	
			System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		} 
		return list;
	}
	public int getTotalCnt() throws SQLException {
		Connection conn = null;	
		Statement stmt= null; 
		ResultSet rs = null;    
		int tot = 0;
		String sql = "select count(*) from board";
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
	
	
	//CommunityContentAction
	public void readCount(int bd_code, int bd_num) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt= null; 
		String sql="update board set read_count=read_count+1 where bd_code=? and bd_num=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bd_code);
			pstmt.setInt(2, bd_num);			
			pstmt.executeUpdate();
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return;
	}
	public Board select(int bd_code, int bd_num) throws SQLException {
		Connection conn = null;	
		Statement stmt= null; 
		ResultSet rs = null;
		String sql = "select * from board where bd_code="+bd_code+"and bd_num="+bd_num;
		Board board = new Board();
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {				
				board.setBd_code(rs.getInt("bd_code"));
				board.setBd_num(rs.getInt("bd_num"));
				board.setM_id(rs.getString("m_id"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setCategory(rs.getInt("category"));
				board.setRead_count(rs.getInt("read_count"));
				board.setReg_date(rs.getTimestamp("reg_date"));
				board.setRef(rs.getInt("ref"));
				board.setRe_level(rs.getInt("re_level"));
				board.setRe_step(rs.getInt("re_step"));
			}
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (stmt != null) stmt.close();
			if (conn !=null) conn.close();
		}
		return board;
	}
	
	//CommunityWriteProAction
	public int insert(Board board) throws SQLException  {
		System.out.println("--BoardDao.insert");
		int bd_code = board.getBd_code();
		Connection conn = null;	
		PreparedStatement pstmt= null; 
		int result = 0;			
		ResultSet rs = null;
		// 두가지 방법 --> 1) MAX    2) sequence
		String sql1 = "select nvl(max(bd_num),0)  from board where bd_code = ?";
		String sql="INSERT INTO board VALUES(?,?,?,?,?, ?,?,SYSDATE,?,?, ?,?,?,?)";
		
		try {			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, bd_code);
			rs = pstmt.executeQuery();
			rs.next();
			// key인 num 1씩 증가, mysql auto_increment 또는 oracle sequence
			// sequence를 사용 : values(시퀀스명(board_seq).nextval,?,?...)
			int bd_num = rs.getInt(1) + 1; 
			System.out.println(bd_num);
			board.setBd_num(bd_num);
			board.setRef(bd_num);
			rs.close();   
			pstmt.close();
			
			// 신규 등록 이면 , MAX  num을 board.setRef에 setting 
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board.getBd_code());
			pstmt.setInt(2, board.getBd_num());
			pstmt.setString(3, board.getM_id());
			pstmt.setString(4, board.getSubject());
			pstmt.setString(5, board.getContent());
			pstmt.setInt(6, board.getCategory());
			pstmt.setInt(7, board.getRead_count());
			pstmt.setString(8, board.getTags());
			pstmt.setInt(9, board.getIs_adopted());
			pstmt.setString(10, board.getFile_name());
			pstmt.setInt(11, board.getRef());
			pstmt.setInt(12, board.getRe_step());
			pstmt.setInt(13, board.getRe_level());
			result = pstmt.executeUpdate(); 
		} catch(Exception e) {	
			e.printStackTrace();
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return result;	
    }
	
	// CommunityDeleteProAction
	public int delete(int bd_code, int bd_num, String m_id) throws SQLException {
		Connection conn = null;	
		PreparedStatement pstmt= null; 
		int result = 0;			
		ResultSet rs = null;
		String sql="DELETE FROM board WHERE bd_code = ? AND bd_num = ? AND m_id = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bd_code);
			pstmt.setInt(2, bd_num);
			pstmt.setString(3, m_id);
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
