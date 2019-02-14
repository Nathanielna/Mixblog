package com.mixblog.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mixblog.pojo.Code;
import com.mixblog.pojo.User;

public interface UserMapper {
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
	/* 充值金额 */
	void umoneyadd(@Param("code")Code code, @Param("uid")Integer uid);

	/* 开通VIP */
			/* 开通VIP账户扣钱 */
			void userktvip1(Integer uid);
			void userktvip2(Integer uid);
			void userktvip3(Integer uid);
			void userktvip4(Integer uid);
			void userktvip5(Integer uid);
	
			/* 开通计时 */
			void userudqvip1(Integer uid);
			void userudqvip2(Integer uid);
			void userudqvip3(Integer uid);
			void userudqvip4(Integer uid);
			void userudqvip5(Integer uid);

			/* 改变会员状态 */
			void userktvip(Integer uid);
			/* 续费VIP */
			/* 续费计时 */
			void userudqvip11(Integer uid);
			void userudqvip22(Integer uid);
			void userudqvip33(Integer uid);
			void userudqvip44(Integer uid);
			void userudqvip55(Integer uid);
			
			/* 充值码使用增加用户余额 */
			void umoneyadd1(Integer uid);
			void umoneyadd2(Integer uid);
			void umoneyadd3(Integer uid);
			void umoneyadd4(Integer uid);
			void umoneyadd5(Integer uid);

			/* 修改密码 */
			void usermodify(String upw,Integer uid);
			/* 用户列表 */
			List<User> uuserlist(int startPos, int pageSize);
			/* 统计会员总数 */
			Integer ucount();

				/* 统计VIP人数 */
			Integer ucountvip();
			/* 通过邮箱用户名搜索 */
			List<User> usearch(@Param("uname") String uname);
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


			