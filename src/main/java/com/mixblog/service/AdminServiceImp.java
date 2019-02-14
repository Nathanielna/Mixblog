package com.mixblog.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mixblog.dao.AdminMapper;
import com.mixblog.pojo.Admin;
@Service
public class AdminServiceImp implements AdminService {
	@Autowired
	private AdminMapper adminMapper;

	@Override
	public Admin adminselect(String auser, String apw) {
		// TODO Auto-generated method stub
		Admin select = adminMapper.adminselect(auser, apw);
		return select;
	}

	@Override
	public void adminpwedit(Integer aid, String apw) {
		adminMapper.adminpwedit(aid, apw);
		
	}



}
