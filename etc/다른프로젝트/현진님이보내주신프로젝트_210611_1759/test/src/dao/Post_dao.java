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

public class Post_dao {
	private static Post_dao instance;

	private Post_dao() {

	}

	public static Post_dao getInstance() {
		if (instance == null)
			instance = new Post_dao();

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

	public Post select(int board_no, int post_no) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Post post = new Post();

		String sql = "SELECT * FROM post WHERE board_no = ? and post_no = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_no);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				post.setBoard_no(rs.getInt("board_no"));
				post.setPost_no(rs.getInt("post_no"));
				post.setCategory(rs.getString("category"));
				post.setPost_title(rs.getString("post_title"));
				post.setMember_id(rs.getString("member_id"));
				post.setContent(rs.getString("content"));
				post.setAttach(rs.getString("attach"));
				post.setPasswd(rs.getString("passwd"));
				post.setWrite_date(rs.getDate("write_date"));
				post.setHits(rs.getInt("hits"));
				post.setRecommend(rs.getInt("recommend"));
				post.setRef(rs.getInt("ref"));
				post.setRe_step(rs.getInt("re_step"));
				post.setRe_level(rs.getInt("re_level"));
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
		
		return post;
	}
	
	public void hits(int board_no, int post_no) throws SQLException {
		Connection conn = null;	
		PreparedStatement pstmt= null; 
		String sql="update post set hits=hits+1 where post_no=? , board_no = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, post_no);
			pstmt.setInt(2, board_no);
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
		String sql = "select count(*) from post where board_no = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				tot = rs.getInt(1);
			}
		} catch(Exception e) {	
			System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return tot;
	}
	
	public List<Post> list(int startRow, int endRow, int board_no) throws SQLException {
		
		List<Post> list = new ArrayList<Post>();
		Connection conn = null;	
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		String sql = "select * from (select rownum rn ,a.* from " + 
				"  (select * from post natural join member"
				+ " where board_no=? order by ref desc,re_step) a ) "+
				" where (rn between ? and ?) and board_no=? ";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			System.out.println("DAO list sql->"+sql);
			pstmt.setInt(1, board_no);
			System.out.println("DAO list startRow->"+startRow);
			pstmt.setInt(2, startRow);
			System.out.println("DAO list endRow->"+endRow);
			pstmt.setInt(3, endRow);
			System.out.println("DAO list board_no->"+board_no);
			pstmt.setInt(4, board_no);
			
			rs = pstmt.executeQuery();
			
//			***자꾸 오류나는거랑 조인시 이렇게 해주는게 맞긴 한지 질문
			
			while (rs.next()) {
//				Board board = new Board();
				Post post = new Post();
				Member member = new Member();

				post.setBoard_no(rs.getInt("board_no"));
				System.out.println("DAO list board_no->"+rs.getInt("board_no"));
				post.setPost_no(rs.getInt("post_no"));
				System.out.println("DAO list post_no->"+rs.getInt("post_no"));
//				post.setCategory(rs.getString("category"));
//				System.out.println("DAO list category->"+rs.getString("category"));
				post.setPost_title(rs.getString("post_title"));
				System.out.println("DAO list post_title->"+rs.getString("post_title"));
//				post.setMember_id(rs.getString("member_id"));
//				System.out.println("DAO list member_id->"+rs.getString("member_id"));
//				post.setContent(rs.getString("content"));
//				System.out.println("DAO list content->"+rs.getString("content"));
//				post.setAttach(rs.getString("attach"));
//				System.out.println("DAO list attach->"+rs.getString("attach"));
//				post.setPasswd(rs.getString("passwd"));
//				System.out.println("DAO list passwd->"+rs.getString("passwd"));
//				post.setWrite_date(rs.getDate("write_date"));
//				System.out.println("DAO list write_date->"+rs.getDate("write_date"));
				post.setHits(rs.getInt("hits"));
				System.out.println("DAO list hits->"+rs.getInt("hits"));
				post.setRecommend(rs.getInt("recommend"));
				System.out.println("DAO list recommend->"+rs.getInt("recommend"));
				post.setRef(rs.getInt("ref"));
				System.out.println("DAO list ref->"+rs.getInt("ref"));
				post.setRe_step(rs.getInt("re_step"));
				System.out.println("DAO list re_step->"+rs.getInt("re_step"));
				post.setRe_level(rs.getInt("re_level"));
				System.out.println("DAO list re_level->"+rs.getInt("re_level"));
				
//				member.setMember_id(rs.getString("member_id"));
//				member.setMember_pw(rs.getString("member_pw"));
//				System.out.println("DAO list member_pw->"+rs.getString("member_pw"));
//				member.setMember_name(rs.getString("member_name"));
//				System.out.println("DAO list member_name->"+rs.getString("member_name"));
//				member.setGender(rs.getString("gender"));
//				System.out.println("DAO list gender->"+rs.getString("gender"));
//				member.setProfile_img(rs.getString("profile_img"));
//				System.out.println("DAO list profile_img->"+rs.getString("profile_img"));
				member.setNickname(rs.getString("nickname"));
				System.out.println("DAO list nickname->"+rs.getString("nickname"));
//				member.setBirth(rs.getDate("birth"));
//				System.out.println("DAO list birth->"+rs.getDate("birth"));
//				member.setTel(rs.getString("tel"));
//				System.out.println("DAO list tel->"+rs.getString("tel"));
//				member.setIntro(rs.getString("intro"));
//				System.out.println("DAO list intro->"+rs.getString("intro"));
//				member.setReg_date(rs.getDate("reg_date"));
//				System.out.println("DAO list reg_date->"+rs.getDate("reg_date"));
//				member.setRec(rs.getInt("rec"));
//				System.out.println("DAO list rec->"+rs.getInt("rec"));
//				member.setWithdrawal(rs.getString("Withdrawal"));
//				System.out.println("DAO list Withdrawal->"+rs.getString("Withdrawal"));
				
				
				
				
				list.add(post);
			}
		} catch(Exception e) {	
			System.out.println("DAO list Exception "+e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		} 
		return list;
	}

	public int update(Post post) throws SQLException {
		Connection conn = null;	
		PreparedStatement pstmt= null; 
		int result = 0;			
		String sql="update post set post_title = ?, category = ?,"
							+ "content = ?, attach = ?, passwd=? "
		                	+ "where board_no = ? and post_no = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, post.getPost_title());
			pstmt.setString(2, post.getCategory());
			pstmt.setString(3, post.getContent());
			pstmt.setString(4, post.getAttach());
			pstmt.setString(5, post.getPasswd());
			pstmt.setInt(6, post.getBoard_no());
			pstmt.setInt(7, post.getPost_no());
			
			result = pstmt.executeUpdate();
		} catch(Exception e) {	
			System.out.println(""+e.getMessage()); 
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return result;
	}
	
	
}
