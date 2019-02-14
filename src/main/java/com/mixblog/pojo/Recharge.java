package com.mixblog.pojo;

import java.util.Date;

public class Recharge {
	private Integer rid;
	private Integer ruserid;
	private Integer rmoney;
	private String rpurpose;
	private Date rcreatetime;
	public Integer getRid() {
		return rid;
	}
	public void setRid(Integer rid) {
		this.rid = rid;
	}
	public Integer getRuserid() {
		return ruserid;
	}
	public void setRuserid(Integer ruserid) {
		this.ruserid = ruserid;
	}
	public Integer getRmoney() {
		return rmoney;
	}
	public void setRmoney(Integer rmoney) {
		this.rmoney = rmoney;
	}
	public String getRpurpose() {
		return rpurpose;
	}
	public void setRpurpose(String rpurpose) {
		this.rpurpose = rpurpose;
	}
	public Date getRcreatetime() {
		return rcreatetime;
	}
	public void setRcreatetime(Date rcreatetime) {
		this.rcreatetime = rcreatetime;
	}
	
}
