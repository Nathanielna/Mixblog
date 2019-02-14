package com.mixblog.service;

import java.util.List;


import com.mixblog.pojo.Code;
import com.mixblog.pojo.User;

public interface UserService {
	/* 登陆认证 */
	User userselect(User user);
	/* 注册时查询是否有重复的用户名 */
	User userselectone(String uname);
	/* 用户注册 */
	void useradd(User user);
	/* 判断会员是否过期 */
	void userpdvip(User user);
	/* 保存用户信息 */
	void usersave(User user);
	/* 查询单个信息 */
	User userselectus(String name);

	/* 开通VIP */
	void userktvip(Integer cmoney,Integer uid);

	/* 续费VIP */
	void userktvip1(Integer cmoney, Integer uid);

	/* 充值金额 */
	void umoneyadd(User user, Code code);

	/* 修改密码 */
	void usermodify(String upw,Integer uid);

	/* 用户列表 */
	List<User> uuserlist(int startPos, int pageSize);

	/* 统计会员总数 */
	Integer ucount();
	Integer ucountvip();

	/* 通过邮箱用户名搜索 */
	List<User> usearch(String uname);

	/* 通过ID查询用户信息 */
	User uselect(Integer uid);

	/* 管理员后端保存用户信息 */
	void adusersave(User user);

	/* 后台删除用户 */
	void aduserdel(Integer uid);

	/* 通过邮箱找账户 */
	User selectbyemail(String uemail);

	/* 设置新密码 */
	void usersetpw(String uemail, String upw);


	
	
	
}
