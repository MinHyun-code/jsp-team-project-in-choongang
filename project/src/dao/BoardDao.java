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
	final int QnA = 2;
	
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
			e.printStackTrace();
		}
		return conn;
	}
	
	public Board rsToBoard(ResultSet rs, Board board) throws SQLException {
		board.setBd_code(rs.getInt("bd_code"));
		board.setBd_num(rs.getInt("bd_num"));
		board.setM_id(rs.getString("m_id"));
		board.setSubject(rs.getString("subject"));
		board.setContent(rs.getString("content"));
		board.setCategory(rs.getInt("category"));
		board.setRead_count(rs.getInt("read_count"));
		board.setReg_date(rs.getTimestamp("reg_date"));
		board.setTags(rs.getString("tags"));
		board.setIs_adopted(rs.getInt("is_adopted"));
		board.setFile_name(rs.getString("file_name"));
		board.setRef(rs.getInt("ref"));
		board.setRe_level(rs.getInt("re_level"));
		board.setRe_step(rs.getInt("re_step"));
		return board;	
	}
	
	
	
	
	
	//CommunityListAction
	public List<Board> list(int startRow, int endRow) throws SQLException {
		List<Board> list = new ArrayList<Board>();
		Connection conn = null;	
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		String sql = "select * from (select rownum rn ,a.* from " + 
			"  (select * from board WHERE re_level = 1 order by ref desc,re_step) a ) "+
			" where rn between ? and ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Board board = new Board();
				rsToBoard(rs, board);
				list.add(board);
			}
		} catch(Exception e) {	
			System.out.println(e.getMessage()); 
			e.printStackTrace();
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
		String sql = "SELECT count(*) FROM board WHERE re_level = 1";
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
				rsToBoard(rs, board);
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
		Connection conn = null;	
		PreparedStatement pstmt= null; 
		int result = 0;			
		ResultSet rs = null;
		String sql1 = "select nvl(max(bd_num),0)  from board";
		String sql="INSERT INTO board VALUES(?,?,?,?,?, ?,?,SYSDATE,?,?, ?,?,?,?)";
		
		try {			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			rs.next();
			int bd_num = rs.getInt(1) + 1; 
			System.out.println(bd_num);
			if(board.getBd_code() == QnA) {
				if(board.getRe_level() == 1) { //Question in QnA
					board.setRef(bd_num);
				} else { //Answer in QnA
					board.setRef(board.getBd_num());
				}
				board.setBd_num(bd_num); // warning: this overwrite already existing value 'board.bd_num'.
			} else {
				board.setBd_num(bd_num);
				board.setRef(bd_num);
			}
			rs.close();   
			pstmt.close();
			

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
	
	public int deleteAnswer(int bd_code, int bd_num) throws SQLException {
		Connection conn = null;	
		PreparedStatement pstmt= null; 
		int result = 0;			
		ResultSet rs = null;
		String sql="DELETE FROM board WHERE bd_code = ? AND ref = ?";
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
	
	//CommunityWriteProAction
	public int edit(Board board) throws SQLException {
		Connection conn = null;	
		PreparedStatement pstmt= null; 
		int result = 0;			
		ResultSet rs = null;
		String sql="UPDATE board SET subject=?, content=?, tags=? WHERE bd_code=? AND bd_num=? AND m_id=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getSubject());
			pstmt.setString(2, board.getContent());
			pstmt.setString(3, board.getTags());
			pstmt.setInt(4, board.getBd_code());
			pstmt.setInt(5, board.getBd_num());
			pstmt.setString(6, board.getM_id());
			result = pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return result;
	}
	
	//CommunityContentAction - to show answers
	public List<Board> selectAnswer(int bd_code, int bd_num) throws SQLException{
		List<Board> list = new ArrayList<Board>();
		Connection conn = null;	
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		String sql = "SELECT * FROM board WHERE bd_code = ? AND ref = ? AND re_level = 2";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bd_code);
			pstmt.setInt(2, bd_num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Board board = new Board();
				rsToBoard(rs, board);
				list.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return list;
	}
	
	public int searchMaxStep(int bd_num) throws SQLException {
		int result = -7;
		Connection conn = null;	
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		String sql = "SELECT MAX(re_step) FROM board WHERE ref = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bd_num);
			rs = pstmt.executeQuery();
			rs.next();
			result = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		
		return result;
	}
	
	//search in community main
	public List<Board> listSearch(int startRow, int endRow, String replacedWord) throws SQLException {
		List<Board> list = new ArrayList<Board>();
		Connection conn = null;	
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		String sql = "select * from (select rownum rn ,a.* from " + 
			"  (select * from board WHERE re_level = 1 and (REGEXP_LIKE (LOWER(subject), LOWER(?)) OR REGEXP_LIKE (LOWER(content), LOWER(?)) OR REGEXP_LIKE (LOWER(tags), LOWER(?))) order by ref desc,re_step) a ) "+
			" where (rn between ? and ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(4, startRow);
			pstmt.setInt(5, endRow);
			pstmt.setString(1, replacedWord);
			pstmt.setString(2, replacedWord);
			pstmt.setString(3, replacedWord);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Board board = new Board();
				rsToBoard(rs, board);
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
	
	public List<Board> listSearch(int startRow, int endRow, int bd_code) throws SQLException {
		List<Board> list = new ArrayList<Board>();
		Connection conn = null;	
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		String sql = "select * from (select rownum rn ,a.* from " + 
			"  (select * from board WHERE re_level = 1 and bd_code = ? order by ref desc,re_step) a ) "+
			" where (rn between ? and ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			pstmt.setInt(1, bd_code);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Board board = new Board();
				rsToBoard(rs, board);
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
	
	
	public int getTotalCnt(String replacedWord) throws SQLException {
		Connection conn = null;	
		PreparedStatement pstmt= null; 
		ResultSet rs = null;    
		int tot = 0;
		String sql = "select count(*) from board WHERE re_level = 1 and (REGEXP_LIKE (LOWER(subject), LOWER(?)) OR REGEXP_LIKE (LOWER(content), LOWER(?)) OR REGEXP_LIKE (LOWER(tags), LOWER(?)))";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, replacedWord);
			pstmt.setString(2, replacedWord);
			pstmt.setString(3, replacedWord);
			rs = pstmt.executeQuery();
			if (rs.next()) tot = rs.getInt(1);
		} catch(Exception e) {	
			System.out.println(e.getMessage()); 
			e.printStackTrace();
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return tot;
	}

	public int getTotalCnt(int bd_code) throws SQLException {
		Connection conn = null;	
		PreparedStatement pstmt= null; 
		ResultSet rs = null;    
		int tot = 0;
		String sql = "select count(*) from board WHERE re_level = 1 and bd_code = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bd_code);
			rs = pstmt.executeQuery();
			if (rs.next()) tot = rs.getInt(1);
		} catch(Exception e) {	
			System.out.println(e.getMessage()); 
			e.printStackTrace();
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return tot;
	}
	
	public List<Board> listPopular(int bd_code, int num) throws SQLException {
		List<Board> list = new ArrayList<Board>();
		Connection conn = null;	
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		String sql = "SELECT b.* FROM (SELECT ROWNUM rn, a.* FROM (SELECT * FROM board WHERE re_level=1 AND bd_code= ? ORDER BY read_count DESC, bd_num DESC) a) b WHERE rn <= ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bd_code);
			pstmt.setInt(2, num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Board board = new Board();
				rsToBoard(rs, board);
				list.add(board);
			}
		} catch(Exception e) {	
			System.out.println(e.getMessage());
			e.printStackTrace();
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		} 
		return list;
	}



}
