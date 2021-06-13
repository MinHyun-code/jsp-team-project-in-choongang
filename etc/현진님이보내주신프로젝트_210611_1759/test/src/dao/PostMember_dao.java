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

public class PostMember_dao {
	private static PostMember_dao instance;

	private PostMember_dao() {

	}

	public static PostMember_dao getInstance() {
		if (instance == null)
			instance = new PostMember_dao();

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
	
	//게시판 리스트 만든거 (post + member) 조인 > nickname때매
	public List<PostMember> list(int startRow, int endRow, int board_no) throws SQLException {
		
		List<PostMember> list = new ArrayList<PostMember>();
		Connection conn = null;	
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		String sql = " select * from (select rownum rn ,a.* from " + 
				"  (select * from post natural join member"
				+ " where board_no=? and ref = post_no order by ref desc,re_step) a ) "+
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
			
			while (rs.next()) {
				
				PostMember postmember = new PostMember();

				postmember.setBoard_no(rs.getInt("board_no"));
				System.out.println("DAO list board_no->"+rs.getInt("board_no"));
				postmember.setPost_no(rs.getInt("post_no"));
				System.out.println("DAO list post_no->"+rs.getInt("post_no"));
				postmember.setPost_title(rs.getString("post_title"));
				System.out.println("DAO list post_title->"+rs.getString("post_title"));
				postmember.setHits(rs.getInt("hits"));
				System.out.println("DAO list hits->"+rs.getInt("hits"));
				postmember.setRecommend(rs.getInt("recommend"));
				System.out.println("DAO list recommend->"+rs.getInt("recommend"));
				postmember.setRef(rs.getInt("ref"));
				System.out.println("DAO list ref->"+rs.getInt("ref"));
				postmember.setRe_step(rs.getInt("re_step"));
				System.out.println("DAO list re_step->"+rs.getInt("re_step"));
				postmember.setRe_level(rs.getInt("re_level"));
				System.out.println("DAO list re_level->"+rs.getInt("re_level"));
				
				postmember.setNickname(rs.getString("nickname"));
				System.out.println("DAO list nickname->"+rs.getString("nickname"));
				
				
				list.add(postmember);
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
	
	//전체 칼럼 갯수 세는거 (게시판 10개씩 자르려고)
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

	//조회수
	public void hits(int board_no, int post_no) throws SQLException {
		
		Connection conn = null;	
		PreparedStatement pstmt= null; 
		String sql="update post set hits=hits+1 where post_no = ? and board_no=?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_no);
			pstmt.setInt(2, post_no);
			pstmt.executeUpdate();
		
		} catch(Exception e) {	
			
			System.out.println(e.getMessage()); 
		
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return;
	}
	
	
	//게시판의 게시글 내용 선택하는문
	public PostMember select(int board_no, int post_no) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		PostMember postmember = new PostMember();

		String sql = " SELECT * FROM post WHERE board_no = ? and post_no = ? ";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_no);
			pstmt.setInt(2, post_no);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				
				postmember.setBoard_no(rs.getInt("board_no"));
				postmember.setPost_no(rs.getInt("post_no"));
				postmember.setCategory(rs.getString("category"));
				postmember.setPost_title(rs.getString("post_title"));
				postmember.setMember_id(rs.getString("member_id"));
				postmember.setContent(rs.getString("content"));
				postmember.setAttach(rs.getString("attach"));
				postmember.setPasswd(rs.getString("passwd"));
				postmember.setWrite_date(rs.getDate("write_date"));
				postmember.setHits(rs.getInt("hits"));
				postmember.setRecommend(rs.getInt("recommend"));
				postmember.setRef(rs.getInt("ref"));
				postmember.setRe_step(rs.getInt("re_step"));
				postmember.setRe_level(rs.getInt("re_level"));
				
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
		
		return postmember;
	}

	//삭제인데 실패함 다시 도전한다 뒤졋다 닌
//	public int delete(int board_no, int post_no, String passwd) throws SQLException {
//		
//		int result = 0;
//		
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//
//		PostMember postmember = new PostMember();
//
//		String sql1 = " select * FROM post WHERE board_no = ? and post_no = ? ";
//		String sql2 = " delete from post where board_no = ? and post_no = ? ";
//		
//		try {
//			
//			String db_passwd = "";
//			
//			conn = getConnection();
//			pstmt = conn.prepareStatement(sql1);
//			pstmt.setInt(1, board_no);
//			pstmt.setInt(2, post_no);
//			rs = pstmt.executeQuery();
//
//			if (rs.next()) {
//				
//				db_passwd = rs.getString(1);
//				
//				if(db_passwd.equals(passwd)) {
//					
//					rs.close();
//					pstmt.close();
//					pstmt=conn.prepareStatement(sql2);
//					pstmt.setInt(1, post_no);
//					pstmt.setInt(2, board_no);
//					result = pstmt.executeUpdate();
//					
//				} else result=0;
//			}	else result=-1;
//			
//			} catch(Exception e) {
//				System.out.println(e.getMessage());
//			} finally {
//				if (pstmt!= null) {
//					pstmt.close();
//				}
//				if (conn!= null) {
//					conn.close();
//				}
//			}
//			return result;
//		}

	//
	public int insert(PostMember postmember) throws SQLException {
		
		String sql0 = "select nvl(max(post_no),0) from post where board_no=?";
		
		int result = 0;
		int board_no = 1;
		int post_no = postmember.getPost_no();
		int re_step = postmember.getRe_step();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql1 = " insert into post (board_no, post_no, category, post_title, member_id, content, attach, passwd, write_date, hits, recommend, ref, re_step, re_level) "
				+ " values ( ?, ?, ?, ?, ?, ?, ?, ?, sysdate, ?, ?, ?, ?, ?) ";		
		
		//댓글
		String sql2 = " update post set re_step = re_step + 1 where ref = ? and re_step > ?";
		
		//대댓글
		String sql3 = " update post set re_level = re_level + 1 where ref = ? and re_step = ? and re_level > ?";
				
				
		try {
		
			conn = getConnection();
			
			if( re_step != 0 ) {
				
				pstmt = conn.prepareStatement(sql3);
				pstmt.setInt(1, postmember.getRef());
				pstmt.setInt(2, postmember.getRe_step());
				pstmt.setInt(3, postmember.getRe_level());
				pstmt.executeUpdate();
				pstmt.close();
//				postmember.setRe_step(postmember.getRe_step()+1);
				postmember.setRe_level(postmember.getRe_level()+1);
				
			}
			
			if( post_no != 0 ) {
				
				pstmt = conn.prepareStatement(sql2);
				pstmt.setInt(1, postmember.getRef());
				pstmt.setInt(2, postmember.getRe_step());
				pstmt.executeUpdate();
				pstmt.close();
				postmember.setRe_step(postmember.getRe_step()+1);
//				postmember.setRe_level(postmember.getRe_level()+1);
				
			}
			
			pstmt = conn.prepareStatement(sql0);
			pstmt.setInt(1, postmember.getBoard_no());
			System.out.println("Post_dao sql0  post.getBoard_no()->"+ postmember.getBoard_no());
			rs=pstmt.executeQuery();
			rs.next();
			int post_no_num = rs.getInt(1)+1;
			System.out.println("Post_dao sql0  number->"+post_no_num);
			rs.close();
			pstmt.close();
			if(post_no==0) postmember.setRef(post_no_num);
			
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, board_no);
			System.out.println("board_no -> "+ board_no);
			pstmt.setInt(2, post_no_num);
			System.out.println("post_no -> "+ post_no_num);
			pstmt.setString(3, postmember.getCategory());
			System.out.println("getCategory -> "+ postmember.getCategory());
//			pstmt.setLong(3, postmember.getCategory());
//			System.out.println("getCategory -> "+ postmember.getCategory());
			pstmt.setString(4, postmember.getPost_title());
			System.out.println("getPost_title -> "+ postmember.getPost_title());
			pstmt.setString(5, postmember.getMember_id());
			System.out.println("getMember_id -> "+ postmember.getMember_id());
			pstmt.setString(6, postmember.getContent());
			System.out.println("getContent -> "+ postmember.getContent());
			pstmt.setString(7, postmember.getAttach());
			System.out.println("getAttach -> "+ postmember.getAttach());
			pstmt.setString(8, postmember.getPasswd());
			System.out.println("getPasswd -> "+ postmember.getPasswd());
			pstmt.setInt(9, postmember.getHits());
			System.out.println("getHits -> "+ postmember.getHits());
			pstmt.setInt(10, postmember.getRecommend());
			System.out.println("getRecommend -> "+ postmember.getRecommend());
			pstmt.setInt(11, postmember.getRef());
			System.out.println("getRef -> "+ postmember.getRef());
			pstmt.setInt(12, postmember.getRe_step());
			System.out.println("getRe_step -> "+ postmember.getRe_step());
			pstmt.setInt(13, postmember.getRe_level());
			System.out.println("getRe_level -> "+ postmember.getRe_level());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("dao insert exception ! ");
		}  finally {
			if(rs!= null) {
				rs.close();
			}
			if(pstmt!= null) {
				pstmt.close();
			}
			if(conn!= null) {
				conn.close();
			}
		}
		return result;
	}

	//통합검색
	public List<PostMember> search(int startRow, int endRow, int board_no, String category, String search_text) throws SQLException {
		
		List<PostMember> list = new ArrayList<PostMember>();
		Connection conn = null;	
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		String sql = "select * "
				  + " from (select rownum rn ,a.* "
				  		+ " from (select * "
				  		+ " from post natural join member "
				  		+ " where board_no= ? "
				  		+ " and category = ? "
						+ " and (post_title like '%'||?||'%' "
						+ " or content like '%'||?||'%') "
						+ " order by ref desc, re_step) a ) "
				  + " where (rn between ? and ?) "
				  + " and board_no = ? ";

		try {
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			System.out.println(" DAO search sql -> " +sql);
			
			pstmt.setInt(1, board_no);
			System.out.println(" DAO search board_no -> " +board_no);
			pstmt.setString(2, category);
			System.out.println(" DAO search category -> " +category);
			pstmt.setString(3, search_text);
			System.out.println(" DAO search search_text -> " +search_text);
			pstmt.setString(4, search_text);
			pstmt.setInt(5, startRow);
			System.out.println(" DAO search startRow -> " +startRow);
			pstmt.setInt(6, endRow);
			System.out.println(" DAO search endRow -> " +endRow);
			pstmt.setInt(7, board_no);
			System.out.println(" DAO search board_no -> " +board_no);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				PostMember postmember = new PostMember();

				postmember.setPost_title(rs.getString("post_title"));
				System.out.println("DAO list post_title->"+rs.getInt("post_title"));
				postmember.setBoard_no(rs.getInt("board_no"));
				System.out.println("DAO list board_no->"+rs.getInt("board_no"));
				postmember.setPost_no(rs.getInt("post_no"));
				System.out.println("DAO list post_no->"+rs.getInt("post_no"));
				postmember.setHits(rs.getInt("hits"));
				System.out.println("DAO list hits->"+rs.getInt("hits"));
//				postmember.setRecommend(rs.getInt("recommend"));
//				System.out.println("DAO list recommend->"+rs.getInt("recommend"));
//				postmember.setRef(rs.getInt("ref"));
//				System.out.println("DAO list ref->"+rs.getInt("ref"));
//				postmember.setRe_step(rs.getInt("re_step"));
//				System.out.println("DAO list re_step->"+rs.getInt("re_step"));
//				postmember.setRe_level(rs.getInt("re_level"));
//				System.out.println("DAO list re_level->"+rs.getInt("re_level"));
				postmember.setNickname(rs.getString("nickname"));
				System.out.println("DAO list nickname->"+rs.getString("nickname"));
				
				list.add(postmember);
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
	
	//통합검색 cnt
	public int getsearchTotalCnt(int board_no, String category, String search_text ) throws SQLException {
		Connection conn = null;	
		PreparedStatement pstmt= null; 
		ResultSet rs = null;    
		int abcabc = 0;
		String sql = "select count(*) "
				+ " from post where board_no = ? "
				+ " and category = ? "
				+ " and (post_title like '%'||?||'%' "
				+ " or content like '%'||?||'%') ";
		try {
			System.out.println("!@!##@!" + board_no);
			System.out.println("!@!##@!" + category);
			System.out.println("!@!##@!" + search_text);
			System.out.println("!@!##@!" + abcabc);
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_no);
			pstmt.setString(2, category);
			pstmt.setString(3, search_text);
			pstmt.setString(4, search_text);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				abcabc = rs.getInt(1);
				System.out.println("#*$^@*@" + abcabc);
			}
			System.out.println("tot -> "+abcabc);
		} catch(Exception e) {	
			System.out.println("search_cnt erro"+e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return abcabc;
	}


	//베스트글 찾는 리스트
	public List<PostMember> best(int startRow, int endRow) throws SQLException {
		
		List<PostMember> list = new ArrayList<PostMember>();
		Connection conn = null;	
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		String sql = "select * from (select rownum rn ,a.* from " + 
				"  (select * from post natural join member"
				+ " where recommend >= 20 order by ref desc,re_step) a ) "+
				" where (rn between ? and ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			System.out.println("DAO list startRow->"+startRow);
			pstmt.setInt(1, startRow);
			System.out.println("DAO list endRow->"+endRow);
			pstmt.setInt(2, endRow);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				PostMember postmember = new PostMember();

				postmember.setBoard_no(rs.getInt("board_no"));
				System.out.println("DAO list board_no->"+rs.getInt("board_no"));
				postmember.setPost_no(rs.getInt("post_no"));
				System.out.println("DAO list post_no->"+rs.getInt("post_no"));
				postmember.setPost_title(rs.getString("post_title"));
				System.out.println("DAO list post_title->"+rs.getString("post_title"));
				postmember.setHits(rs.getInt("hits"));
				System.out.println("DAO list hits->"+rs.getInt("hits"));
				postmember.setRecommend(rs.getInt("recommend"));
				System.out.println("DAO list recommend->"+rs.getInt("recommend"));
				postmember.setRef(rs.getInt("ref"));
				System.out.println("DAO list ref->"+rs.getInt("ref"));
				postmember.setRe_step(rs.getInt("re_step"));
				System.out.println("DAO list re_step->"+rs.getInt("re_step"));
				postmember.setRe_level(rs.getInt("re_level"));
				System.out.println("DAO list re_level->"+rs.getInt("re_level"));
				
				postmember.setNickname(rs.getString("nickname"));
				System.out.println("DAO list nickname->"+rs.getString("nickname"));
				
				
				list.add(postmember);
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
	
	//best_count
	public int getTotalCnt_best() throws SQLException {
		Connection conn = null;	
		PreparedStatement pstmt= null; 
		ResultSet rs = null;    
		int tot = 0;
		String sql = "select count(*) from post where recommend >= 20";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
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

	//댓글 리스트 , int startRow, int endRow
	public List<PostMember> comment_list(int board_no, int post_no) throws SQLException {
		
		List<PostMember> comment_list = new ArrayList<PostMember>();
		Connection conn = null;	
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		String sql = " select * from (select rownum rn ,a.* from "
				+ "   (select * from post natural join member "
				+ "   where board_no=? and ref = ? order by re_step desc,re_step) a ) "
				+ "   where re_step > 0 ";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			System.out.println("DAO list sql->"+sql);
			pstmt.setInt(1, board_no);
			System.out.println("DAO list board_no->"+board_no);
			pstmt.setInt(2, post_no);
			System.out.println("DAO list post_no->"+post_no);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				PostMember postmember = new PostMember();

				postmember.setBoard_no(rs.getInt("board_no"));
				System.out.println("DAO list board_no->"+rs.getInt("board_no"));
				postmember.setPost_no(rs.getInt("post_no"));
				System.out.println("DAO list post_no->"+rs.getInt("post_no"));
				postmember.setPost_title(rs.getString("post_title"));
				System.out.println("DAO list post_title->"+rs.getString("post_title"));
				postmember.setHits(rs.getInt("hits"));
				System.out.println("DAO list hits->"+rs.getInt("hits"));
				postmember.setRecommend(rs.getInt("recommend"));
				System.out.println("DAO list recommend->"+rs.getInt("recommend"));
				postmember.setRef(rs.getInt("ref"));
				System.out.println("DAO list ref->"+rs.getInt("ref"));
				postmember.setRe_step(rs.getInt("re_step"));
				System.out.println("DAO list re_step->"+rs.getInt("re_step"));
				postmember.setRe_level(rs.getInt("re_level"));
				System.out.println("DAO list re_level->"+rs.getInt("re_level"));
				postmember.setContent(rs.getString("content"));
				System.out.println("DAO list content->"+rs.getString("content"));
				
				postmember.setNickname(rs.getString("nickname"));
				System.out.println("DAO list nickname->"+rs.getString("nickname"));
				
				
				comment_list.add(postmember);
			}
		} catch(Exception e) {	
			System.out.println("DAO list Exception "+e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		} 
		return comment_list;
	}

	public int recomCnt(int board_no, int post_no) throws SQLException {
		
		Connection conn = null;	
		PreparedStatement pstmt= null; 
		ResultSet rs = null;    
		int recomCnt = 0;
		String sql = " select count(*) "
					+ " FROM post "
					+ " where board_no = ? "
					+ " and ref = ? "
					+ " and re_step != 0 ";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			System.out.println("DAO list sql->"+sql);
			pstmt.setInt(1, board_no);
			System.out.println("DAO list post_no->"+post_no);
			pstmt.setInt(2, post_no);
				
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				recomCnt = rs.getInt(1);
				System.out.println(" rexxxxx - > " + recomCnt);
			}
			
		} catch(Exception e) {	
			System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return recomCnt;
	}

	
	//게시글 추천
//	public void recommend(int board_no, int post_no ) throws SQLException {
//		
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		String sql = "update post set recommend=recommend+1 where board_no=? and post_no = ? ";		
//		try {
//			conn = getConnection();
//			pstmt = conn.prepareStatement(sql);
//			
//			pstmt.setInt(1, board_no);
//			pstmt.setInt(2, board_no);
//			
//			pstmt.executeUpdate();
//			
//		} catch (Exception e) {
//			System.err.println(e.getMessage());
//		}finally {
//			
//			if (pstmt != null)
//				pstmt.close();
//			if (conn != null)
//				conn.close();
//		}
//		
//	}
	
	
	
}
