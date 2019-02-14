<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>两点兔兔 - 我的资金</title>
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
                        <li class="active"><a href="${pageContext.request.contextPath}/usermoney">我的资产</a></li>
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
                                            <li><a href="${pageContext.request.contextPath}/userinfo">个人信息</a></li>
				                              <li class="active"><a href="${pageContext.request.contextPath}/usermoney">我的资产</a></li>
				                              <li><a href="${pageContext.request.contextPath}/usercart">消费清单</a></li>
				                              <li><a href="${pageContext.request.contextPath}/useradd">充值记录</a></li>
				                              <li><a href="${pageContext.request.contextPath}/usermodify">修改密码</a></li>
				                              <li><a href="${pageContext.request.contextPath}/exitlogin">退出</a></li>
                                            </ul>
                        </div>
                        <div class="col-lg-1"></div>
                        <div class="col-lg-6">
                                <legend>我的资产</legend>
                                <p>当前用户组：<span><c:if test="${sessionScope.user.uvip ==0}">普通组</c:if>
                                <c:if test="${sessionScope.user.uvip ==1}">VIP组</c:if></span></p>
                                <p>VIP到期时间：<span>${sessionScope.user.udqvip}</span></p>
                                <p>剩余金币：<span>${sessionScope.user.ubalance}</span></p>
                                <p><strong>1金币 等于  1元钱</strong></p>
                                
                                <form action="" method="POST" role="form">
                                    <legend>在线充值(暂时不可用)</legend>
                                    <div class="form-group">
                                        选择您充值的金额
                                        <select name="" id="input" class="form-control" required="required">
                                            <option value="">30元</option>
                                            <option value="">50元</option>
                                            <option value="">66元</option>
                                        </select>
                                        
                                    </div>
                                    <button type="button" class="btn btn-primary disabled">立即充值</button>
                                </form><br>
                                <form action="" method="POST" role="form" id="ktvip">
                                        <legend>升级VIP</legend>
                                        <div class="form-group">
                                            选择您开通时长
                                            <select name="cmoney" id="input" class="form-control" required="required">
                                                <option value="30">30/月</option>
                                                <option value="50">50/年</option>
                                                <option value="66">66/永久</option>
                                            </select>
                                        </div>
                                        <c:if test="${sessionScope.user.uvip ==0}"><button type="button" class="btn btn-primary" id="ktdy">立即开通</button></c:if>
                                        <c:if test="${sessionScope.user.uvip ==1}"><button type="button" class="btn btn-primary" id="ktdy">立即续费</button></c:if>
                                        
                                    </form><br>
                                    <form action="" method="POST" role="form" id="czjhm">
                                        <legend>我有充值码<a href="http://t.cn/EtAKfBx" target="_blank">点我购买</a></legend>
                                        
                                        <input type="text" name="codevar"  id="codevar" class="form-control" value="" required="required" pattern="" title="" placeholder="请输入您的兑换码"><br>
                                        <button type="button" class="btn btn-primary" id="cz">立即兑换</button>
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
    	$("#ktdy").click(function(){
         		var formData = new FormData($("#ktvip")[0]);
         		$.ajax({
                 	type:"post",
                 	url:"${pageContext.request.contextPath }/userktvip",
                 	data:formData,
                 	async: false,  
                    cache: false,
                    contentType: false,  
                    processData: false, 
                    dataType:"text",
                 	success:function(msg){
                 		if(msg=="ok"){
                 			swal ( "开通成功" ,  "请刷新页面查看是否到账" ,  "success" )
                 			setTimeout(function(){
                     			window.location.href="${pageContext.request.contextPath }/usermoney";
                 			},2000)
                 		}else if(msg=="no"){
                 			swal ( "余额不足" ,  "请充值后再进行操作" ,  "warning" )
                 			setTimeout(function(){
                     			window.location.href="${pageContext.request.contextPath }/usermoney";
                 			},2000)
                 		}else if(msg=="ok1"){
                 			swal ( "续费成功" ,  "请刷新页面查看是否到账" ,  "success" )
                 			setTimeout(function(){
                     			window.location.href="${pageContext.request.contextPath }/usermoney";
                 			},2000)
                 		}
                 	}
                 });
         	}); 
    	
    </script>
    <script type="text/javascript">
	$("#cz").click(function(){
		var codevar= $.trim($("#codevar").val());
		if(codevar == ""){
			swal({ 
	  			  title: "请输入充值码！", 
	  			  timer: 1500, 
	  			  type: "warning",
	  			  showConfirmButton: false 
	  			});
			return false;
		}
 		var formData = new FormData($("#czjhm")[0]);
 		$.ajax({
         	type:"post",
         	url:"${pageContext.request.contextPath }/usercode",
         	data:formData,
         	async: false,  
            cache: false,
            contentType: false,  
            processData: false, 
            dataType:"text",
         	success:function(msg){
         		if(msg=="ok"){
         			swal ( "充值成功" ,  "请刷新页面查看是否到账" ,  "success" )
         			setTimeout(function(){
             			window.location.href="${pageContext.request.contextPath }/usermoney";
         			},2000)
         		}else if(msg=="no"){
         			swal ( "充值失败" ,  "该充值码已被使用" ,  "error" )
         			setTimeout(function(){
             			window.location.href="${pageContext.request.contextPath }/usermoney";
         			},2000)
         		}else if(msg=="error"){
         			swal ( "异常" ,  "充值码异常状态，请提交工单" ,  "error" )
         			setTimeout(function(){
             			window.location.href="${pageContext.request.contextPath }/usermoney";
         			},2000)
         		}else if(msg=="error1"){
         			swal ( "异常" ,  "充值码不存在，请检查！" ,  "error" )
         			setTimeout(function(){
             			window.location.href="${pageContext.request.contextPath }/usermoney";
         			},2000)
         		}
         	}
         });
 	}); 
	</script>
</body>
</html>