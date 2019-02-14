<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>两点兔兔 - 后台首页</title>
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
                <li class="active"><a href="${pageContext.request.contextPath}/adminhome">首页</a></li>
                <li><a href="${pageContext.request.contextPath}/adminuser">会员列表</a></li>
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
            </ul>
        </div><!-- /.navbar-collapse -->
    </nav>
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-3">
                    <div class="panel panel-danger">
                            <div class="panel-heading">
                                <h3 class="panel-title">当前会员人数</h3>
                            </div>
                            <div class="panel-body">
                               	<h1><center>${requestScope.c}</center></h1>
                            </div>
                        </div>
                       <div class="panel panel-danger">
                            <div class="panel-heading">
                                <h3 class="panel-title">当前VIP人数</h3>
                            </div>
                            <div class="panel-body">
                               	<h1><center>${requestScope.v}</center></h1>
                            </div>
                        </div> 
            </div>
            <div class="col-lg-3">
                    <div class="panel panel-warning">
                            <div class="panel-heading">
                                <h3 class="panel-title">当前文章数量</h3>
                            </div>
                            <div class="panel-body">
                               <h1><center>${requestScope.r}</center></h1>
                            </div>
                        </div>
                        <div class="panel panel-warning">
                            <div class="panel-heading">
                                <h3 class="panel-title">当前福利视频数量</h3>
                            </div>
                            <div class="panel-body">
                               <h1><center>${requestScope.rfl}</center></h1>
                            </div>
                        </div>
                        <div class="panel panel-warning">
                            <div class="panel-heading">
                                <h3 class="panel-title">当前绳艺视频数量</h3>
                            </div>
                            <div class="panel-body">
                               <h1><center>${requestScope.rsy}</center></h1>
                            </div>
                        </div>
                        <div class="panel panel-warning">
                            <div class="panel-heading">
                                <h3 class="panel-title">当前精品套图数量</h3>
                            </div>
                            <div class="panel-body">
                               <h1><center>${requestScope.rjp}</center></h1>
                            </div>
                        </div>
                        <div class="panel panel-warning">
                            <div class="panel-heading">
                                <h3 class="panel-title">当前在线视频数量</h3>
                            </div>
                            <div class="panel-body">
                               <h1><center>${requestScope.rzx}</center></h1>
                            </div>
                        </div>
                        
            </div>
            
            <div class="col-lg-3">
            <div class="panel panel-info">
                            <div class="panel-heading">
                                <h3 class="panel-title">当前版本号</h3>
                            </div>
                            <div class="panel-body">
                               <h1><center>Mixblog 1.3 正式版</center></h1>
                               <h4><center>Mixblog 19.2.14</center></h4>
                               <center><a href="${pageContext.request.contextPath}/development">更多更新日志详情</a></center>
                            </div>
                        </div>
                    <div class="panel panel-info">
                            <div class="panel-heading">
                                <h3 class="panel-title">工单提交数量</h3>
                            </div>
                            <div class="panel-body">
                               <h1><center>待开发</center></h1>
                            </div>
                        </div>
            </div>
            <div class="col-lg-3">
                    <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title">当前充值码数量</h3>
                            </div>
                            <div class="panel-body">
                               	<h1><center>${requestScope.co}</center></h1>
                            </div>
                        </div>
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title">被使用充值码数量</h3>
                            </div>
                            <div class="panel-body">
                               	<h1><center>${requestScope.cou}</center></h1>
                            </div>
                        </div>
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title">可用充值码数量</h3>
                            </div>
                            <div class="panel-body">
                               	<h1><center>${requestScope.con}</center></h1>
                            </div>
                        </div>
            </div>
        </div>
    </div>
</body>
</html>