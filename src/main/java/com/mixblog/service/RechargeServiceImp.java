package com.mixblog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mixblog.dao.RechargeMapper;
import com.mixblog.pojo.Recharge;
@Service
public class RechargeServiceImp implements RechargeService {
	@Autowired
	private RechargeMapper rechargeMapper;
	@Override
	public List<Recharge> rlistone(Recharge recharge) {
		// TODO Auto-generated method stub
		return rechargeMapper.rlistone(recharge);
	}

}
