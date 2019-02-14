package com.mixblog.pojo;

import java.util.Date;

public class Code {
	private Integer codeid;
	private Integer codequota;
	private String codevar;
	private Integer codetype;
	private Date codetime;
	public Integer getCodeid() {
		return codeid;
	}
	public void setCodeid(Integer codeid) {
		this.codeid = codeid;
	}
	public String getCodevar() {
		return codevar;
	}
	public void setCodevar(String codevar) {
		this.codevar = codevar;
	}
	public Integer getCodetype() {
		return codetype;
	}
	public void setCodetype(Integer codetype) {
		this.codetype = codetype;
	}
	public Integer getCodequota() {
		return codequota;
	}
	public void setCodequota(Integer codequota) {
		this.codequota = codequota;
	}
	public Date getCodetime() {
		return codetime;
	}
	public void setCodetime(Date codetime) {
		this.codetime = codetime;
	}
	
}
