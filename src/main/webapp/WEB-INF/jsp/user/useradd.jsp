<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

       
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>两点兔兔 - 充值记录</title>
<%@include file="commons.jspf" %>
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
            
            <form action="search" class="navbar-form navbar-right" role="search">
                <div class="form-group">
                    <input type="text" name="rname" id="rname" class="form-control" placeholder="输入想要的资源">
                </div>
                <button type="submit" class="btn btn-default">搜索</button>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <!-- style="display:none;" -->
                <li class="dropdown">
                     <a href="#" class="dropdown-toggle" data-toggle="dropdown">个人中心 <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="${pageContext.request.contextPath}/userinfo">个人信息</a></li>
                        <li><a href="${pageContext.request.contextPath}/usermoney">我的资产</a></li>
                        <li><a href="${pageContext.request.contextPath}/usercart">消费清单</a></li>
                        <li class="active"><a href="${pageContext.request.contextPath}/useradd">充值记录</a></li>
                        <li><a href="${pageContext.request.contextPath}/usermodify">修改密码</a></li>
                        <li><a href="${pageContext.request.contextPath}/exitlogin">退出登陆</a></li>
                        
                    </ul> 
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </nav>
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-2">
            </div>
            <div class="col-lg-8" style="background-color:#FAFAFA;">
                <div class="container-fluid">
                    <div class="row">
                            <h1>个人管理中心</h1><hr>
                        <div class="col-lg-2">
                                            <ul class="nav nav-pills nav-stacked">
                                            <li><a href="${pageContext.request.contextPath}/userinfo">个人信息</a></li>
				                              <li><a href="${pageContext.request.contextPath}/usermoney">我的资产</a></li>
				                              <li><a href="${pageContext.request.contextPath}/usercart">消费清单</a></li>
				                              <li class="active"><a href="${pageContext.request.contextPath}/useradd">充值记录</a></li>
				                              <li><a href="${pageContext.request.contextPath}/usermodify">修改密码</a></li>
				                              <li><a href="${pageContext.request.contextPath}/exitlogin">退出</a></li>
                                            </ul>
                        </div>
                        <div class="col-lg-1"></div>
                        <div class="col-lg-6">
                            
                            
                                <legend>充值记录</legend>
                                
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>充值时间</th>
                                            <th>金额</th>
                                            <th>充值方式</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${recharge}" var="r">
                                        <tr>
                                            <td><fmt:formatDate value="${r.rcreatetime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                            <td>${r.rmoney }</td>
                                            <td>${r.rpurpose }</td>
                                        </tr>
                                        </c:forEach> 
                                    </tbody>
                                </table>
                                

                            
                            
                        </div>
                        <div class="col-lg-3"></div>
                    </div>
                </div>
            </div>
            <div class="col-lg-2"></div>
        </div>
    </div>
</body>
</html>