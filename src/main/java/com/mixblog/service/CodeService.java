package com.mixblog.service;

import java.util.List;


import com.mixblog.pojo.Code;

public interface CodeService {


	/* 查询充值码是否有效 */
	Code cselect(String codevar);
	/* 充值码状态改为已使用 */
	void cuse(Code code);

	/* 充值码列表 */
	List<Code> clist(int startPos, int pageSize);

	/* 添加充值码 */
	void ccodeadd(Code code);

	/* 查询是否存在重复充值码 */
	Integer ccodeselect(Code code);

	/* 统计总数 */
	Integer ccount();
	List<Code> csearch(String codevar);
	Integer cucount();
	Integer cncount();
	
	
	

}
