<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
         <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>两点兔兔 - 用户搜索</title>
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
                <li class="active"><a href="${pageContext.request.contextPath}/adminuser">会员列表</a></li>
                <li><a href="${pageContext.request.contextPath}/adminpost">文章列表</a></li> 
                <li><a href="${pageContext.request.contextPath}/admincode">充值码列表</a></li>
                <li><a href="${pageContext.request.contextPath}/adminnotice">公告管理</a></li>
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
            <div class="col-lg-2">
                    
            </div>
           
            <div class="col-lg-8">
                    <form action="searchuser" class="navbar-form navbar-right" role="search">
                            <div class="form-group">
                                <input type="text" class="form-control" name="uname" placeholder="输入搜索的用户名或邮箱">
                            </div>
                            <button type="submit" class="btn btn-default">搜索</button>
                        </form>
                    <table class="table table-hover">
                    		
                            <caption>当前会员列表</caption>
                            <thead>
                              <tr>
                                <th>兔兔号</th>
                                <th>用户名</th>
                                <th>邮箱</th>
                                <th>QQ</th>
                                <th>当前组</th>
                                <th>会员到期时间</th>
                                <th>用户余额</th>
                                <th>操作</th>
                              </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${ulist}" var="u">
                            	<tr>
                            	<td>${u.uid}</td>
                                <td>${u.uname}</td>
                                <td>${u.uemail}</td>
                                <td>${u.uqq}</td>
                                <td>
                                	<c:if test="${u.uvip == 1}">
                                		VIP会员
                                	</c:if>
                                	<c:if test="${u.uvip == 0}">
                                		普通会员
                                	</c:if>
                                </td>
                                <td><fmt:formatDate value="${u.udqvip}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                <td>${u.ubalance}</td>
                                <td>
                                    <button type="button" class="btn btn-info">查看具体信息</button>
                                    <button type="button" class="btn btn-danger">删除用户</button>
                                </td>
                              </tr>
                            </c:forEach>
                            </tbody>
                          </table>
            </div>
            <div class="col-lg-2">
                   
            </div>
        </div>
    </div>
</body>
</html>