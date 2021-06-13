package dao;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

import java.util.List;

import javax.sql.*;
import javax.naming.*;

public class BoardDao {
	private static BoardDao instance;
	private BoardDao() {}
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
			DataSource ds = (DataSource)
				ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		}catch(Exception e) { 
			System.out.println(e.getMessage());	
		}
		return conn;
	}
	

	
	public Board select(int board_no, int post_no) throws SQLException {
		Connection conn = null;	
		PreparedStatement pstmt= null; 
		ResultSet rs = null;
		String sql = "select a.board_no, a.board_name, a.USE_YN, b.post_no, category, post_title, member_id, content, attach , passwd, write_date, hits, recommend,ref, re_step, re_level from board a , post b where a.board_no = b.board_no and post_no = ? and b.board_no = ?";
		Board board = new Board();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(2, board_no);
			pstmt.setInt(1, post_no);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {				
				board.setBoard_no(rs.getInt("board_no"));
				board.setBoard_name(rs.getString("board_name"));
				board.setUse_yn(rs.getString("use_yn"));
				board.setPost_no(rs.getInt("post_no"));
				board.setCategory(rs.getString("category"));
				board.setPost_title(rs.getString("post_title"));
				board.setMember_id(rs.getString("member_id"));
				board.setContent(rs.getString("content"));
				board.setAttach(rs.getString("attach"));
				board.setPasswd(rs.getString("passwd"));
				board.setWrite_date(rs.getDate("write_date"));
				board.setHits(rs.getInt("hits"));
				board.setRecommend(rs.getInt("recommend"));
				board.setRef(rs.getInt("ref"));
				board.setRe_level(rs.getInt("re_level"));
				board.setRe_step(rs.getInt("re_step"));
			}
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return board;
	}
	
	public void readCount(int board_no , int post_no) throws SQLException {
		Connection conn = null;	PreparedStatement pstmt= null; 
		String sql="update post set hits=hits+1 where board_no=? and post_no = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_no);
			pstmt.setInt(2, post_no);
			pstmt.executeUpdate();
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return;
	}

	public int getTotalCnt(int board_no) throws SQLException {
		Connection conn = null;	
		PreparedStatement pstmt= null; 
		ResultSet rs = null;    
		int tot = 0;
		String sql = "select count(*) from post where board_no=? ";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_no);
			rs = pstmt.executeQuery();
			if (rs.next()) tot = rs.getInt(1);
		} catch(Exception e) {	
			System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return tot;
	}

	public List<Board> list(int startRow, int endRow, int board_no) throws SQLException {
		List<Board> list = new ArrayList<Board>();
		Connection conn = null;	
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		 String sql = "select * from (select rownum rn ,a.* from " + 
			"  (select * from post where board_no=? order by ref desc,re_step) a ) "+
			" where (rn between ? and ?) and board_no=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_no);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			pstmt.setInt(4, board_no);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Board board = new Board();
				board.setPost_no(rs.getInt("post_no"));
				board.setMember_id(rs.getString("member_id"));
				board.setPost_title(rs.getString("post_title"));
				board.setWrite_date(rs.getDate("write_date"));
				board.setHits(rs.getInt("hits"));
				board.setRecommend(rs.getInt("recommend"));
//				board.setAttach(rs.getString("attach"));
//				board.setContent(rs.getString("Content"));
				board.setRef(rs.getInt("ref"));
				board.setRe_level(rs.getInt("re_level"));
				board.setRe_step(rs.getInt("re_step"));
				
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
	
	
	
	
	public int update(Board board) throws SQLException,IOException{
		int result=0;
		Connection conn =null;
		String sql = "update board set attach = ?, post_title = ?,passwd = ?,content = ?, where post_no = ? and board_no=?";
		PreparedStatement pstmt = null;
		
		try {
			conn =getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(5, board.getPost_no());
			pstmt.setInt(6, board.getBoard_no());
			pstmt.setString(1, board.getAttach());
			pstmt.setString(2, board.getPost_title());
			pstmt.setString(3, board.getPasswd());
			pstmt.setString(4, board.getContent());
			
			
			
			result = pstmt.executeUpdate();
		}	catch(Exception e) {
			System.out.println(e.getMessage());
		}  finally {
			if(pstmt!= null) pstmt.close();
			if(conn!= null) pstmt.close();
		}
		return result;
		}
	
		
	
	
		public int insert(Board board) throws SQLException, IOException{
			String sql1 = "select nvl(max(post_no),0) from post where board_no=?";
			
			int result=0;
			int board_no = 1;
			int post_no=board.getPost_no();
			Connection conn =null;
			String sql = "INSERT INTO POST (BOARD_NO,POST_NO,CATEGORY,POST_TITLE,MEMBER_ID,CONTENT,ATTACH,PASSWD,WRITE_DATE,HITS,RECOMMEND,REF,RE_STEP,RE_LEVEL) VALUES (?,?,'?','?','?','?','?','?',sysdate,?,?,?,?,?);";
			
			//댓글용
			String sql2 = "update post set re_step = re_step+1 where "+"ref=? and re_step>?";
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			
			try {
				conn =getConnection();

				//댓글용 구간 paragraph
				if (post_no!= 0) {
					pstmt= conn.prepareStatement(sql2);
					pstmt.setInt(1, board.getRef());
					pstmt.setInt(2, board.getRe_step());
					pstmt.executeUpdate();
					pstmt.close();
					board.setRe_step(board.getRe_step()+1);
					board.setRe_level(board.getRe_level()+1);
				}
				
				pstmt = conn.prepareStatement(sql1);
				pstmt.setInt(1, board.getBoard_no());
				rs=pstmt.executeQuery();
				rs.next();
				int number = rs.getInt(1)+1;
				rs.close();
				pstmt.close();
				if(post_no==0) board.setRef(number);
				pstmt = conn.prepareStatement(sql);
				
				
				pstmt.setInt(1, board_no);
				pstmt.setInt(2, number);
				pstmt.setString(3, board.getCategory());
				pstmt.setString(4, board.getPost_title());
				pstmt.setString(5, board.getMember_id());
				pstmt.setString(6, board.getContent());
				pstmt.setString(7, board.getAttach());
				pstmt.setString(8, board.getPasswd());
				pstmt.setInt(9, board.getHits());
				pstmt.setInt(10, board.getRecommend());
				pstmt.setInt(11, board.getRef());
				pstmt.setInt(12, board.getRe_step());
				pstmt.setInt(13, board.getRe_level());
				
											
				result = pstmt.executeUpdate();
			}	catch(Exception e) {
				System.out.println(e.getMessage());
			}  finally {
				if(rs!= null) rs.close();
				if(pstmt!= null) pstmt.close();
				if(conn!= null) conn.close();
			}
			return result;
		}
			
			
		public int delete(int board_no, int post_no, String passwd) throws SQLException, IOException {
			int result=0;
			Connection conn =null;
			PreparedStatement pstmt = null;
			ResultSet rs = null; 
			
			String sql1 = "select passwd from post where post_no = ? and board_no = ?";
			String sql = "delete from post where post_no = ? and board_no=?";
			
			
			
			try {
				String dbPasswd="";
				
				conn = getConnection();
				pstmt = conn.prepareStatement(sql1);
				pstmt.setInt(1, post_no);
				pstmt.setInt(2, board_no);
				rs=pstmt.executeQuery();
				if (rs.next()) {
					dbPasswd = rs.getString(1);
					if(dbPasswd.equals(passwd)) {
						rs.close();
						pstmt.close();
						pstmt=conn.prepareStatement(sql);
						pstmt.setInt(1, post_no);
						pstmt.setInt(2, board_no);
						result = pstmt.executeUpdate();
					} else result=0;
				}	else result=-1;
				
				} catch(Exception e) {
					System.out.println(e.getMessage());
				} finally {
					if (pstmt!= null) pstmt.close();
					if (conn!= null) conn.close();
				}
				return result;
			}
			
		
}