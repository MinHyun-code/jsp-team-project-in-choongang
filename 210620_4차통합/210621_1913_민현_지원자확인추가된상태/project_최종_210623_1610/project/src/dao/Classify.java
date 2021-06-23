package dao;

import java.sql.Date;

public class Classify {
	private int rc_num;
	private String rc_name;
	private String rc_title;
	private String rc_content;
	private String rc_scrap;
	private int rc_salary;
	private long rc_view;
	private Date rc_date;
	private String clvalue;
	private String rc_link;
	private int rc_cnt;
	
	private int bclass;
	private int mclass;
	
	public int getBclass() {
		return bclass;
	}
	public void setBclass(int bclass) {
		this.bclass = bclass;
	}
	public int getMclass() {
		return mclass;
	}
	public void setMclass(int mclass) {
		this.mclass = mclass;
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
	public long getRc_view() {
		return rc_view;
	}
	public void setRc_view(long rc_view) {
		this.rc_view = rc_view;
	}
	public Date getRc_date() {
		return rc_date;
	}
	public void setRc_date(Date rc_date) {
		this.rc_date = rc_date;
	}
	public String getClvalue() {
		return clvalue;
	}
	public void setClvalue(String clvalue) {
		this.clvalue = clvalue;
	}
	public String getRc_link() {
		return rc_link;
	}
	public void setRc_link(String rc_link) {
		this.rc_link = rc_link;
	}
	public int getRc_cnt() {
		return rc_cnt;
	}
	public void setRc_cnt(int rc_cnt) {
		this.rc_cnt = rc_cnt;
	}
	
	
}
