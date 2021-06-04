package dao;


import java.sql.*;
import java.util.ArrayList;
import javax.sql.*;
import javax.naming.*;

public class RecruitDao {
	private static RecruitDao instance;
	private RecruitDao() {}
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
			DataSource ds = (DataSource)
				ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		}catch(Exception e) { 
			System.out.println(e.getMessage());	
		}
		return conn;
	}
		
	public void rc_view(int num) throws SQLException {
		Connection conn = null;	PreparedStatement pstmt= null; 
		String sql="update recruit set rc_view=rc_view+1 where rc_num=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);			
			pstmt.executeUpdate();
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return;
	}
	
	
	public int totalCnt() throws SQLException {
		Connection conn = null;	
		Statement stmt= null; 
		ResultSet rs = null;    
		int tot = 0;
		String sql = "select count(*) from recruit";
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
	
	public ArrayList<RecruitDto> rclist() throws SQLException { //rda는 
		ArrayList<RecruitDto> rclist = new ArrayList<RecruitDto>();
		Connection conn = null;	
		Statement stmt= null; 
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
				rclist.add(rdt);   //데이터 베이스값이 들어간  Arraylist객체  rclist 생성하는 일을 하는 메소드 rclist
			}	
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (stmt != null) stmt.close();
			if (conn !=null) conn.close();
		}
		return rclist;    //호출한 곳에 return 호출한곳은 오직 command뿐이므로 이 값이 command로 리턴된다라는 뜻이된다.
	}
	

	
	public RecruitDto popUpHireUnion(String name) throws SQLException {
		Connection conn = null;	
		PreparedStatement pstmt= null; 
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
		}catch(Exception e){ 
			System.out.println(e.getMessage());		
			}finally {
				if (rs !=null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn !=null) conn.close();
	             }
		
		return rdt;

	   }

	}


