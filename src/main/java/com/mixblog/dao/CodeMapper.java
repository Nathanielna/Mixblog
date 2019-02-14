package com.mixblog.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mixblog.pojo.Code;

public interface CodeMapper {
	/* 查询充值码是否有效 */
	Code cselect(String codevar);
	
	/* 充值码状态改为已使用 */
	void cuse(String codevar);
	
	/* 充值码列表 */
	/* 充值码列表 */
	List<Code> clist(int startPos, int pageSize);
	
	/* 添加充值码 */
	void ccodeadd(Code code);
	
	/* 查询是否存在重复充值码 */
	Integer ccodeselect(Code code);
	
	/* 统计总数 */
	Integer ccount();
	List<Code> csearch(@Param("codevar") String codevar);
	Integer cucount();
	Integer cncount();
	
}
