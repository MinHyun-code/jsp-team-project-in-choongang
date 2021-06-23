package dao;

import java.sql.Date;

public class Resume {

	private int r_num;
	private String m_id;
	private String r_title;
	private String r_pic;
	private String r_file;
	private Date r_date;
	
	
	public String getR_pic() {
		return r_pic;
	}
	public void setR_pic(String r_pic) {
		this.r_pic = r_pic;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public int getR_num() {
		return r_num;
	}
	public void setR_num(int r_num) {
		this.r_num = r_num;
	}
	public String getR_title() {
		return r_title;
	}
	public void setR_title(String r_title) {
		this.r_title = r_title;
	}
	public String getR_file() {
		return r_file;
	}
	public void setR_file(String r_file) {
		this.r_file = r_file;
	}
	public Date getR_date() {
		return r_date;
	}
	public void setR_date(Date date) {
		this.r_date = date;
	}
	
	
}
