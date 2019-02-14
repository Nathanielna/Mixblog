<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>两点兔兔 - 用户编辑</title>
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
            <div class="col-lg-3">
                    
            </div>
           
            <div class="col-lg-6">
            <ol class="breadcrumb">
				  <li><a href="${pageContext.request.contextPath}/adminhome">首页</a></li>
				  <li><a href="${pageContext.request.contextPath}/adminuser">会员列表</a></li>
				  <li class="active">用户编辑</li>
			</ol>
                    <form action="searchuser" class="navbar-form navbar-right" role="search">
                            <div class="form-group">
                                <input type="text" class="form-control" name="uname" placeholder="输入搜索的用户名或邮箱">
                            </div>
                            <button type="submit" class="btn btn-default">搜索</button>
                        </form>
                    <form action="" method="POST" role="form" id="form1">
                                <legend>个人信息</legend>
                            	<%-- <c:if test="${sessionScope.user.usecurity==0}">
                            		<div class="alert alert-danger">别忘了设置密码问题，这是你唯一能找回密码的机会</div>
                            	</c:if> --%>
                                <div class="form-group">
                                    <label for="">用户名<small>&nbsp;&nbsp;(不可更改)</small></label>
                                    <input type="text" class="form-control" id="uname" name="uname" value="${sessionScope.user1.uname}" disabled="disabled">
                                </div>
                                <div class="form-group">
                                        <label for="">邮箱<small>&nbsp;&nbsp;(邮箱找回密码的唯一方法 请勿乱填)</small></label>
                                        <input type="email" class="form-control" id="uemail" name="uemail" value="${sessionScope.user1.uemail}" placeholder="必须输入邮箱">
                                </div>
                                <div class="form-group">
                                        <label for="">密码</label>
                                        <input type="password" class="form-control" id="upw" name="upw" value="${sessionScope.user1.upw}" placeholder="密码">
                                </div>
                                <div class="form-group">
                                        <label for="">QQ号</label>
                                        <input type="number" class="form-control" id="uqq" name="uqq" value="${sessionScope.user1.uqq}" placeholder="可输可不输">
                                </div>
                                <div class="form-group">
                                     <label for="">注册时间</label>
                                     <input type="text" class="form-control" id="" value="${sessionScope.user1.ucreate}" disabled="disabled">                             
                                </div>
                                <button type="button" class="btn btn-success" id="savecheck">保存信息</button>
                            </form>
            </div>
            <div class="col-lg-3">
                   
            </div>
        </div>
    </div>
    <script type="text/javascript">
    	$("#savecheck").click(function(){
    	var uemail= $.trim($("#uemail").val());
    	var reg = new RegExp("^[a-z0-9A-Z]+[- | a-z0-9A-Z . _]+@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-z]{2,}$");
    	if(uemail == ""){
    		swal({ 
	  			  title: "请输入邮箱！", 
	  			  timer: 1500, 
	  			  type: "warning",
	  			  showConfirmButton: false 
	  			});
    		return false;
    	}else if(!reg.test(uemail)){
    		swal({ 
  			  title: "邮箱格式不正确！", 
  			  timer: 1500, 
  			  type: "warning",
  			  showConfirmButton: false 
  			});
			return false;	
    	}
    	var upw= $.trim($("#upw").val());
    	if(upw == ""){
    		swal({ 
	  			  title: "请输入密码！", 
	  			  timer: 1500, 
	  			  type: "warning",
	  			  showConfirmButton: false 
	  			});
    		return false;
    	}
         		var formData = new FormData($("#form1")[0]);
         		$.ajax({
                 	type:"post",
                 	url:"${pageContext.request.contextPath }/adusersave",
                 	data:formData,
                 	async: false,  
                    cache: false,
                    contentType: false,  
                    processData: false, 
                    dataType:"text",
                 	success:function(msg){
                 		if(msg=="ok"){
                 			swal ( "信息保存成功！" ,  "正前往会员列表" ,  "success" )
                 			setTimeout(function(){
                 				window.location.href="${pageContext.request.contextPath }/adminuser";
                 			},2000)
                 		}
                 	}
                 });
         	}); 
    </script>
</body>
</html>