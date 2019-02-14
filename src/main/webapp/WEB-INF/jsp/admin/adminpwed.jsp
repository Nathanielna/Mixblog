<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>两点兔兔 - 管理员密码修改</title>
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
                
            </ul>
        </div><!-- /.navbar-collapse -->
    </nav>
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-3">
                    
            </div>
           
            <div class="col-lg-6">
                    <form action="" method="POST" role="form" id="form1">
                                <legend>管理员密码修改</legend>
                                <div class="form-group">
                                        <label for="">新密码</label>
                                        <input type="password" class="form-control" id="apw" name="apw" value="${sessionScope.user1.upw}" placeholder="请输入新密码">
                                </div>
                                <div class="form-group">
                                        <label for="">请再输入一次</label>
                                        <input type="password" class="form-control" id="apw1" name="apw1" placeholder="请再输入一次">
                                </div>
                                <button type="button" class="btn btn-success" id="savecheck">确认修改</button>
                            </form>
            </div>
            <div class="col-lg-3">
                   
            </div>
        </div>
    </div>
    <script type="text/javascript">
    	$("#savecheck").click(function(){
    	var apw= $.trim($("#apw").val());
    	var apw1= $.trim($("#apw1").val());
    	if(apw == ""){
    		swal({ 
	  			  title: "请输入新密码！", 
	  			  timer: 1500, 
	  			  type: "warning",
	  			  showConfirmButton: false 
	  			});
    		return false;
    	}
    	if(apw1 == ""){
    		swal({ 
	  			  title: "请输入确认密码！", 
	  			  timer: 1500, 
	  			  type: "warning",
	  			  showConfirmButton: false 
	  			});
    		return false;
    	}
    	if(apw != apw1){
    		swal({ 
	  			  title: "两次密码不一致，请检查！", 
	  			  timer: 1500, 
	  			  type: "warning",
	  			  showConfirmButton: false 
	  			});
    		return false;
    	}
         		var formData = new FormData($("#form1")[0]);
         		$.ajax({
                 	type:"post",
                 	url:"${pageContext.request.contextPath }/adminpwedit",
                 	data:formData,
                 	async: false,  
                    cache: false,
                    contentType: false,  
                    processData: false, 
                    dataType:"text",
                 	success:function(msg){
                 		if(msg=="ok"){
                 			swal ( "密码修改成功" ,  "正前往登陆页面" ,  "success" )
                 			setTimeout(function(){
                 				window.location.href="${pageContext.request.contextPath }/adminlogin";
                 			},2000)
                 		}else if(msg=="no"){
                 			swal ( "密码修改失败" ,  "系统异常，请联系管理员" ,  "error" )
                 			setTimeout(function(){
                 				window.location.href="${pageContext.request.contextPath }/adminlogin";
                 			},2000)
                 		}
                 	}
                 });
         	}); 
    </script>
</body>
</html>