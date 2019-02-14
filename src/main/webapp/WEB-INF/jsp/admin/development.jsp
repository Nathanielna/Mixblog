<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>两点兔兔 - 项目开发更新记录</title>
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
                <li class="active"><a href="${pageContext.request.contextPath}/development">开发记录</a></li>    
            </ul>
            <ul class="nav navbar-nav navbar-right">
            	<li><a href="${pageContext.request.contextPath}/index" target="_blank">前台</a></li>
                <li><a href="${pageContext.request.contextPath}/adminpw">修改管理员密码</a></li>
                <li><a href="${pageContext.request.contextPath}/adminexit">退出系统</a></li>
            </ul>
        </div>
    </nav>
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
             <ol class="breadcrumb">
				  <li><a href="${pageContext.request.contextPath}/adminhome">首页</a></li>
				  <li class="active">开发记录</li>
			</ol>						
										<div class="panel panel-danger">
				                            <div class="panel-heading">
				                                <h3 class="panel-title">2019/2/14&nbsp;版本号&nbsp;1.3 正式版</h3>
				                            </div>
				                            <div class="panel-body">
				                               	<center>优化部分页面样式</center>
				                               	
				                            </div>
				                        </div>
										<div class="panel panel-danger">
				                            <div class="panel-heading">
				                                <h3 class="panel-title">2019/2/1&nbsp;版本号&nbsp;1.2 正式版</h3>
				                            </div>
				                            <div class="panel-body">
				                               	<center>1.新增登录回车绑定事件</center>
				                               	
				                            </div>
				                        </div>
										<div class="panel panel-danger">
				                            <div class="panel-heading">
				                                <h3 class="panel-title">2019/1/31&nbsp;版本号&nbsp;1.1 正式版</h3>
				                            </div>
				                            <div class="panel-body">
				                               	<center>1.修复板块分页链接失效</center>
				                               	<center>2.优化后台点击前台链接</center>
				                               	<center>3.修复ajax卡死浏览器问题，ajax改为异步并且加入加载特效</center>
				                               	<center>4.后台新增登陆记录表</center>
				                            </div>
				                        </div>
            					<div class="panel panel-danger">
				                            <div class="panel-heading">
				                                <h3 class="panel-title">2019/1/30&nbsp;版本号&nbsp;1.0 正式版</h3>
				                            </div>
				                            <div class="panel-body">
				                               	<center>1.新增支持用户名与邮箱混合登录</center>
				                               	<center>2.精简后台文章，用户管理按钮说明</center>
				                               	<center>3.后台新增Bootstrap路径导航</center>
				                               	<center>4.登录界面新增背景动画(测试)</center>
				                               	<center>5.优化详情页面改为Bootsrtap页头，更直观</center>
				                               	<center>6.修复富文本里图片过大超出编辑器问题</center>
				                               	<center>7.修复详情页面图片超出div的问题&nbsp;</center>
				                            </div>
				                        </div>
		            				<div class="panel panel-danger">
				                            <div class="panel-heading">
				                                <h3 class="panel-title">2019/1/28&nbsp;版本号&nbsp;beta - 0.9</h3>
				                            </div>
				                            <div class="panel-body">
				                               	<center>1.修复部分页面SweetAlert信息说明</center>
				                               	<center>2.找回密码功能实现(通过邮箱验证)</center>
				                               	<center>3.修复首页第二块公告版失效问题</center>
				                               	<center>4.修复个人管理部分页面搜索框搜索失效问题</center>
				                               	<center>5.优化后台打开文章链接从新页面打开</center>
				                               	<center>6.修复设置新密码按钮</center>
				                               	<center>7.新增注册用户时查询是否存在邮箱</center>
				                               	<center>8.删除管理员登陆表单下面的登陆注册链接</center>
				                               	<center>9.新增登录时记录IP信息</center>
				                               	<center>目前已知bug：</center>
				                               	<center>所有ajax同步有几率卡死浏览器</center>
				                               	<center>未设置注册验证邮箱是否存在</center>
				                               	<center>允许用户名邮箱混合登陆</center>
				                            </div>
				                        </div>
            				<div class="panel panel-danger">
		                            <div class="panel-heading">
		                                <h3 class="panel-title">2019/1/28&nbsp;版本号&nbsp;beta - 0.8</h3>
		                            </div>
		                            <div class="panel-body">
		                               	<center>1.完善所有日期显示格式</center>
		                               	<center>2.修复列表获取富文本第一张图片</center>
		                               	<center>3.配置404错误页面</center>
		                               	<center>4.增加后台会员列，信息查看更明朗</center>
		                               	<center>5.邮件服务接口已准备</center>
		                               	<center>6.完善注册/登陆/找回密码/修改信息邮箱正则判断</center>
		                               	<center>7.预留IP查询地区API接口</center>
		                            </div>
		                        </div>
		           				 <div class="panel panel-danger">
		                            <div class="panel-heading">
		                                <h3 class="panel-title">2019/1/26&nbsp;版本号&nbsp;beta - 0.7</h3>
		                            </div>
		                            <div class="panel-body">
		                               	<center>1.兑换码修改成充值码</center>
		                               	<center>2.修复首页公告失效</center>
		                               	<center>3.优化日期显示格式</center>
		                            </div>
		                        </div>
            			<div class="panel panel-danger">
                            <div class="panel-heading">
                                <h3 class="panel-title">2019/1/26&nbsp;版本号&nbsp;beta - 0.6</h3>
                            </div>
                            <div class="panel-body">
                               	<center>1.修复后台搜索文章图片位移问题</center>
                               	<center>2.修复后台导航栏链接完整性</center>
                               	<center>3.删除详情页面的公告板，移动到首页</center>
                               	<center>4.更正所有logo名</center>
                               	<center>5.修复无法注册</center>
                            </div>
                        </div>
                    	<div class="panel panel-danger">
                            <div class="panel-heading">
                                <h3 class="panel-title">2019/1/26&nbsp;版本号&nbsp;beta - 0.5</h3>
                            </div>
                            <div class="panel-body">
                               	<center>1.改变开发记录排版顺序</center>
                               	<center>2.后台文章列表新增图片缩图</center>
                               	<center>3.后台文章列表各列固定间距</center>
                               	<center>4.修复详情页面开通链接失效</center>
                               	<center>5.补全SSM框架拦截器，提高系统安全性</center>
                            </div>
                        </div>
                     
                        
                        <div class="panel panel-danger">
                            <div class="panel-heading">
                                <h3 class="panel-title">2019/1/25&nbsp;版本号&nbsp;beta - 0.4</h3>
                            </div>
                            <div class="panel-body">
                               	<center>1.修复充值码不存在情况反馈</center>
                               	<center>2.新增SweetAlert风格弹框</center>
                               	<center>3.修复开发过程页面active状态问题</center>
                               	<center>4.增加分页每页数量为20页</center>
                               	<center>5.修复搜索页面排版不一致</center>
                            </div>
                        </div> 
                        <div class="panel panel-danger">
                            <div class="panel-heading">
                                <h3 class="panel-title">2019/1/25&nbsp;版本号&nbsp;beta - 0.3</h3>
                            </div>
                            <div class="panel-body">
                               	<center>1.修复富文本没有图片报错</center>
                            </div>
                        </div> 
                        <div class="panel panel-danger">
                            <div class="panel-heading">
                                <h3 class="panel-title">2019/1/25&nbsp;版本号&nbsp;beta - 0.2</h3>
                            </div>
                            <div class="panel-body">
                               	<center>1.修复首页，各栏目 按照最后发布时间问题</center>
                               	<center>2.修复修改文章时，文章列表的图片未修改</center>
                               	<center>3.详情页面权限不足提醒</center>
                            </div>
                        </div>  
                        <div class="panel panel-danger">
                            <div class="panel-heading">
                                <h3 class="panel-title">2019/1/24&nbsp;版本号&nbsp;beta - 0.1</h3>
                            </div>
                            <div class="panel-body">
                               	<h1><center>项目发布</center></h1>
                            </div>
                        </div>                     
            </div>
        </div>
    </div>
</body>
</html>