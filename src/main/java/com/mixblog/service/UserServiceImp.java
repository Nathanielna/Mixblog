package com.mixblog.service;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mixblog.dao.CodeMapper;
import com.mixblog.dao.ConsumptionMapper;
import com.mixblog.dao.RechargeMapper;
import com.mixblog.dao.UserMapper;
import com.mixblog.pojo.Code;
import com.mixblog.pojo.User;
@Service
public class UserServiceImp implements UserService {
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private ConsumptionMapper consumptionMapper;
	@Autowired
	private CodeMapper codeMapper;
	@Autowired
	private RechargeMapper rechargeMapper;
	
	

	/* 用户认证登录 */
	@Override
	public User userselect(User user) {
		// TODO Auto-generated method stub
		return userMapper.userselect(user);
	}

	/* 用户注册 */
	@Override
	public void useradd(User user) {
		// TODO Auto-generated method stub
		 userMapper.useradd(user);
	}
	/* 插入数据前查询重复 */
	@Override
	public User userselectone(String uname) {
		return userMapper.userselectone(uname);
	}

	/* 判断会员是否过期 */
	@Override
	public void userpdvip(User user) {
		userMapper.userpdvip(user);
		
	}

	/* 保存用户信息 */
	@Override
	public void usersave(User user) {
		userMapper.usersave(user);
	}

	/* 查询单个信息 */
	public User userselectus(String name) {
		// TODO Auto-generated method stub
		return userMapper.userselectus(name);
	}

	/* 开通VIP */
	@Override
	public void userktvip(Integer cmoney,Integer uid) {
		if(cmoney == 30) {
			userMapper.userktvip1(uid);
			userMapper.userudqvip1(uid);
			userMapper.userktvip(uid);
			consumptionMapper.cadd1(uid);
			
		}else if(cmoney == 50) {
			userMapper.userktvip2(uid);
			userMapper.userudqvip2(uid);
			userMapper.userktvip(uid);
			consumptionMapper.cadd2(uid);
		}else if(cmoney == 66) {
			userMapper.userktvip3(uid);
			userMapper.userudqvip3(uid);
			userMapper.userktvip(uid);
			consumptionMapper.cadd3(uid);
		}
	}
		/* 续费VIP */
		@Override
		public void userktvip1(Integer cmoney,Integer uid) {
			if(cmoney == 30) {
				userMapper.userktvip1(uid);
				userMapper.userudqvip11(uid);
				consumptionMapper.cadd1(uid);
				
			}else if(cmoney == 50) {
				userMapper.userktvip2(uid);
				userMapper.userudqvip22(uid);
				consumptionMapper.cadd2(uid);
			}else if(cmoney == 66) {
				userMapper.userktvip3(uid);
				userMapper.userudqvip33(uid);
				consumptionMapper.cadd3(uid);
			}
	}

	/* 充值金额到余额 */
		@Override
		public void umoneyadd(User user, Code code) {
			Code cselect = codeMapper.cselect(code.getCodevar());
			if(cselect.getCodequota()==30) {
				userMapper.umoneyadd1(user.getUid());
				System.out.println(user.getUid());
				rechargeMapper.radd1(user.getUid());
			}else if(cselect.getCodequota()==50) {
				userMapper.umoneyadd2(user.getUid());
				rechargeMapper.radd2(user.getUid());
			}else if(cselect.getCodequota()==66) {
				userMapper.umoneyadd3(user.getUid());
				rechargeMapper.radd3(user.getUid());
			}
		}

		/* 修改密码 */
		public void usermodify(String upw,Integer uid) {
			userMapper.usermodify(upw,uid);
			
		}

		/* 用户列表 */
		@Override
		public List<User> uuserlist(int startPos, int pageSize) {
			// TODO Auto-generated method stub
			return userMapper.uuserlist(startPos, pageSize);
		}

		/* 统计会员人数 */
		@Override
		public Integer ucount() {
			// TODO Auto-generated method stub
			return userMapper.ucount();
		}

		@Override
		public Integer ucountvip() {
			// TODO Auto-generated method stub
			return userMapper.ucountvip();
		}
		/* 通过邮箱用户名搜索 */

		@Override
		public List<User> usearch(String uname) {
			// TODO Auto-generated method stub
			return userMapper.usearch(uname);
		}

		@Override
		public User uselect(Integer uid) {
			// TODO Auto-generated method stub
			return userMapper.uselect(uid);
		}

		@Override
		public void adusersave(User user) {
			// TODO Auto-generated method stub
			System.out.println(user.getUpw());
			System.out.println(user.getUid());
			userMapper.adusersave(user);
		}

		@Override
		public void aduserdel(Integer uid) {
			// TODO Auto-generated method stub
			userMapper.aduserdel(uid);
		}

		@Override
		public User selectbyemail(String uemail) {
			// TODO Auto-generated method stub
			return userMapper.selectbyemail(uemail);
		}

		@Override
		public void usersetpw(String uemail, String upw) {
			// TODO Auto-generated method stub
			userMapper.usersetpw(uemail, upw);
		}

		
		}
		

	



	
	

	




