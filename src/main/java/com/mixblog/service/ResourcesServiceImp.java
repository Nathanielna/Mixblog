package com.mixblog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mixblog.dao.ResourcesMapper;
import com.mixblog.pojo.Resources;
@Service
public class ResourcesServiceImp implements ResourcesService {
	@Autowired
	private ResourcesMapper resourcesMapper;
	
	@Override
	public Integer rcount() {
		// TODO Auto-generated method stub
		return resourcesMapper.rcount();
	}
	@Override
	public void radd(Resources resources) {
		resourcesMapper.radd(resources);
		
	}
	/* 新增文章前查询是否存在重复 */
	@Override
	public Integer rsrname(String rname) {
		// TODO Auto-generated method stub
		return resourcesMapper.rsrname(rname);
	}
	@Override
	public List<Resources> rlist(int startPos, int pageSize) {
		// TODO Auto-generated method stub
		return resourcesMapper.rlist(startPos, pageSize);
	}
	@Override
	public Integer rflspcount() {
		// TODO Auto-generated method stub
		return resourcesMapper.rflspcount();
	}
	@Override
	public List<Resources> rflsplist(int startPos, int pageSize) {
		// TODO Auto-generated method stub
		return resourcesMapper.rflsplist(startPos, pageSize);
	}
	@Override
	public List<Resources> rsysplist(int startPos, int pageSize) {
		// TODO Auto-generated method stub
		return resourcesMapper.rsysplist(startPos, pageSize);
	}
	@Override
	public List<Resources> rjpttlist(int startPos, int pageSize) {
		// TODO Auto-generated method stub
		return resourcesMapper.rjpttlist(startPos, pageSize);
	}
	@Override
	public Integer rsyspcount() {
		// TODO Auto-generated method stub
		return resourcesMapper.rsyspcount();
	}
	@Override
	public Integer rjpttcount() {
		// TODO Auto-generated method stub
		return resourcesMapper.rjpttcount();
	}

	/* 查询单个资源详情 */
	@Override
	public Resources rselectno(Integer rid) {
		return resourcesMapper.rselectno(rid);
	}
	@Override
	public void pupdate(Resources resources) {
		// TODO Auto-generated method stub
		resourcesMapper.pupdate(resources);
	}

	/* 搜索资源 */
	@Override
	public List<Resources> rsearch(String rname) {
		// TODO Auto-generated method stub
		return resourcesMapper.rsearch(rname);
		
	}

	/* 删除文章 */
	@Override
	public void adminpdel(Integer rid) {
		resourcesMapper.adminpdel(rid);
		
	}
	@Override
	public Integer rzxspcount() {
		// TODO Auto-generated method stub
		return resourcesMapper.rzxspcount();
	}
	@Override
	public List<Resources> rzxsplist(int startPos, int pageSize) {
		// TODO Auto-generated method stub
		return resourcesMapper.rzxsplist(startPos, pageSize);
	}


}
