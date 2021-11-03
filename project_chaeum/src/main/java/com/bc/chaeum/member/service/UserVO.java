package com.bc.chaeum.member.service;

import java.sql.Date;

public class UserVO {
	private String email;
	private String m_pass;
	private String nickname;
	private String phone;
	private String birth;
	private Date reg_date;
	private String rank;
	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getM_pass() {
		return m_pass;
	}
	public void setM_pass(String m_pass) {
		this.m_pass = m_pass;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	@Override
	public String toString() {
		return "UserVO [email=" + email + ", m_pass=" + m_pass + ", nickname=" + nickname + ", phone=" + phone
				+ ", birth=" + birth + ", reg_date=" + reg_date + ", rank=" + rank + "]";
	}
	
	
	
}
