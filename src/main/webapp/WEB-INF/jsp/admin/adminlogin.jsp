<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>两点兔兔 - 管理员登录</title>
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
    <div class="container">
        <div class="row">
            <div class="col-lg-4"></div>
            <div class="col-lg-4">
                <form id="form1" action="" method="POST">
                    <legend>后台管理系统登录</legend>
                    <div class="form-group">
                        <label for="">用户名</label>
                        <input type="text" class="form-control" id="auser" name="auser" id="" placeholder="请输入用户名">
                    </div>
                    <div class="form-group">
                        <label for="">密码</label>
                        <input type="password" class="form-control" id="apw" name="apw" id="" placeholder="请输入密码">
                    </div>
                    <button type="button" class="btn btn-primary btn-block" id="logincheck">登陆</button><br/><br/>
                </form>
                
            </div>
            <div class="col-lg-4"></div>
        </div>
    </div>
    <script type="text/javascript">
    	$("#logincheck").click(function(){
    	var auser= $.trim($("#auser").val());
    	var apw= $.trim($("#apw").val());
    	if(auser == ""){
    		swal({ 
	  			  title: "请输入用户名！", 
	  			  timer: 1500, 
	  			  type: "info",
	  			  showConfirmButton: false 
	  			});
    		return false;
    	}
    	if(apw == ""){
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
                 	url:"${pageContext.request.contextPath }/adminlogin1",
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
                 			swal ( "登录成功" ,  "正前往后台管理界面" ,  "success" )
                 			setTimeout(function(){
                 				window.location.href="${pageContext.request.contextPath }/adminhome";
                 			},2000)
                 		}else if(msg=="no"){
                 			swal ( "登录失败" ,  "管理员名或密码不正确" ,  "error" )
                 			setTimeout(function(){
                 				window.location.href="${pageContext.request.contextPath }/adminlogin";
                 			},2000)
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