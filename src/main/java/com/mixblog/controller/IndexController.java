package com.mixblog.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mixblog.pojo.Notice;
import com.mixblog.pojo.Page;
import com.mixblog.pojo.Resources;
import com.mixblog.pojo.User;
import com.mixblog.service.NoticeService;
import com.mixblog.service.ResourcesService;

@Controller
public class IndexController {
	
	@Autowired
	private ResourcesService resourcesService;
	@Autowired
	private NoticeService noticeService;
	/* 首页 */
	@RequestMapping(value="index")
	public String Index(HttpServletRequest request,Model model,HttpSession session,HttpServletResponse response,String uname) {
		//获取当前页数
        String pageNow=request.getParameter("pageNow");
        //获取总页数
        int totalCount=(Integer)resourcesService.rcount();
        Page page=null;
        List<Resources> list=new ArrayList<Resources>();
        if (pageNow!=null) {
            page=new Page(Integer.parseInt(pageNow), totalCount);
            list=this.resourcesService.rlist(page.getStartPos(),page.getPageSize());
        }else {
            page=new Page(1, totalCount);
            list=this.resourcesService.rlist(page.getStartPos(),page.getPageSize());
        }
        
        Notice sselect2 = noticeService.sselect2();
        session.setAttribute("sselect2", sselect2);
        Notice sselect1 = noticeService.sselect1();
        session.setAttribute("sselect1", sselect1);
		model.addAttribute("rlist", list);
		model.addAttribute("page", page);
		model.addAttribute("totalCount", totalCount);
		return "index";
	}
	/* 福利视频 */
	@RequestMapping(value="flsp")
	public String Flsp(HttpServletRequest request,Model model,HttpSession session) {
		//获取当前页数
        String pageNow=request.getParameter("pageNow");
        //获取总页数
        int totalCount=(Integer)resourcesService.rflspcount();
        Page page=null;
        List<Resources> list=new ArrayList<Resources>();
        if (pageNow!=null) {
            page=new Page(Integer.parseInt(pageNow), totalCount);
            list=this.resourcesService.rflsplist(page.getStartPos(),page.getPageSize());
        }else {
            page=new Page(1, totalCount);
            list=this.resourcesService.rflsplist(page.getStartPos(),page.getPageSize());
        }
        Notice sselect2 = noticeService.sselect2();
        session.setAttribute("sselect2", sselect2);
        Notice sselect1 = noticeService.sselect1();
        session.setAttribute("sselect1", sselect1);
		model.addAttribute("rflsplist", list);
		model.addAttribute("page", page);
		model.addAttribute("totalCount", totalCount);
		return "flsp";
	}
	/* 绳艺视频 */
	@RequestMapping(value="sysp")
	public String Sysp(HttpServletRequest request,Model model,HttpSession session) {
		//获取当前页数
        String pageNow=request.getParameter("pageNow");
        //获取总页数
        int totalCount=(Integer)resourcesService.rsyspcount();
        Page page=null;
        List<Resources> list=new ArrayList<Resources>();
        if (pageNow!=null) {
            page=new Page(Integer.parseInt(pageNow), totalCount);
            list=this.resourcesService.rsysplist(page.getStartPos(),page.getPageSize());
        }else {
            page=new Page(1, totalCount);
            list=this.resourcesService.rsysplist(page.getStartPos(),page.getPageSize());
        }
        Notice sselect2 = noticeService.sselect2();
        session.setAttribute("sselect2", sselect2);
        Notice sselect1 = noticeService.sselect1();
        session.setAttribute("sselect1", sselect1);
		model.addAttribute("rsysplist", list);
		model.addAttribute("page", page);
		model.addAttribute("totalCount", totalCount);
		return "sysp";
	}
	/* 精品套图 */
	@RequestMapping(value="jptt")
	public String Jptt(HttpServletRequest request,Model model,HttpSession session) {
		//获取当前页数
        String pageNow=request.getParameter("pageNow");
        //获取总页数
        int totalCount=(Integer)resourcesService.rjpttcount();
        Page page=null;
        List<Resources> list=new ArrayList<Resources>();
        if (pageNow!=null) {
            page=new Page(Integer.parseInt(pageNow), totalCount);
            list=this.resourcesService.rjpttlist(page.getStartPos(),page.getPageSize());
        }else {
            page=new Page(1, totalCount);
            list=this.resourcesService.rjpttlist(page.getStartPos(),page.getPageSize());
        }
        Notice sselect2 = noticeService.sselect2();
        session.setAttribute("sselect2", sselect2);
        Notice sselect1 = noticeService.sselect1();
        session.setAttribute("sselect1", sselect1);
		model.addAttribute("rjpttlist", list);
		model.addAttribute("page", page);
		model.addAttribute("totalCount", totalCount);
		return "jptt";
	}
	
	/* 在线视频 */
	@RequestMapping(value="zxsp")
	public String Zxsp(HttpServletRequest request,Model model,HttpSession session) {
		//获取当前页数
        String pageNow=request.getParameter("pageNow");
        //获取总页数
        int totalCount=(Integer)resourcesService.rzxspcount();
        Page page=null;
        List<Resources> list=new ArrayList<Resources>();
        if (pageNow!=null) {
            page=new Page(Integer.parseInt(pageNow), totalCount);
            list=this.resourcesService.rzxsplist(page.getStartPos(),page.getPageSize());
        }else {
            page=new Page(1, totalCount);
            list=this.resourcesService.rzxsplist(page.getStartPos(),page.getPageSize());
        } 
        Notice sselect2 = noticeService.sselect2();
        session.setAttribute("sselect2", sselect2);
        Notice sselect1 = noticeService.sselect1();
        session.setAttribute("sselect1", sselect1);
		model.addAttribute("rzxsplist", list);
		model.addAttribute("page", page);
		model.addAttribute("totalCount", totalCount);
		return "zxsp";
	}
	/* 资源详情页面 */
	@RequestMapping(value="zyxq")
	public String Zyxq(HttpSession session,Integer rid) {
		System.out.println(rid);
		User user = (User) session.getAttribute("user");
		session.setAttribute("user", user);
		Resources resources=resourcesService.rselectno(rid);
		session.setAttribute("resources", resources);
		
		return "details";	
	};
	
	/* 搜索资源 */
	@RequestMapping(value="search")
	public String Search(String rname,Model model,HttpSession session) {
		System.out.println(rname);
		List<Resources> rlist=resourcesService.rsearch(rname);
		Notice sselect2 = noticeService.sselect2();
        session.setAttribute("sselect2", sselect2);
        Notice sselect1 = noticeService.sselect1();
        session.setAttribute("sselect1", sselect1);
		model.addAttribute("rlist", rlist);
		return "soso";
		
	}
}
