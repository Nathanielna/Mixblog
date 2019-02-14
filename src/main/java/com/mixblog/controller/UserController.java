package com.mixblog.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.mixblog.pojo.Code;
import com.mixblog.pojo.Consumption;
import com.mixblog.pojo.MailUtil;
import com.mixblog.pojo.Md5;
import com.mixblog.pojo.Recharge;
import com.mixblog.pojo.Sign;
import com.mixblog.pojo.User;
import com.mixblog.service.CodeService;
import com.mixblog.service.ConsumptionService;
import com.mixblog.service.RechargeService;
import com.mixblog.service.SignService;
import com.mixblog.service.UserService;

import eu.bitwalker.useragentutils.Browser;
import eu.bitwalker.useragentutils.Version;
import eu.bitwalker.useragentutils.UserAgent;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private ConsumptionService consumptionService;
	@Autowired
	private CodeService codeService;
	@Autowired
	private RechargeService rechargeService;
	@Autowired
	private SignService signService;

	/* 用户登录页面 */
	@RequestMapping(value = "login")
	public String Login() {
		return "login";
	}

	/* 用户登陆接口 */
	@RequestMapping(value = "login1")
	public @ResponseBody String Login1(User user, HttpSession session, HttpServletRequest request) {
		user.setUpw(Md5.md5Password(user.getUpw()));
		user.setUemail(user.getUname());
		User select = userService.userselect(user);/* 查询用户名密码是否正确 */
		if (select != null) {
			
			
			  Browser browser =UserAgent.parseUserAgentString(request.getHeader("User-Agent")).getBrowser(); /*获取浏览器信息*/ 
			  Version version =browser.getVersion(request.getHeader("User-Agent")); /*获取浏览器版本号*/ 
			  String info =browser.getName() + "/" + version.getVersion(); /*浏览器信息客户端信息 */
			  /* 获取IP地址 */
			  String ip = null;
		        String ipAddresses = request.getHeader("X-Forwarded-For");
		        if (ipAddresses == null || ipAddresses.length() == 0 || "unknown".equalsIgnoreCase(ipAddresses)) {
		            ipAddresses = request.getHeader("Proxy-Client-IP");
		        }
		        if (ipAddresses == null || ipAddresses.length() == 0 || "unknown".equalsIgnoreCase(ipAddresses)) {
		            ipAddresses = request.getHeader("WL-Proxy-Client-IP");
		        }
		        if (ipAddresses == null || ipAddresses.length() == 0 || "unknown".equalsIgnoreCase(ipAddresses)) {
		            ipAddresses = request.getHeader("HTTP_CLIENT_IP");
		        }
		        if (ipAddresses == null || ipAddresses.length() == 0 || "unknown".equalsIgnoreCase(ipAddresses)) {
		            ipAddresses = request.getHeader("X-Real-IP");
		        }
		        if (ipAddresses != null && ipAddresses.length() != 0) {
		            ip = ipAddresses.split(",")[0];
		        }
		        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ipAddresses)) {
		            ip = request.getRemoteAddr();
		        }
		        
			  String str =IPApi.queryIP(ip); JSONObject jsonObject = JSONObject.parseObject(str);
			  String county = jsonObject.getJSONObject("result").getString("area")+jsonObject.getJSONObject("result").getString("location"); 
			  Sign sign = new Sign(); 
			  sign.setSignuid(select.getUid()); 
			  sign.setSignip(ip);
			  sign.setSignbrower(info); 
			  sign.setSigncountry(county);
			  signService.signadd(sign);
			 
			userService.userpdvip(user);/* 判断VIP是否过期 */
			session.setAttribute("user", select);
			return "ok";
		} else {
			return "no";
		}
	}

	/* 用户注册页面 */
	@RequestMapping(value = "register")
	public String Register() {
		return "register";
	}

	/* 用户注册接口 */
	@RequestMapping(value = "register1")
	public @ResponseBody String Register1(User user) {
		User userselectone = userService.userselectone(user.getUname());
		User userselectemail = userService.selectbyemail(user.getUemail());
		/* 注册前判断是否有用户名重复 */
		System.out.println(userselectemail);
		if (userselectone == null) {
			/* 判断邮箱是否存在 */
			if (userselectemail == null) {
				user.setUpw(Md5.md5Password(user.getUpw()));
				System.out.println(user.getUpw());
				userService.useradd(user);
				return "ok";
			} else {
				return "nn";

			}

		} else {
			return "no";
		}
	}

	/* 用户信息页面 */
	@RequestMapping(value = "userinfo")
	public String UserInfo(HttpSession session) {
		User user = (User) session.getAttribute("user");
		User userselectus = userService.userselectus(user.getUname());
		session.setAttribute("user", userselectus);
		return "user/userinfo";
	}

	/* 保存用户信息接口 */
	@RequestMapping(value = "usersave")
	public @ResponseBody String UserSave(User user, HttpSession session) {
		User attribute = (User) session.getAttribute("user");
		user.setUname(attribute.getUname());
		userService.usersave(user);
		System.out.println("OK");
		return "ok";
	}

	/* 用户充值记录页面 */
	@RequestMapping(value = "useradd")
	public String UserAdd(HttpSession session, Model model, Recharge recharge) {
		User attribute = (User) session.getAttribute("user");
		recharge.setRuserid(attribute.getUid());
		List<Recharge> rlist = rechargeService.rlistone(recharge);
		model.addAttribute("recharge", rlist);
		return "user/useradd";
	}

	/* 用户消费记录页面 */
	@RequestMapping(value = "usercart")
	public String UserCart(HttpSession session, Consumption consumption, Model model) {
		User attribute = (User) session.getAttribute("user");
		consumption.setCuserid(attribute.getUid());
		List<Consumption> clist = consumptionService.clistone(consumption);
		model.addAttribute("consumption", clist);
		return "user/usercart";
	}

	/* 用户钱包页面 */
	@RequestMapping(value = "usermoney")
	public String UserMoney(HttpSession session) {

		User attribute = (User) session.getAttribute("user");
		User uselect = userService.uselect(attribute.getUid());
		session.setAttribute("user", uselect);
		return "user/usermoney";
	}

	/* 用户充值接口 暂时不写 */
	@RequestMapping(value = "usermoneyadd")
	public String UserMoneyAdd() {
		return null;
	}

	/* 开通VIP接口 */
	@RequestMapping(value = "userktvip")
	public @ResponseBody String UserKtvip(Consumption consumption, HttpSession session) {
		User user = (User) session.getAttribute("user");
		/* 判断当前余额是否足够开通VIP */
		if (consumption.getCmoney() > user.getUbalance()) {
			return "no";
		} else {
			/* 续费 */
			if (user.getUvip() == 1) {
				userService.userktvip1(consumption.getCmoney(), user.getUid());
				return "ok1";
			} else {
				/* 首充 */
				userService.userktvip(consumption.getCmoney(), user.getUid());
				return "ok";
			}
		}
	}

	/* 充值码 接口 */
	@RequestMapping(value = "usercode")
	public @ResponseBody String UserCode(Code code, HttpSession session) {
		/* 查询充值码是否有效 */
		Code cselect = codeService.cselect(code.getCodevar());
		User user = (User) session.getAttribute("user");
		if (cselect == null) {
			return "error1";

		} else if (cselect.getCodetype() == 0) {
			/* 充值码状态改为已使用 */
			codeService.cuse(code);
			/* 为账户增加余额 */
			userService.umoneyadd(user, code);
			return "ok";
		} else if (cselect.getCodetype() == 1) {
			return "no";
		} else {
			return "error";
		}
	}

	/* 用户修改密码页面 */
	@RequestMapping(value = "usermodify")
	public String Usermodify() {
		return "user/usermodify";
	}

	/* 用户修改密码接口 */
	@RequestMapping(value = "usermodify1")
	public @ResponseBody String Usermodify1(String upw, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user.getUpw() != upw) {
			user.setUpw(Md5.md5Password(upw));
			userService.usermodify(user.getUpw(), user.getUid());
			session.removeAttribute("user");
			return "ok";
		} else {
			return "no";
		}
	}

	/* 用户退出系统 */
	@RequestMapping(value = "exitlogin")
	public String ExitLogin(HttpSession session,HttpServletRequest request,HttpServletResponse response,String uname) {
		session.removeAttribute("user");
		return "login";
	}

	/* 1.用户找回密码-输入邮箱页面 */
	@RequestMapping(value = "findpw")
	public String FindPw() {
		return "user/userfindpw";
	}

	/* 2.用户找回密码-提交邮箱地址 */
	@RequestMapping(value = "findpw1")
	public @ResponseBody String FindPw1(User user, HttpServletResponse response, HttpServletRequest request,
			HttpSession session) {
		User user1 = userService.selectbyemail(user.getUemail());/* 根据邮箱查询是否存在 */
		if (user1 != null) {
			System.out.println("收到请求");
			String text = String.valueOf((int) ((Math.random() * 9 + 1) * 100000));/* 生成随机验证码 */
			String email = user.getUemail();
			Map map = new HashMap();
			map.put("yzm", text);
			map.put("email", email);
			session.setAttribute("find", map);
			MailUtil.sendMail(email, "两点兔兔找回密码邮件", "你正在操作找回密码，验证码为" + text);
			return "success";
		} else {
			return "error";
		}

	}

	/* 3.用户找回密码-输入验证码页面判断正误 */
	@RequestMapping(value = "userJudge")
	public String UserJudge(HttpSession session) {
		if (session.getAttribute("find") != null) {/* 判断当前是否有找回密码请求 */
			return "user/userjudge";
		}
		return "login";
	}

	/* 4.用户找回密码-输入验证码判断正误 */
	@RequestMapping(value = "userJudge1")
	public @ResponseBody String UserJudge1(String yzm, HttpSession session) {
		Map attribute = (Map) session.getAttribute("find");
		if (attribute.get("yzm").equals(yzm)) {/* 随机数跟用户输入的验证码是否一致 */
			return "success";
		} else {
			return "error";
		}
	}

	/* 5.用户找回密码-设置新密码页面 */
	@RequestMapping(value = "userSetNew")
	public String UserSetNew(HttpSession session) {
		if (session.getAttribute("find") != null) {/* 判断当前是否有找回密码请求 */
			return "user/usersetnew";
		}
		return "login";
	}

	/* 6.用户找回密码-设置新密码 */
	@RequestMapping(value = "userSetNew1")
	public @ResponseBody String UserSetNew1(User user, HttpSession session) {
		Map attribute = (Map) session.getAttribute("find");
		String email = (String) attribute.get("email");
		System.out.println(email);
		userService.usersetpw(email, Md5.md5Password(user.getUpw()));
		session.removeAttribute("find");
		return "success";
	}
}
