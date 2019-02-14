package com.mixblog.dao;

import com.mixblog.pojo.Admin;

public interface AdminMapper {
	Admin adminselect(String auser, String apw);
	void adminpwedit(Integer aid, String apw);
}
