package dao;

import java.sql.Date;

public class ApplyRecruit {
	//Apply
	private String m_id;
	private int r_num;
	private Date a_date;	
	private int  ap_cnt;
	
	public int getAp_cnt() {
		return ap_cnt;
	}
	public void setAp_cnt(int ap_cnt) {
		this.ap_cnt = ap_cnt;
	}
	//Recruit
	private int rc_num;
	private String rc_name;
	private String rc_title;
	private String rc_content;
	private String rc_scrap;
	private int rc_salary;
	private String rc_link;
	private Date rc_date;
	private int rc_view;
	
	
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
	public Date getA_date() {
		return a_date;
	}
	public void setA_date(Date a_date) {
		this.a_date = a_date;
	}
	public int getRc_num() {
		return rc_num;
	}
	public void setRc_num(int rc_num) {
		this.rc_num = rc_num;
	}
	public String getRc_name() {
		return rc_name;
	}
	public void setRc_name(String rc_name) {
		this.rc_name = rc_name;
	}
	public String getRc_title() {
		return rc_title;
	}
	public void setRc_title(String rc_title) {
		this.rc_title = rc_title;
	}
	public String getRc_content() {
		return rc_content;
	}
	public void setRc_content(String rc_content) {
		this.rc_content = rc_content;
	}
	public String getRc_scrap() {
		return rc_scrap;
	}
	public void setRc_scrap(String rc_scrap) {
		this.rc_scrap = rc_scrap;
	}
	public int getRc_salary() {
		return rc_salary;
	}
	public void setRc_salary(int rc_salary) {
		this.rc_salary = rc_salary;
	}
	public String getRc_link() {
		return rc_link;
	}
	public void setRc_link(String rc_link) {
		this.rc_link = rc_link;
	}
	public Date getRc_date() {
		return rc_date;
	}
	public void setRc_date(Date rc_date) {
		this.rc_date = rc_date;
	}
	public int getRc_view() {
		return rc_view;
	}
	public void setRc_view(int rc_view) {
		this.rc_view = rc_view;
	}
	
	
}