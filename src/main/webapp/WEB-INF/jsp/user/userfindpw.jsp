<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>两点兔兔 - 找回密码</title>
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
                <li class="active"><a href="${pageContext.request.contextPath}/login">登陆</a></li>
                <li><a href="${pageContext.request.contextPath}/register">注册</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </nav>
    <div class="container">
        <div class="row">
            <div class="col-lg-4"></div>
            <div class="col-lg-4">
                <form action="" method="POST" role="form" id="form1">
                    <legend>找回密码</legend>
                
                    <div class="form-group">
                        <label for="">邮箱</label>
                        <input type="email" class="form-control" id="uemail" name="uemail" placeholder="请输入注册使用的邮箱">
                    </div>
                    <button type="button" class="btn btn-primary btn-block" id="logincheck">获取验证码</button><br/><br/>
                </form>
                
            </div>
            <div class="col-lg-4"></div>
        </div>
    </div>
    <script type="text/javascript">
    	$("#logincheck").click(function(){
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
                 	url:"${pageContext.request.contextPath }/findpw1",
                 	data:formData,
                 	async: true,  
                    cache: false,
                    contentType: false,  
                    processData: false, 
                    dataType:"text",
                    beforeSend: function (){
                    	swal({ 
                    		  title: "验证邮件发送中！", 
                    		  imageSize: "300x300",
                    		  imageUrl: "https://yun.12byg.com/index.php?user/publicLink&fid=a86bJ_odnVafaom2eh9OlxczjjfvB2l9xnaXmBnBEoXT_0AzkyMT2ox8K9yaZX3XQLvKvEsglWCre13_gs4-ltrXC7bTJDCgctJMRJTxTY3lzBWqSridISPfjW9Axhb1dSsUniuPFRWG3w9fft6NDJKBYTd5aZY_nPTIhY0&file_name=/01ae565972f1eaa8012193a3f58f8a.gif",
                    		  showConfirmButton: false
                    		});
                    },
                 	success:function(msg){
                 		if(msg=="success"){
                 			swal ( "发送成功" ,  "请注意查看邮箱/注意垃圾站" ,  "success" )
                 			setTimeout(function(){
                 				window.location.href="${pageContext.request.contextPath }/userJudge";
                 			},2000)
                 		}else if(msg=="error"){
                 			swal ( "邮箱不存在" ,  "请检查注意大小写" ,  "error" )	
                 		}
                 	}
                 });
         	}); 
    </script>
</body>
</html>