package com.mixblog.dao;

import java.util.List;

import com.mixblog.pojo.Notice;

public interface NoticeMapper {
	/* 获取公告列表 */
	List<Notice> slist();
	
	/* 编辑公告 */
	Notice sselect(Integer sid);
	

	/* 首页公告 */
	Notice sselect1();
	Notice sselect2();
	Notice sselect3();
	/* 编辑公告保存 */
	void nupdate(Notice notice);
}
