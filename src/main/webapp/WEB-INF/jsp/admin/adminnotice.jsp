<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>两点兔兔 - 模块管理</title>
<%@include file="commons.jspf" %>
</head>
<body>
	<nav class="navbar navbar-inverse" role="navigation">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${pageContext.request.contextPath}/adminhome">后台管理系统</a>
        </div>
    
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav ">
                <li><a href="${pageContext.request.contextPath}/adminhome">首页</a></li>
                <li><a href="${pageContext.request.contextPath}/adminuser">会员列表</a></li>
                <li><a href="${pageContext.request.contextPath}/adminpost">文章列表</a></li> 
                <li><a href="${pageContext.request.contextPath}/admincode">充值码列表</a></li>
                <li class="active"><a href="${pageContext.request.contextPath}/adminnotice">公告管理</a></li>
                <li><a href="${pageContext.request.contextPath}/adminsign">登录记录</a></li>
                <li><a href="${pageContext.request.contextPath}/development">开发记录</a></li> 
                
            </ul>
            <ul class="nav navbar-nav navbar-right">
                 <li><a href="${pageContext.request.contextPath}/index" target="_blank">前台</a></li>
                 <li><a href="${pageContext.request.contextPath}/adminpw">修改管理员密码</a></li>
                <li><a href="${pageContext.request.contextPath}/adminexit">退出系统</a></li>
                <li class="dropdown">
                    <!-- <a href="#" class="dropdown-toggle" data-toggle="dropdown">个人中心 <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">登陆/注册</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li><a href="#">Separated link</a></li>
                    </ul> -->
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </nav>
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-3">               
            </div>
            <div class="col-lg-6">
            <ol class="breadcrumb">
				  <li><a href="${pageContext.request.contextPath}/adminhome">首页</a></li>
				  <li class="active">公告管理</li>
			</ol>
                    <table class="table table-hover">
                            <caption>公告管理</caption>
                            <thead>
                              <tr>
                                <th>公告位置</th>
                                <th>公告标题</th>
                                <th>公告内容</th>
                                <th>操作</th>
                              </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${system}" var="s">
                            	<tr>
                                <td>${s.smodular}</td>
                                <td>${s.stitle}</td>
                                <td>${s.scontent}</td>
                                <td>
                                	<a class="btn btn-primary" href="${pageContext.request.contextPath}/adminnedit?sid=${s.sid}" role="button">编辑公告</a>
                                </td>
                              </tr>
                            </c:forEach>
                            </tbody>
                          </table>
                    	 	
            </div>
            <div class="col-lg-3">
                   
            </div>
        </div>
    </div>
</body>
</html>