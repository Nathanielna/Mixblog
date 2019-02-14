<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>${sessionScope.resources.rname} - 两点兔兔</title>
<%@include file="commons.jspf" %>
<style> 
.divcss5{ width:300px; height:50px; line-height:25px; overflow:hidden} 
/* 设置对象高度宽度，同时设置overflow:hidden */ 


</style>
</head>
<body>
	<nav class="navbar navbar-default" role="navigation">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${pageContext.request.contextPath}/index">两点兔兔</a>
        </div>
    
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav ">
                <li><a href="${pageContext.request.contextPath}/index">首页</a></li>
                <li><a href="${pageContext.request.contextPath}/flsp">福利视频</a></li>
                <li><a href="${pageContext.request.contextPath}/sysp">绳艺视频</a></li>
                <li><a href="${pageContext.request.contextPath}/jptt">精品套图</a></li>
                <li><a href="${pageContext.request.contextPath}/zxsp">在线视频</a></li>
            </ul>
            
            <form class="navbar-form navbar-right" role="search">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="输入想要的资源">
                </div>
                <button type="submit" class="btn btn-default">搜索</button>
            </form>
            <ul class="nav navbar-nav navbar-right">
            	<c:if test="${sessionScope.user == null}">
            		<li><a href="${pageContext.request.contextPath}/login">登陆</a></li>
                    <li><a href="${pageContext.request.contextPath}/register">注册</a></li>
            	</c:if>
            	<c:if test="${sessionScope.user != null}">
                	<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">个人中心 <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="${pageContext.request.contextPath}/userinfo">个人信息</a></li>
                        <li><a href="${pageContext.request.contextPath}/usermoney">我的资产</a></li>
                        <li><a href="${pageContext.request.contextPath}/usercart">消费清单</a></li>
                        <li><a href="${pageContext.request.contextPath}/useradd">充值记录</a></li>
                        <li><a href="${pageContext.request.contextPath}/usermodify">修改密码</a></li>
                        <li><a href="${pageContext.request.contextPath}/exitlogin">退出登录</a></li>
                    </ul> 
                </li>
                </c:if>
            </ul>
        </div>
    </nav>
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-2">
            	
            	</div>
            	
            <div class="col-lg-8">
			            <c:if test="${sessionScope.user == null}">
			            	<div class="col-lg-12">
			            		<div class="panel panel-primary">
									    <div class="panel-heading">
									        <h3 class="panel-title">请登录/注册后查看资源</h3>
									    </div>
									    <div class="panel-body">
									       <a href="${pageContext.request.contextPath}/login">登陆</a>或者<a href="${pageContext.request.contextPath}/register">注册</a>
									    </div>
									</div>
			            	</div>
			            </c:if>
            		<c:if test="${sessionScope.user != null}">
						<c:if test="${sessionScope.user.uvip == 0}">
							<div class="col-lg-12">
			            		<div class="panel panel-primary">
									    <div class="panel-heading">
									        <h3 class="panel-title">很抱歉，您未成为VIP会员，不能查看资源页哦！</h3>
									    </div>
									    <div class="panel-body">
									       点击<a href="${pageContext.request.contextPath}/usermoney">去开通</a>
									    </div>
									</div>
			            	</div>
						</c:if>
						
						<c:if test="${sessionScope.user.uvip == 1}">
							<div class="col-lg-12">
                        <div class="panel panel-primary">
						    <div class="panel-heading">
						        <h3 class="panel-title">资源详情</h3>
						    </div>
						    <div class="panel-body">
						    <div class="page-header">
								  <h1>${sessionScope.resources.rname} <small><c:if test="${sessionScope.resources.rca == 1}">福利视频</c:if>
								<c:if test="${sessionScope.resources.rca == 2}">绳艺视频</c:if>
								<c:if test="${sessionScope.resources.rca == 3}">精品套图</c:if>
								<c:if test="${sessionScope.resources.rca == 4}">在线视频</c:if></small></h1>
								</div>${sessionScope.resources.rcontent}</div>
							</div>
			       			</div>
						</c:if>         
			       </c:if>  
                </div> 
            
           		
           	<div class="col-lg-2">
           		
           	</div>
           	</div>
           </div>                 
</body>
</html>