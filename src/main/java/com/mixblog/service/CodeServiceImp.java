package com.mixblog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mixblog.dao.CodeMapper;
import com.mixblog.pojo.Code;

@Service
public class CodeServiceImp implements CodeService {
	@Autowired
	private CodeMapper codeMapper;
	/* 查询充值码是否有效 */
	@Override
	public Code cselect(String codevar) {
		return codeMapper.cselect(codevar);
	}
	/* 充值码状态改为已使用 */
	@Override
	public void cuse(Code code) {
		codeMapper.cuse(code.getCodevar());
	}
	/* 添加充值码 */
	@Override
	public void ccodeadd(Code code) {
		codeMapper.ccodeadd(code);
		
	}

	/* 查询是否存在重复充值码 */
	@Override
	public Integer ccodeselect(Code code) {
		return codeMapper.ccodeselect(code);
		
	}

	/* 统计 */
	@Override
	public Integer ccount() {
		// TODO Auto-generated method stub
		return codeMapper.ccount();
	}
	@Override
	public List<Code> clist(int startPos, int pageSize) {
		// TODO Auto-generated method stub
		return codeMapper.clist(startPos, pageSize);
	}
	@Override
	public List<Code> csearch(String codevar) {
		// TODO Auto-generated method stub
		return codeMapper.csearch(codevar);
	}
	@Override
	public Integer cucount() {
		// TODO Auto-generated method stub
		return codeMapper.cucount();
	}
	@Override
	public Integer cncount() {
		// TODO Auto-generated method stub
		return codeMapper.cncount();
	}
	
	

}
