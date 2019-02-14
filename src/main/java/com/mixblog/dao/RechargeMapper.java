package com.mixblog.dao;

import java.util.List;

import com.mixblog.pojo.Recharge;

public interface RechargeMapper {
	List<Recharge> rlistone(Recharge recharge);
	
	void radd1(Integer uid);
	void radd2(Integer uid);
	void radd3(Integer uid);
	void radd4(Integer uid);

	void radd5(Integer uid);
}
