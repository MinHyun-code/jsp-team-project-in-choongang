package dao;

import java.sql.Timestamp;

public class Comment {
	private int bd_code;
	private int bd_num;
	private int bd_cm_num;
	private String m_id;
	private String content;
	private Timestamp reg_date;
	private int ref;
	private int re_step;
	private int re_level;
	public int getBd_code() {
		return bd_code;
	}
	public void setBd_code(int bd_code) {
		this.bd_code = bd_code;
	}
	public int getBd_num() {
		return bd_num;
	}
	public void setBd_num(int bd_num) {
		this.bd_num = bd_num;
	}
	public int getBd_cm_num() {
		return bd_cm_num;
	}
	public void setBd_cm_num(int bd_cm_num) {
		this.bd_cm_num = bd_cm_num;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getRe_step() {
		return re_step;
	}
	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}
	public int getRe_level() {
		return re_level;
	}
	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}
	
}
