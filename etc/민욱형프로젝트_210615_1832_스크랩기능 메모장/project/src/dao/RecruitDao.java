package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.sql.*;
import javax.naming.*;

public class RecruitDao {
	private static RecruitDao instance;

	private RecruitDao() {
	}

	public static RecruitDao getInstance() {
		if (instance == null) {
			instance = new RecruitDao();
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

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	public int totalCnt() throws SQLException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int tot = 0;
		String sql = "select count(*) from recruit";
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

	public List<RecruitDto> list(int startRow, int endRow) throws SQLException {
		List<RecruitDto> list = new ArrayList<RecruitDto>();
		Connection conn = null;	
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		 String sql = "select * from (select rownum rn ,a.* from " + 
			"  (select * from recruit order by rc_num desc) a ) "+
			" where rn between ? and ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				RecruitDto rdt= new RecruitDto();
				rdt.setRc_num(rs.getInt("rc_num"));
				rdt.setRc_name(rs.getString("rc_name"));
				rdt.setRc_title(rs.getString("rc_title"));
				rdt.setRc_content(rs.getString("rc_content"));
				rdt.setRc_scrap(rs.getString("rc_scrap"));
				rdt.setRc_salary(rs.getInt("rc_salary"));
				rdt.setRc_view(rs.getInt("rc_view"));
				rdt.setRc_date(rs.getDate("rc_date"));
				rdt.setRc_link(rs.getString("rc_link"));
				list.add(rdt);
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
	
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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

	public ArrayList<RecruitDto> searching(String standard, String name) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<RecruitDto> searchlist = new ArrayList<RecruitDto>();
		
		String sql1 = " select r.*,clvalue from recruit r, ( select * from commoncode o, classify c  "
				+ "                                                                     where c.bclass=o.bclass and c.mclass=o.mclass) a "
				+ "                                        where a.rc_num=r.rc_num and clvalue like '%'||?||'%'  order by r.rc_num";

		String sql2 =  "select * from recruit where rc_name like '%'||?||'%' ";
   		conn = getConnection();
   		
		try {
			    
			if (standard.equals("clvalue1")) {

				pstmt = conn.prepareStatement(sql1);
				pstmt.setString(1, name);
				rs = pstmt.executeQuery();
//call by value, call by reference, 얕은 복사, 깊은 복사
				while (rs.next()) {
					RecruitDto rdt = new RecruitDto();
					System.out.println("rc_name in dao: " + rs.getString("rc_name"));
					rdt.setRc_num(rs.getInt("rc_num"));
					rdt.setRc_name(rs.getString("rc_name"));
					rdt.setRc_title(rs.getString("rc_title"));
					rdt.setRc_content(rs.getString("rc_content"));
					rdt.setRc_scrap(rs.getString("rc_scrap"));
					rdt.setRc_salary(rs.getInt("rc_salary"));
					rdt.setRc_view(rs.getInt("rc_view"));
					rdt.setRc_date(rs.getDate("rc_date"));
					rdt.setRc_link(rs.getString("rc_link"));
					rdt.setClvalue(rs.getString("clvalue"));
					searchlist.add(rdt);
				}
				rs.close();
				pstmt.close();
			} // if
			
			if (standard.equals("clvalue2")) {

				pstmt = conn.prepareStatement(sql1);
				pstmt.setString(1, name);
				rs = pstmt.executeQuery();
//call by value, call by reference, 얕은 복사, 깊은 복사
				while (rs.next()) {
					RecruitDto rdt = new RecruitDto();
					System.out.println("rc_name in dao: " + rs.getString("rc_name"));
					rdt.setRc_num(rs.getInt("rc_num"));
					rdt.setRc_name(rs.getString("rc_name"));
					rdt.setRc_title(rs.getString("rc_title"));
					rdt.setRc_content(rs.getString("rc_content"));
					rdt.setRc_scrap(rs.getString("rc_scrap"));
					rdt.setRc_salary(rs.getInt("rc_salary"));
					rdt.setRc_view(rs.getInt("rc_view"));
					rdt.setRc_date(rs.getDate("rc_date"));
					rdt.setRc_link(rs.getString("rc_link"));
					rdt.setClvalue(rs.getString("clvalue"));
					searchlist.add(rdt);
				}
				rs.close();
				pstmt.close();
			} // if
			
			if (standard.equals("clvalue3")) {

				pstmt = conn.prepareStatement(sql1);
				pstmt.setString(1, name);
				rs = pstmt.executeQuery();
//call by value, call by reference, 얕은 복사, 깊은 복사
				while (rs.next()) {
					RecruitDto rdt = new RecruitDto();
					System.out.println("rc_name in dao: " + rs.getString("rc_name"));
					rdt.setRc_num(rs.getInt("rc_num"));
					rdt.setRc_name(rs.getString("rc_name"));
					rdt.setRc_title(rs.getString("rc_title"));
					rdt.setRc_content(rs.getString("rc_content"));
					rdt.setRc_scrap(rs.getString("rc_scrap"));
					rdt.setRc_salary(rs.getInt("rc_salary"));
					rdt.setRc_view(rs.getInt("rc_view"));
					rdt.setRc_date(rs.getDate("rc_date"));
					rdt.setRc_link(rs.getString("rc_link"));
					rdt.setClvalue(rs.getString("clvalue"));
					searchlist.add(rdt);
				}
				rs.close();
				pstmt.close();
			} // if
			
			if (standard.equals("rc_name")) {
				System.out.println("in if 'rc_name' ");
				pstmt = conn.prepareStatement(sql2);
				pstmt.setString(1, name);
				rs = pstmt.executeQuery();
				
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
					searchlist.add(rdt);
				}
			} // if

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (rs != null)	rs.close();
			if (conn != null)conn.close();
		}
		return searchlist;
	}
	
	
	
	
	public int insertLikeCompany(String m_id,int rc_num) throws SQLException { //id를 넣어줘야해
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int result = 0;
		// like_company 존재 하는지 Check
		String sql1 = "select Count(*)  from like_company "
				+     "where rc_num = ? and m_id = ?";
	
		String sql = "insert into like_company values(?,?)";

		try {
			conn = getConnection();
			// sql1 ->  존재 하는지 Check 여부
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, rc_num);
			pstmt.setString(2, m_id);
			rs = pstmt.executeQuery();
			rs.next();
			if (rs.getInt(1) > 0) {
				result = 2;
				System.out.println("if");
			} else {
				result = 0;
				pstmt.close();
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, m_id);  
				pstmt.setInt(2, rc_num);
				result = pstmt.executeUpdate();
				pstmt.close();
				System.out.println("else");
			}
		}catch(Exception e){
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (rs != null)	rs.close();
			if (conn != null)conn.close();
		}
		return result;
	}

	public int insertLikeCompany2(String m_id,int rc_num) { //id를 넣어줘야해
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int result = 0;
		// like_company 존재 하는지 Check
		String sql1 = "select Count(*)  from like_company "
				+     "where rc_num = ? and m_id = ?";
	

		try {
			conn = getConnection();
			// sql1 ->  존재 하는지 Check 여부
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, rc_num);
			pstmt.setString(2, m_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		
		
		return result;
	}
	
	public ArrayList<RecruitDto> preferList( String m_id ){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<RecruitDto>  preferList = new ArrayList<RecruitDto>();
		String sql = "select r.*,l.m_id from recruit r,like_company l where r.rc_num= l.rc_num and l.m_id=?";
		
		conn = getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
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
				preferList.add(rdt); 
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return  preferList;
	}
	
	public int delete(int rc_num, String m_id) throws SQLException {
		Connection conn = null;	
		PreparedStatement pstmt= null;   
		int result = 0;
		String sql="delete from(select r.*,l.m_id from recruit r,like_company l  where r.rc_num= l.rc_num)a where a.rc_num = ? and a.m_id=?";
		try {
			conn = getConnection();
			System.out.println("m_id------------->"+m_id);
			System.out.println("rc_num----------->"+rc_num);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rc_num);
			pstmt.setString(2, m_id);
			result = pstmt.executeUpdate();
			
			
	
		} catch(Exception e) {	
			System.out.println(e.getMessage()); 
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return result;
	}
		
	
}
