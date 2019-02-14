package com.mixblog.pojo;

import java.util.Date;

public class Sign1 {
	private Integer signid;
	private Integer signuid;
	private String signip;
	private String signcountry;
	private Date signtime;
	private String signbrower;
	private String uname;
	public Integer getSignid() {
		return signid;
	}
	public void setSignid(Integer signid) {
		this.signid = signid;
	}
	public Integer getSignuid() {
		return signuid;
	}
	public void setSignuid(Integer signuid) {
		this.signuid = signuid;
	}
	public String getSignip() {
		return signip;
	}
	public void setSignip(String signip) {
		this.signip = signip;
	}
	
	public Date getSigntime() {
		return signtime;
	}
	public void setSigntime(Date signtime) {
		this.signtime = signtime;
	}
	public String getSignbrower() {
		return signbrower;
	}
	public void setSignbrower(String signbrower) {
		this.signbrower = signbrower;
	}
	public String getSigncountry() {
		return signcountry;
	}
	public void setSigncountry(String signcountry) {
		this.signcountry = signcountry;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	
}
