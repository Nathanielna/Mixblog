<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
           <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
           <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>两点兔兔 - 文章管理</title>
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
                <li class="active"><a href="${pageContext.request.contextPath}/adminpost">文章列表</a></li> 
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
            <ol class="breadcrumb">
				  <li><a href="${pageContext.request.contextPath}/adminhome">首页</a></li>
				  <li class="active">文章列表</li>
			</ol>
            		<a class="btn btn-primary" href="${pageContext.request.contextPath}/adminnewpost" role="button">写文章</a>
                    <form action="searchresources" class="navbar-form navbar-right" role="search">
                            <div class="form-group">
                                <input type="text" class="form-control" name="rname" placeholder="输入搜索的文章名">
                            </div>
                            <button type="submit" class="btn btn-default">搜索</button>
                        </form>
                    <table class="table table-hover">
                            <caption>当前文章列表</caption>
                            <thead>
                              <tr>
                              	<th>缩图</th>
                                <th>文章名</th>
                                <th>分类</th>
                                <th>最后更新时间</th>
                                <th>操作</th>
                              </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${rlist}" var="r">
                            	<tr>
                            	<td width="90px;"><img src="${r.rpic}" height="60px;" width="90px;"></td>
                                <td width="600px;">${r.rname}</td>
                               
                                <td>
                                	<c:if test="${r.rca==1}">
                                		福利视频
                                	</c:if>
                                	<c:if test="${r.rca==2}">
                                		绳艺视频
                                	</c:if>
                                	<c:if test="${r.rca==3}">
                                		精品套图
                                	</c:if>
                                	<c:if test="${r.rca==4}">
                                		在线视频
                                	</c:if>
                                </td>
                                <td><fmt:formatDate value="${r.rrelease}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                <td>
                                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/zyxq?rid=${r.rid}" role="button" target="_blank">查看</a>
                                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/adminpedit?rid=${r.rid}" role="button">编辑</a>
                                    <a class="btn btn-danger" href="${pageContext.request.contextPath}/adminpdel?rid=${r.rid}" role="button">删除</a>
                                </td>
                              </tr>
                            </c:forEach>
                            </tbody>
                          </table>
                    	<!--       SSM分页 -->
			       <div class="pager" >
			          <font size="2">共 ${page.totalPageCount} 页</font> <font size="2">当前第  
			            ${page.pageNow} 页</font> <a href="adminpost?pageNow=1" class="btn btn-primary ">首页 </a>  
			        <c:choose>  
			            <c:when test="${page.pageNow - 1 > 0}">  
			                <a href="adminpost?pageNow=${page.pageNow - 1}" class="btn btn-info">上一页</a>  
			            </c:when>  
			            <c:when test="${page.pageNow - 1 <= 0}">  
			                <a href="adminpost?pageNow=1" class="btn btn-info">上一页</a>  
			            </c:when>  
			        </c:choose>  
			        <c:choose>  
			            <c:when test="${page.totalPageCount==0}">
			                <a href="adminpost?pageNow=${page.pageNow}" class="btn btn-info">下一页</a>  
			            </c:when>  
			            <c:when test="${page.pageNow + 1 < page.totalPageCount}">  
			                <a href="adminpost?pageNow=${page.pageNow + 1}" class="btn btn-info">下一页</a>  
			            </c:when>  
			            <c:when test="${page.pageNow + 1 >= page.totalPageCount}">  
			                <a href="adminpost?pageNow=${page.totalPageCount}" class="btn btn-info">下一页</a>  
			            </c:when>  
			        </c:choose>  
			        <c:choose>  
			            <c:when test="${page.totalPageCount==0}">  
			                <a href="adminpost?pageNow=${page.pageNow}" class="btn btn-success">尾页</a>  
			            </c:when>  
			            <c:otherwise>  
			                <a href="adminpost?pageNow=${page.totalPageCount}" class="btn btn-success">尾页</a>  
			            </c:otherwise>  
			        </c:choose> 
			       </div>
            </div>
            <div class="col-lg-2">
                   
            </div>
        </div>
    </div>
</body>
</html>