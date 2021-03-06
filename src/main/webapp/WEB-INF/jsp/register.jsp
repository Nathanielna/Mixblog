<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>两点兔兔 - 用户注册</title>
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
            
            <form class="navbar-form navbar-right" role="search">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="输入想要的资源">
                </div>
                <button type="submit" class="btn btn-default">搜索</button>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="${pageContext.request.contextPath}/login">登陆</a></li>
                <li class="active"><a href="${pageContext.request.contextPath}/register">注册</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </nav>
    <div class="container">
        <div class="row">
            <div class="col-lg-4"></div>
            <div class="col-lg-4">
                <form action="" method="POST" role="form" id="form1">
                    <legend>注册</legend>
                    <div class="form-group">
                        <label for="">用户名</label>
                        <input type="text" class="form-control" id="uname" name="uname" placeholder="请输入用户名">
                    </div>
                    <div class="form-group">
                        <label for="">邮箱</label>
                        <input type="email" class="form-control" id="uemail" name="uemail" placeholder="请输入你的邮箱">
                    </div>
                    <div class="form-group">
                        <label for="">密码</label>
                        <input type="password" class="form-control" id="upw" name="upw" placeholder="请输入密码">
                    </div>
                    <div class="form-group">
                        <label for="">确认密码</label>
                        <input type="password" class="form-control" id="upwu" name="upwu" placeholder="请再输入一遍密码">
                    </div>
                    <button type="button" class="btn btn-primary btn-block" id="registercheck">注册账户</button><br/><br/>
                    
                    <p>已有账户？ <a href="${pageContext.request.contextPath}/login">去登陆</a></p>
                    

                        <!-- <div class="form-group">
                            <div class="col-lg-9 col-lg-offset-3">
                                <button type="submit" class="btn btn-primary" name="signup" value="Sign up">登录</button>
                                <button type="button" class="btn btn-info" id="validateBtn">验证输入有误</button>
                                <button type="button" class="btn btn-info" id="resetBtn">重置</button>
                            </div>
                        </div> -->
                </form>
                
            </div>
            <div class="col-lg-4"></div>
        </div>
    </div>
    <script type="text/javascript">
    	$("#registercheck").click(function(){
    	var uname= $.trim($("#uname").val());
    	var uemail= $.trim($("#uemail").val());
    	var upw= $.trim($("#upw").val());
    	var upwu= $.trim($("#upwu").val());
    	var reg = new RegExp("^[a-z0-9A-Z]+[- | a-z0-9A-Z . _]+@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-z]{2,}$"); 
    	if(uname == ""){
    		swal({ 
  			  title: "请输入用户名！",
  			  text: "用户名不能为空", 
  			  timer: 1500, 
  			  type: "warning",
  			  showConfirmButton: false 
  			});
    		return false;
    	}
    	if(uemail == ""){
    		swal({ 
  			  title: "请输入邮箱！",
  			  text: "邮箱不能为空", 
  			  timer: 1500, 
  			  type: "warning",
  			  showConfirmButton: false 
  			});
    		return false;
    	}else if(!reg.test(uemail)){
    		swal({ 
    			  title: "邮箱格式不正确！",
    			  text: "请正确输入邮箱格式",
    			  timer: 1500, 
    			  type: "warning",
    			  showConfirmButton: false 
    			});
  			return false;	
      	}
    	if(upw == ""){
    		swal({ 
  			  title: "请输入密码！",
  			  text: "密码不能为空",
  			  timer: 1500, 
  			  type: "warning",
  			  showConfirmButton: false 
  			});
    		return false;
    	}  
    	if(upwu != upw){
    		swal({ 
  			  title: "密码不一致！",
  			  text: "两次密码不一致，请重新输入！",
  			  timer: 1500, 
  			  type: "warning",
  			  showConfirmButton: false 
  			});
    		return false;
    	}
         		var formData = new FormData($("#form1")[0]);
         		$.ajax({
                 	type:"post",
                 	url:"${pageContext.request.contextPath }/register1",
                 	data:formData,
                 	async: true,  
                    cache: false,
                    contentType: false,  
                    processData: false, 
                    dataType:"text",
                    beforeSend: function (){
                    	swal({ 
                    		  title: "注册账户中！", 
                    		  imageSize: "300x300",
                    		  imageUrl: "https://yun.12byg.com/index.php?user/publicLink&fid=a86bJ_odnVafaom2eh9OlxczjjfvB2l9xnaXmBnBEoXT_0AzkyMT2ox8K9yaZX3XQLvKvEsglWCre13_gs4-ltrXC7bTJDCgctJMRJTxTY3lzBWqSridISPfjW9Axhb1dSsUniuPFRWG3w9fft6NDJKBYTd5aZY_nPTIhY0&file_name=/01ae565972f1eaa8012193a3f58f8a.gif",
                    		  showConfirmButton: false
                    		});
                    },
                 	success:function(msg){
                 		if(msg=="ok"){
                 			swal ( "注册成功" ,  "正前往登录页面" ,  "success" ) 
                 			setTimeout(function(){
                 				window.location.href="${pageContext.request.contextPath }/login";
                 			},2000) 
                 		}else if(msg=="no"){
                 			 swal ( "注册失败" ,  "用户名已经存在，请登录或者换个用户名注册" ,  "info" )	
                 		}else if(msg=="nn"){
                			 swal ( "邮箱已存在" ,  "请登录或者换个邮箱地址" ,  "info" )	
                  		}
                 	}
                 });
         	}); 
    </script>
</body>
</html>