<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>两点兔兔 - 绳艺视频</title>
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
                <li class="active"><a href="${pageContext.request.contextPath}/sysp">绳艺视频</a></li>
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
        </div><!-- /.navbar-collapse -->
    </nav>
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-1"></div>
            <div class="col-lg-10">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-9">
                        	<div class="row">
                        	<c:forEach items="${rsysplist}" var="r">
                        		<div class="col-lg-6 col-sm-12 col-xs-12" >
								    <div class="thumbnail">
								    <a href="${pageContext.request.contextPath}/zyxq?rid=${r.rid}">
									    <img src="${r.rpic}" alt="..."  class="img-responsive" ></a>
									    <div class="caption">
									        <h4><a href="${pageContext.request.contextPath}/zyxq?rid=${r.rid}" style="text-decoration:none;color:black;">${r.rname}</a></h4>
									        <p>
										        <c:if test="${r.rca==1}">
                                       			<span class="label label-default">福利视频</span>
                                       		</c:if>
                                       		<c:if test="${r.rca==2}">
                                       			<span class="label label-default">绳艺视频</span>
                                       		</c:if>
                                       		<c:if test="${r.rca==3}">
                                       			<span class="label label-default">精品套图</span>
                                       		</c:if>
										    </p>
										    <p><span class="label label-primary"><fmt:formatDate value="${r.rrelease}" pattern="yyyy-MM-dd HH:mm:ss"/></span></p>
										</div>
								    </div>
								</div>

							    </c:forEach>
                        	</div>
                        
                                          <!--       SSM分页 -->
			       <div class="pager" >
			          <font size="2">共 ${page.totalPageCount} 页</font> <font size="2">当前第  
			            ${page.pageNow} 页</font> <a href="sysp?pageNow=1" class="btn btn-primary ">首页 </a>  
			        <c:choose>  
			            <c:when test="${page.pageNow - 1 > 0}">  
			                <a href="sysp?pageNow=${page.pageNow - 1}" class="btn btn-info">上一页</a>  
			            </c:when>  
			            <c:when test="${page.pageNow - 1 <= 0}">  
			                <a href="sysp?pageNow=1" class="btn btn-info">上一页</a>  
			            </c:when>  
			        </c:choose>  
			        <c:choose>  
			            <c:when test="${page.totalPageCount==0}">
			                <a href="sysp?pageNow=${page.pageNow}" class="btn btn-info">下一页</a>  
			            </c:when>  
			            <c:when test="${page.pageNow + 1 < page.totalPageCount}">  
			                <a href="sysp?pageNow=${page.pageNow + 1}" class="btn btn-info">下一页</a>  
			            </c:when>  
			            <c:when test="${page.pageNow + 1 >= page.totalPageCount}">  
			                <a href="sysp?pageNow=${page.totalPageCount}" class="btn btn-info">下一页</a>  
			            </c:when>  
			        </c:choose>  
			        <c:choose>  
			            <c:when test="${page.totalPageCount==0}">  
			                <a href="sysp?pageNow=${page.pageNow}" class="btn btn-success">尾页</a>  
			            </c:when>  
			            <c:otherwise>  
			                <a href="sysp?pageNow=${page.totalPageCount}" class="btn btn-success">尾页</a>  
			            </c:otherwise>  
			        </c:choose> 
                        </div>
                        
                      
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
                                                        <td>222</td>
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
    <script type="text/javascript">
    $(function(){
        $('img').jqthumb({
        	width : '100%',//宽度
			height : '300px',//高度
			zoom : '1',//缩放比例
			method : 'auto'//提交方法，用于不同的浏览器环境，默认为‘auto’
        });
    });

    </script>
</body>
</html>