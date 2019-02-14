package com.mixblog.service;

import java.util.List;

import com.mixblog.pojo.Resources;

public interface ResourcesService {
	/* 文章列表 */
	List<Resources> rlist(int startPos, int pageSize);
	List<Resources> rflsplist(int startPos, int pageSize);
	List<Resources> rsysplist(int startPos, int pageSize);
	List<Resources> rjpttlist(int startPos, int pageSize);
	List<Resources> rzxsplist(int startPos, int pageSize);
	/* 统计文章数量 */
	Integer rcount();
	Integer rflspcount();
	Integer rsyspcount();
	Integer rjpttcount();
	Integer rzxspcount();
	/* 新增文章 */
	void radd(Resources resources);

	/* 新增文章前查询是否存在重复 */
	Integer rsrname(String rname);

	/* 查询单个资源的详情 */
	Resources rselectno(Integer rid);

	/* 更新保存文章接口 */
	void pupdate(Resources resources);

	/* 搜索资源 */
	List<Resources> rsearch(String rname);

	/* 删除文章 */
	void adminpdel(Integer rid);
	
	
	



	

	



}
