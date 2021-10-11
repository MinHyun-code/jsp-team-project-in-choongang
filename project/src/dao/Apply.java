package dao;

import java.sql.Date;

public class Apply {
	
	private String m_id;
	private int rc_num;
	private int r_num;
	private Date a_date;	
	private int  ap_cnt;
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
	public int getAp_cnt() {
		return ap_cnt;
	}
	public void setAp_cnt(int ap_cnt) {
		this.ap_cnt = ap_cnt;
	}
	public int getRc_num() {
		return rc_num;
	}
	public void setRc_num(int rc_num) {
		this.rc_num = rc_num;
	}
	
	
}
