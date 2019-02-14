package com.mixblog.service;

import com.mixblog.pojo.Admin;

public interface AdminService {

	Admin adminselect(String auser, String apw);

	void adminpwedit(Integer aid, String apw);

}
