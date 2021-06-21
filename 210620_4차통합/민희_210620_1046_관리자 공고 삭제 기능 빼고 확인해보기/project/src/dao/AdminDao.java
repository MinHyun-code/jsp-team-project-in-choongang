package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class AdminDao {
	private static AdminDao instance;

	public static AdminDao getInstance() {
		if (instance == null) {
			instance = new AdminDao();
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

	public int getTotalCntRecruit() throws SQLException {
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

	public ArrayList<RecruitDto> listRecruit(int startRow, int endRow) throws SQLException {
		ArrayList<RecruitDto> rclist = new ArrayList<RecruitDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from (select rownum rn ,a.* from "
				+ "  (select * from recruit order by rc_num) a ) "
				+ " where rn between ? and ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				RecruitDto rdt = new RecruitDto();
				rdt.setRc_num(rs.getInt("rc_num"));
				rdt.setRc_name(rs.getString("rc_name"));
				rdt.setRc_title(rs.getString("rc_title"));
				rdt.setRc_content(rs.getString("rc_content"));
				rdt.setRc_scrap(rs.getString("rc_scrap"));
				rdt.setRc_salary(rs.getInt("rc_salary"));
				rdt.setRc_view(rs.getLong("rc_view"));
				rdt.setRc_date(rs.getDate("rc_date"));
				rdt.setRc_link(rs.getString("rc_link"));
				rclist.add(rdt);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return rclist;
	}
}
