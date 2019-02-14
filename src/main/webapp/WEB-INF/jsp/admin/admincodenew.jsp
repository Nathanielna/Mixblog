<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>两点兔兔 - 新增充值码</title>
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
            <ol class="breadcrumb">
				  <li><a href="${pageContext.request.contextPath}/adminhome">首页</a></li>
				  <li class="active">创建充值码</li>
			</ol>
                    	<form action="" method="POST" role="form" id="code"> 
                                    <legend>新充值码</legend>
                                    <div class="form-group">
                                        <label for="">请选择面值</label>
                                        <select name="codequota" id="codequota" class="form-control" required="required">
                                            <option value="30">30元</option>
                                            <option value="50">50元</option>
                                            <option value="66">66元</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="">充值码</label>
                                        <input type="text" name="codevar" id="codevar" class="form-control" id="" placeholder="请在此输入充值码">
                                    </div>
                                    
                                    <button type="button" class="btn btn-primary" id="tjcz">添加</button>
                                </form>
                    
     
            </div>
            <div class="col-lg-3">
                   
            </div>
        </div>
    </div>
<script type="text/javascript">
	$("#tjcz").click(function(){
		var codevar= $.trim($("#codevar").val());
		if(codevar == ""){
			swal({ 
	  			  title: "充值码不能空哦！", 
	  			  timer: 1500, 
	  			  type: "warning",
	  			  showConfirmButton: false 
	  			});
			return false;
		}
 		var formData = new FormData($("#code")[0]);
 		$.ajax({
         	type:"post",
         	url:"${pageContext.request.contextPath }/admincode1",
         	data:formData,
         	async: false,  
            cache: false,
            contentType: false,  
            processData: false, 
            dataType:"text",
         	success:function(msg){
         		if(msg=="ok"){
         			swal ( "添加成功" ,  "充值码添加成功" ,  "success" )
         			setTimeout(function(){
         				window.location.href="${pageContext.request.contextPath }/admincode";
         			},2000)
         		}else if(msg=="no"){
         			swal ( "添加失败" ,  "存在重复的充值码" ,  "warning" )
         			setTimeout(function(){
         				window.location.href="${pageContext.request.contextPath }/admincode";
         			},2000)
         		}
         	}
         });
 	}); 
	</script>
</body>
</html>