package com.mixblog.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mixblog.pojo.Admin;
import com.mixblog.pojo.Code;
import com.mixblog.pojo.Md5;
import com.mixblog.pojo.Notice;
import com.mixblog.pojo.Page;
import com.mixblog.pojo.Resources;
import com.mixblog.pojo.Sign;
import com.mixblog.pojo.User;
import com.mixblog.service.AdminService;
import com.mixblog.service.CodeService;
import com.mixblog.service.ResourcesService;
import com.mixblog.service.SignService;
import com.mixblog.service.NoticeService;
import com.mixblog.service.UserService;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;
	@Autowired
	private UserService userservice;
	@Autowired
	private ResourcesService resourcesService;
	@Autowired
	private CodeService codeService;
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private SignService signService;

	/* 管理员登录页面 */
	@RequestMapping(value = "adminlogin")
	public String AdminLogin(HttpSession session) {
		session.removeAttribute("admin");
		return "admin/adminlogin";
	}

	/* 管理员登陆接口 */
	@RequestMapping(value = "adminlogin1")
	public @ResponseBody String AdminLogin1(Admin admin, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) {
		Admin select = adminService.adminselect(admin.getAuser(), admin.getApw());
		if (select != null) {
			/*
			 * cookie设置 时长 Cookie cookie = new Cookie("key","value");
			 * cookie.setMaxAge(9999999); cookie.setPath(request.getContextPath());
			 * response.addCookie(cookie); System.out.println(cookie.getMaxAge());
			 * System.out.println(cookie); System.out.println(cookie.getName());
			 * System.out.println(cookie.getValue());
			 */
			
			session.setAttribute("admin", select);
			session.setMaxInactiveInterval(99999999);
			return "ok";
		} else {
			return "no";
		}
	}

	/* 修改管理员密码页面 */
	@RequestMapping(value = "adminpw")
	public String AdminPw() {
		return "admin/adminpwed";
	}

	/* 修改管理员密码接口 */
	@RequestMapping(value = "adminpwedit")
	public @ResponseBody String AdminPwedit(Admin admin, HttpSession session) {
		Admin admin1 = (Admin) session.getAttribute("admin");
		if (admin.getApw() != null) {
			adminService.adminpwedit(admin1.getAid(), admin.getApw());
			return "ok";
		} else {

			return "no";
		}
	}

	/* 管理首页页面 */
	@RequestMapping(value = "adminhome")
	public String AdminHome(ModelMap map) {
		/* 用户总数 */
		Integer c = userservice.ucount();
		/* Vip总数 */
		Integer v = userservice.ucountvip();
		/* 资源总数 */
		Integer r = resourcesService.rcount();
		Integer rfl = resourcesService.rflspcount();
		Integer rsy = resourcesService.rsyspcount();
		Integer rjp = resourcesService.rjpttcount();
		Integer rzx = resourcesService.rzxspcount();
		/* 充值码数量 */
		Integer co = codeService.ccount();
		Integer cou = codeService.cucount();
		Integer con = codeService.cncount();
		map.put("c", c);
		map.put("r", r);
		map.put("v", v);
		map.put("rfl", rfl);
		map.put("rsy", rsy);
		map.put("rjp", rjp);
		map.put("rzx", rzx);
		map.put("cou", cou);
		map.put("con", con);
		map.put("co", co);
		return "admin/home";
	}

	/* 文章列表页面 */
	@RequestMapping(value = "adminpost")
	public String AdminPost(Model model, Resources resources, HttpServletRequest request) {
		// 获取当前页数
		String pageNow = request.getParameter("pageNow");
		// 获取总页数
		int totalCount = (Integer) resourcesService.rcount();
		Page page = null;
		List<Resources> list = new ArrayList<Resources>();
		if (pageNow != null) {
			page = new Page(Integer.parseInt(pageNow), totalCount);
			list = this.resourcesService.rlist(page.getStartPos(), page.getPageSize());
		} else {
			page = new Page(1, totalCount);
			list = this.resourcesService.rlist(page.getStartPos(), page.getPageSize());
		}
		model.addAttribute("rlist", list);
		model.addAttribute("page", page);
		model.addAttribute("totalCount", totalCount);
		return "admin/adminpost";
	}

	/* 搜索文章 */
	@RequestMapping(value = "searchresources")
	public String SearchR(String rname, Model model) {
		List<Resources> rlist = resourcesService.rsearch(rname);
		model.addAttribute("rlist", rlist);
		return "admin/adminpost";

	}

	/* 写新文章页面 */
	@RequestMapping(value = "adminnewpost")
	public String AdminNewPost() {
		return "admin/adminnewpost";
	}

	/* 写新文章接口 */
	@RequestMapping(value = "adminnewpost1")
	public @ResponseBody String AdminNewPost1(Resources resources, HttpServletRequest reqeust) {
		Integer r = resourcesService.rsrname(resources.getRname());
		if (r == 1) {
			return "no";
		} else {
			Pattern p_img = Pattern.compile("(<img[^>]+src\\s*=\\s*['\"]([^'\"]+)['\"][^>]*>)");
			Matcher m_img = p_img.matcher(reqeust.getParameter("rcontent"));
			while (m_img.find()) {
				System.out.println(m_img);
				String img = m_img.group(2); // m_img.group(1) 为获得整个img标签 m_img.group(2) 为获得src的值
				System.out.println(img);
				resources.setRpic(img);
				break;
			}
			resourcesService.radd(resources);
			return "ok";
		}

	}

	/* 文章编辑页面 */
	@RequestMapping(value = "adminpedit")
	public String AdminPedit(Integer rid, HttpSession session) {
		Resources resources = resourcesService.rselectno(rid);
		session.setAttribute("resourcesed", resources);
		return "admin/adminpostedit";
	}

	/* 文章编辑接口 */
	@RequestMapping(value = "adminpedit1")
	public @ResponseBody String AdminPedit1(Resources resources, HttpSession session, HttpServletRequest reqeust) {
		Resources resources1 = (Resources) session.getAttribute("resourcesed");
		resources.setRid(resources1.getRid());
		if (resources.getRid() != null) {
			String content = reqeust.getParameter("rcontent");
			String url = content.split("src=")[1].split("\"")[1];
			resources.setRpic(url);
			resourcesService.pupdate(resources);
			return "ok";
		} else {
			return "no";
		}
	}

	/* 删除文章接口 */
	@RequestMapping(value = "adminpdel")
	public String AdminPdel(Integer rid) {
		resourcesService.adminpdel(rid);
		return "redirect:adminpost";

	}

	/* 会员列表页面 */
	@RequestMapping(value = "adminuser")
	public String AdminUser(Model model, User user, HttpServletRequest request) {
		// 获取当前页数
		String pageNow = request.getParameter("pageNow");
		// 获取总页数
		int totalCount = (Integer) userservice.ucount();
		Page page = null;
		List<User> list = new ArrayList<User>();
		if (pageNow != null) {
			page = new Page(Integer.parseInt(pageNow), totalCount);
			list = this.userservice.uuserlist(page.getStartPos(), page.getPageSize());
		} else {
			page = new Page(1, totalCount);
			list = this.userservice.uuserlist(page.getStartPos(), page.getPageSize());
		}

		model.addAttribute("ulist", list);
		model.addAttribute("page", page);
		model.addAttribute("totalCount", totalCount);
		return "admin/adminuser";
	}

	/* 搜索会员 */
	@RequestMapping(value = "searchuser")
	public String SearchUser(String uname, Model model) {
		List<User> ulist = userservice.usearch(uname);
		System.out.println(ulist);
		model.addAttribute("ulist", ulist);
		return "admin/adminusers";
	}

	/* 管理会员 */
	@RequestMapping(value = "manageruser")
	public String Manageruser(Integer uid, HttpSession session) {
		User user = userservice.uselect(uid);
		session.setAttribute("user1", user);
		return "admin/adminuseredit";
	}

	/* 管理员后端保存用户信息接口 */
	@RequestMapping(value = "adusersave")
	public @ResponseBody String AdUserSave(User user, HttpSession session) {
		User attribute = (User) session.getAttribute("user1");
		System.out.println(user.getUpw());
		attribute.setUpw(Md5.md5Password(user.getUpw()));
		user.setUid(attribute.getUid());
		user.setUpw(attribute.getUpw());
		System.out.println(user.getUpw());
		userservice.adusersave(user);
		return "ok";
	}

	/* 删除会员 */
	@RequestMapping(value = "aduserdel")
	public String AduserDel(Integer uid) {
		userservice.aduserdel(uid);
		return "redirect:adminuser";

	}

	/* 充值码 */
	@RequestMapping(value = "admincode")
	public String AdminCode(Model model, HttpServletRequest request) {
		// 获取当前页数
		String pageNow = request.getParameter("pageNow");
		// 获取总页数
		int totalCount = (Integer) codeService.ccount();
		Page page = null;
		List<Code> list = new ArrayList<Code>();
		if (pageNow != null) {
			page = new Page(Integer.parseInt(pageNow), totalCount);
			list = this.codeService.clist(page.getStartPos(), page.getPageSize());
		} else {
			page = new Page(1, totalCount);
			list = this.codeService.clist(page.getStartPos(), page.getPageSize());
		}

		model.addAttribute("code", list);
		model.addAttribute("page", page);
		model.addAttribute("totalCount", totalCount);
		return "admin/admincode";

	}

	/* 搜索充值码 */
	@RequestMapping(value = "searchcode")
	public String SearchC(String codevar, Model model) {
		List<Code> clist = codeService.csearch(codevar);
		model.addAttribute("code", clist);
		return "admin/admincode";

	}

	/* 添加充值码页面 */
	@RequestMapping(value = "admincodenew")
	public String AdminCodeNew(Model model) {
		return "admin/admincodenew";
	}

	/* 添加充值码接口 */
	@RequestMapping(value = "admincode1")
	public @ResponseBody String AdminCode1(Code code) {
		System.out.println();
		Integer ccodeselect = codeService.ccodeselect(code);
		if (ccodeselect == null) {
			codeService.ccodeadd(code);
			return "ok";
		} else {
			return "no";
		}
	}

	/* 退出后台系统 */
	@RequestMapping(value = "adminexit")
	public String AdminExit(HttpSession session) {
		session.removeAttribute("admin");
		return "redirect:adminlogin";
	}

	/* 管理公告页面 */
	@RequestMapping(value = "adminnotice")
	public String AdminNotice(Model model) {
		List<Notice> system = noticeService.slist();
		model.addAttribute("system", system);
		return "admin/adminnotice";
	}

	/* 公告编辑页面 */
	@RequestMapping(value = "adminnedit")
	public String AdminNedit(Integer sid, HttpSession session) {
		Notice notice = noticeService.sselect(sid);
		session.setAttribute("noticeed", notice);
		return "admin/adminnedit";
	}

	/* 公告编辑接口 */
	@RequestMapping(value = "adminnedit1")
	public @ResponseBody String AdminNedit1(Notice notice, HttpSession session) {
		Notice notice1 = (Notice) session.getAttribute("noticeed");
		notice.setSid(notice1.getSid());
		if (notice.getSid() != null) {
			noticeService.nupdate(notice);
			return "ok";
		} else {
			return "no";
		}
	}

	/* 开发记录 */
	@RequestMapping(value = "development")
	public String Development() {
		return "admin/development";

	}

	/* 登录记录 */
	@RequestMapping(value = "adminsign")
	public String AdminSign(Model model, HttpServletRequest request) {
		// 获取当前页数
		String pageNow = request.getParameter("pageNow");
		// 获取总页数
		int totalCount = (Integer) signService.scount();
		Page page = null;
		List<Sign> list = new ArrayList<Sign>();
		if (pageNow != null) {
			page = new Page(Integer.parseInt(pageNow), totalCount);
			list = this.signService.slist(page.getStartPos(), page.getPageSize());
		} else {
			page = new Page(1, totalCount);
			list = this.signService.slist(page.getStartPos(), page.getPageSize());
		}

		model.addAttribute("slist", list);
		model.addAttribute("page", page);
		model.addAttribute("totalCount", totalCount);

		/*
		 * List<Sign> slist=signService.slist(); model.addAttribute("slist", slist);
		 */
		return "admin/adminsign";

	}
}
