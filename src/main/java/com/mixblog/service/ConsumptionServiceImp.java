package com.mixblog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mixblog.dao.ConsumptionMapper;
import com.mixblog.pojo.Consumption;
@Service
public class ConsumptionServiceImp implements ConsumptionService {
	@Autowired
	private ConsumptionMapper consumptionMapper;
	@Override
	public List<Consumption> clistone(Consumption consumption) {
		// TODO Auto-generated method stub
		return consumptionMapper.clistone(consumption);
	}

}
