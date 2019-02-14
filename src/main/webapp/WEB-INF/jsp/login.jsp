<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>两点兔兔 - 用户登录</title>
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
                    <legend>登陆</legend>
                    <div class="form-group">
                        <label for="">用户名</label>
                        <input type="text" class="form-control" id="uname" name="uname" placeholder="请输入用户名">
                    </div>
                    <div class="form-group">
                        <label for="">密码</label>
                        <input type="password" class="form-control" name="upw" id="upw" placeholder="请输入密码">
                    </div>
                    <button type="button" class="btn btn-primary btn-block"  id="logincheck">登陆</button><br/><br/>
                    <p>忘记密码？ <a href="${pageContext.request.contextPath}/findpw">找回密码</a></p>
                    <p>没有账户？ <a href="${pageContext.request.contextPath}/register">注册一个</a></p>
                    <p style="color: #FF6A6A;">部分浏览器可能打不开请更换浏览器尝试登录</p>
                    <p style="color: #FF6A6A;">目前已知UC无法登录</p>
                </form>
                
            </div>
            <div class="col-lg-4"></div>
        </div>
    </div>
    <script type="text/javascript">
    	$("#logincheck").click(function(){
    	var uname= $.trim($("#uname").val());
    	var upw= $.trim($("#upw").val());
    	if(uname == ""){
    		swal({ 
    			  title: "请输入用户名！", 
    			  timer: 1500, 
    			  type: "warning",
    			  showConfirmButton: false 
    			});
    		return false;
    	}
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
                 	url:"${pageContext.request.contextPath }/login1",
                 	data:formData,
                 	async: true,  
                    cache: false,
                    contentType: false,  
                    processData: false, 
                    dataType:"text",
                    beforeSend: function (){
                    	swal({ 
                    		  title: "登录中！", 
                    		  imageSize: "300x300",
                    		  imageUrl: "https://yun.12byg.com/index.php?user/publicLink&fid=a86bJ_odnVafaom2eh9OlxczjjfvB2l9xnaXmBnBEoXT_0AzkyMT2ox8K9yaZX3XQLvKvEsglWCre13_gs4-ltrXC7bTJDCgctJMRJTxTY3lzBWqSridISPfjW9Axhb1dSsUniuPFRWG3w9fft6NDJKBYTd5aZY_nPTIhY0&file_name=/01ae565972f1eaa8012193a3f58f8a.gif",
                    		  showConfirmButton: false
                    		});
                    },
                 	success:function(msg){
                 		if(msg=="ok"){
                 			swal ( "登录成功" ,  "正前往首页" ,  "success" )
                 			setTimeout(function(){
                 				window.location.href="${pageContext.request.contextPath }/index";
                 			},2000)
                 		}else if(msg=="no"){
                 			swal ( "登录失败" ,  "用户名或密码不正确" ,  "error" )	
                 		}
                 	}
                 });
         	}); 
    </script>
    <script>
    document.onkeydown = function(e){  
        
        var ev = document.all ? window.event : e;
  
        if(ev.keyCode==13) {
      
            $("#logincheck").click();    
                  
      }
  
  };
		</script>
</body>
</html>