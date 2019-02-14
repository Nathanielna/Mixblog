package com.mixblog.interceotor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.mixblog.pojo.Admin;

public class Interceptor2 implements HandlerInterceptor {

	
	//当前拦截器中的preHandle放行，才会运行这个afterCompletion
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// 页面渲染之后
		
	}

	
	
	//所有拦截器都放行，才会运行这个方法
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object arg2, ModelAndView arg3)
			throws Exception {
		// controller中方法执行之后
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		// controller中方法执行之前
		//判断是域名是否是 /denglu.action,如果是放心
		//如果不是/denglu.action，判断用户是否登录过，如果没有登录，重定向到登录页面，如果登录过，放行
		
		String requestURI = request.getRequestURI();
		if(!requestURI.contains("/adminlogin")) {//比如你输入plist.action，判断是否登录过
			Admin admin = (Admin)request.getSession().getAttribute("admin");
			if(admin==null) {//没有登录过
				response.sendRedirect(request.getContextPath()+"/login");
				response.getWriter().write("");
				return false;
			}
		}
		return true;//是否放行
	}

}
