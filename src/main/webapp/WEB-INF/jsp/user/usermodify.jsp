<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>两点兔兔 - 修改密码</title>
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
                        <li><a href="${pageContext.request.contextPath}/userinfo">个人信息</a></li>
                        <li><a href="${pageContext.request.contextPath}/usermoney">我的资产</a></li>
                        <li><a href="${pageContext.request.contextPath}/usercart">消费清单</a></li>
                        <li><a href="${pageContext.request.contextPath}/useradd">充值记录</a></li>
                        <li class="active"><a href="${pageContext.request.contextPath}/usermodify">修改密码</a></li>
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
                                            <li><a href="${pageContext.request.contextPath}/userinfo">个人信息</a></li>
				                              <li><a href="${pageContext.request.contextPath}/usermoney">我的资产</a></li>
				                              <li><a href="${pageContext.request.contextPath}/usercart">消费清单</a></li>
				                              <li><a href="${pageContext.request.contextPath}/useradd">充值记录</a></li>
				                              <li class="active"><a href="${pageContext.request.contextPath}/usermodify">修改密码</a></li>
				                              <li><a href="${pageContext.request.contextPath}/exitlogin">退出</a></li>
                                            </ul>
                        </div>
                        <div class="col-lg-1"></div>
                        <div class="col-lg-6">
                            
                            
                                <legend>修改密码</legend>
                                <form action="" method="POST" role="form" id="xgmmf">
                                    <div class="form-group">
                                            <label for="">新密码</label>
                                            <input type="password" class="form-control" name="upw" id="newp" placeholder="请输入新密码">
                                        </div>
                                        <div class="form-group">
                                                <label for="">确认新密码</label>
                                                <input type="password" class="form-control" id="newp1" placeholder="请再输入一遍新密码">
                                            </div>
                                
                                    <button type="button" class="btn btn-primary" id="xgmm">确定修改</button>
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
	$("#xgmm").click(function(){
		var x=document.getElementById("newp").value.length;
		if(x < 8 || x> 16){
			swal({ 
	  			  title: "请正确输入密码  8-16位", 
	  			  timer: 1500, 
	  			  type: "warning",
	  			  showConfirmButton: false 
	  			});
			return false;
		}
		var upw= $.trim($("#newp").val());
		var upw1=$.trim($("#newp1").val());
		if(upw == ""){
			swal({ 
	  			  title: "请输入密码", 
	  			  timer: 1500, 
	  			  type: "warning",
	  			  showConfirmButton: false 
	  			});
			return false;
		}
		if(upw != upw1){
			swal({ 
	  			  title: "两次密码不一致", 
	  			  timer: 1500, 
	  			  type: "warning",
	  			  showConfirmButton: false 
	  			});
			return false;
		}
 		var formData = new FormData($("#xgmmf")[0]);
 		$.ajax({
         	type:"post",
         	url:"${pageContext.request.contextPath }/usermodify1",
         	data:formData,
         	async: true,  
            cache: false,
            contentType: false,  
            processData: false, 
            dataType:"text",
            beforeSend: function (){
            	swal({ 
            		  title: "修改密码中！", 
            		  imageSize: "300x300",
            		  imageUrl: "https://yun.12byg.com/index.php?user/publicLink&fid=a86bJ_odnVafaom2eh9OlxczjjfvB2l9xnaXmBnBEoXT_0AzkyMT2ox8K9yaZX3XQLvKvEsglWCre13_gs4-ltrXC7bTJDCgctJMRJTxTY3lzBWqSridISPfjW9Axhb1dSsUniuPFRWG3w9fft6NDJKBYTd5aZY_nPTIhY0&file_name=/01ae565972f1eaa8012193a3f58f8a.gif",
            		  showConfirmButton: false
            		});
            },
         	success:function(msg){
         		if(msg=="ok"){
         			swal ( "密码修改成功" ,  "请使用新密码重新登录" ,  "success" )
         			setTimeout(function(){
         				window.location.href="${pageContext.request.contextPath }/exitlogin";
         			},2000)
         		}else if(msg=="no"){
         			swal ( "密码修改失败" ,  "新密码与旧密码一致，请检查" ,  "warning" )
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