package com.mixblog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mixblog.dao.SignMapper;
import com.mixblog.pojo.Sign;

@Service
public class SignServiceImp implements SignService {
	@Autowired
	private SignMapper signMapper;
	@Override
	public void signadd(Sign sign) {
		// TODO Auto-generated method stub
		signMapper.signadd(sign);
	}
	/*
	 * @Override public List<Sign> slist() { // TODO Auto-generated method stub
	 * return signMapper.slist(); }
	 */
	@Override
	public Integer scount() {
		// TODO Auto-generated method stub
		return signMapper.scount();
	}
	@Override
	public List<Sign> slist(int startPos, int pageSize) {
		// TODO Auto-generated method stub
		return signMapper.slist(startPos, pageSize);
	}
		

}
