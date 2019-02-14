<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>两点兔兔 - 搜索结果</title>
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
            <div class="col-lg-1"></div>
            <div class="col-lg-10">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-9">
                        <h1>搜索结果</h1>
                        <c:forEach items="${rlist}" var="r">
                                <div style="background-color:GhostWhite;height: 217px;width: 780px;">
                                        <img src="${r.rpic}" height="217px" width="379px" style="float:left;"><br>
                                        <h4 style="margin-left: 390px;margin-top: 0px;">&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/zyxq?rid=${r.rid}" style="text-decoration:none;color:black;">${r.rname}</a></h4>
                                        <p style="margin-left: 400px;">更新时间：<span class="label label-primary"><fmt:formatDate value="${r.rrelease}" pattern="yyyy-MM-dd HH:mm:ss"/></span></p>
                                       	<p style="margin-left: 400px;">大小：<span class="label label-success">${r.rsize}</span></p>
                                       	<p style="margin-left: 400px;">时长：<span class="label label-info">${r.rtime}</span></p>
                                       	<p style="margin-left: 400px;">类型：<mark>
                                       		<c:if test="${r.rca==1}">
                                       			<span class="label label-default">福利视频</span>
                                       		</c:if>
                                       		<c:if test="${r.rca==2}">
                                       			<span class="label label-default">绳艺视频</span>
                                       		</c:if>
                                       		<c:if test="${r.rca==3}">
                                       			<span class="label label-default">精品套图</span>
                                       		</c:if>
                                       	</mark></p>
                                        <div class="pull-right" style="margin-top: 8px;"><button type="button" class="btn btn-info" >了解更多</button></div>
                                        </div><br/><hr>
                                         </c:forEach> 
			       </div>
                        <div class="col-lg-3">
                        		 <div class="panel panel-danger">
			                         <div class="panel-heading">
			                                <h3 class="panel-title">${sessionScope.sselect2.stitle}</h3>
			                          </div>
			                              <div class="panel-body">
			                                 ${sessionScope.sselect2.scontent}
			                               </div>
			                   </div>
                                <div class="panel panel-primary">
                                        <div class="panel-heading">
                                            <h3 class="panel-title">${sessionScope.sselect1.stitle}</h3>
                                        </div>
                                        <div class="panel-body">
                                            ${sessionScope.sselect1.scontent}
                                        </div>
                                    </div>
                                <div class="panel panel-info">
                                        <div class="panel-heading">
                                            <h3 class="panel-title">最新发布</h3>
                                        </div>
                                        <div class="panel-body">
                                            <table class="table table-hover">
                                                <tbody>
                                                    <tr>
                                                        <td>11</td>
                                                    </tr>
                                                    <tr>
                                                         <td>222</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            
                                        </div>
                                    </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-1"></div>
        </div>
    </div>
</body>
</html>