<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>两点兔兔 - 个人信息</title>
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
                        <li class="active"><a href="${pageContext.request.contextPath}/userinfo">个人信息</a></li>
                        <li><a href="${pageContext.request.contextPath}/usermoney">我的资产</a></li>
                        <li><a href="${pageContext.request.contextPath}/usercart">消费清单</a></li>
                        <li><a href="${pageContext.request.contextPath}/useradd">充值记录</a></li>
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
                              <li class="active"><a href="${pageContext.request.contextPath}/userinfo">个人信息</a></li>
                              <li><a href="${pageContext.request.contextPath}/usermoney">我的资产</a></li>
                              <li><a href="${pageContext.request.contextPath}/usercart">消费清单</a></li>
                              <li><a href="${pageContext.request.contextPath}/useradd">充值记录</a></li>
                              <li><a href="${pageContext.request.contextPath}/usermodify">修改密码</a></li>
                              <li><a href="${pageContext.request.contextPath}/exitlogin">退出</a></li>
                              </ul>
                        </div>
                        <div class="col-lg-1"></div>
                        <div class="col-lg-6">
                            
                            <form action="" method="POST" role="form" id="form1">
                                <legend>个人信息</legend>
                            	<%-- <c:if test="${sessionScope.user.usecurity==0}">
                            		<div class="alert alert-danger">别忘了设置密码问题，这是你唯一能找回密码的机会</div>
                            	</c:if> --%>
                                <div class="form-group">
                                    <label for="">用户名<small>&nbsp;&nbsp;(不可更改)</small></label>
                                    <input type="text" class="form-control" id="uname" name="uname" value="${sessionScope.user.uname}" disabled="disabled">
                                </div>
                                <div class="form-group">
                                        <label for="">邮箱<small>&nbsp;&nbsp;(邮箱找回密码的唯一方法 请勿乱填)</small></label>
                                        <input type="email" class="form-control" id="uemail" name="uemail" value="${sessionScope.user.uemail}" placeholder="必须输入邮箱">
                                </div>
                                <div class="form-group">
                                        <label for="">QQ号</label>
                                        <input type="number" class="form-control" id="uqq" name="uqq" value="${sessionScope.user.uqq}" placeholder="可输可不输">
                                </div>
                                <div class="form-group">
                                     <label for="">注册时间</label>
                                     <input type="text" class="form-control" id="" value="${sessionScope.user.ucreate}" disabled="disabled">                             
                                </div>
                                <button type="button" class="btn btn-success" id="savecheck">保存信息</button>
                            </form>
                        </div>
                        <div class="col-lg-3"></div>
                    </div>
                </div>
            </div>
            <div class="col-lg-2"></div>
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
         		var formData = new FormData($("#form1")[0]);
         		$.ajax({
                 	type:"post",
                 	url:"${pageContext.request.contextPath }/usersave",
                 	data:formData,
                 	async: false,  
                    cache: false,
                    contentType: false,  
                    processData: false, 
                    dataType:"text",
                 	success:function(msg){
                 		if(msg=="ok"){
                 			swal ( "信息保存成功" ,  "ldtutu.com" ,  "success" )
                 			setTimeout(function(){
                 				window.location.href="${pageContext.request.contextPath }/userinfo";
                 			},2000)
                 		}
                 	}
                 });
         	}); 
    </script>
</body>
</html>