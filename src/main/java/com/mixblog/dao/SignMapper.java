package com.mixblog.dao;

import java.util.List;
import com.mixblog.pojo.Sign;

public interface SignMapper {
	/* 创建登陆记录 */
	void signadd(Sign sign);
	
	/* 登录记录表 */
	/* List<Sign> slist(); */
	Integer scount();
	List<Sign> slist(int startPos, int pageSize);
}
