package com.mixblog.pojo;

import java.util.Date;

public class Consumption {
	private Integer cid;
	private Integer cuserid;
	private Integer cmoney;
	private String cpurpose;
	private Date ccreatetime;
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public Integer getCuserid() {
		return cuserid;
	}
	public void setCuserid(Integer cuserid) {
		this.cuserid = cuserid;
	}
	public Integer getCmoney() {
		return cmoney;
	}
	public void setCmoney(Integer cmoney) {
		this.cmoney = cmoney;
	}
	public String getCpurpose() {
		return cpurpose;
	}
	public void setCpurpose(String cpurpose) {
		this.cpurpose = cpurpose;
	}
	public Date getCcreatetime() {
		return ccreatetime;
	}
	public void setCcreatetime(Date ccreatetime) {
		this.ccreatetime = ccreatetime;
	}
	
}
