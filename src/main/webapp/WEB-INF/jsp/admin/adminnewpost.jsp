<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>两点兔兔 - 新增文章</title>
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
				  <li><a href="${pageContext.request.contextPath}/adminpost">文章列表</a></li>
				  <li class="active">新建文章</li>
			</ol>
                    	<form action="" method="POST" role="form" id="fabu"> 
                                    <legend>写篇新文章</legend>
                                    <div class="form-group">
                                        <label for="">文章标题</label>
                                        <input type="text" name="rname" id="rname" class="form-control" id="" placeholder="请在此输入标题">
                                    </div>
                                    <div class="form-group">
                                        <label for="">文章大小</label>
                                        <input type="text" name="rsize" id="rsize" class="form-control" id="" placeholder="请在此输入参数">
                                    </div>
                                    <div class="form-group">
                                        <label for="">资源时长</label>
                                        <input type="text" name="rtime" id="rtime" class="form-control" id="" placeholder="请在此输入时长">
                                    </div>
                                    <div class="form-group">
                                        <label for="">发布栏目</label>
                                        <select name="rca" id="rca" class="form-control" required="required">
                                            <option value="1">福利视频</option>
                                            <option value="2">绳艺视频</option>
                                            <option value="3">精品套图</option>
                                            <option value="4">在线视频</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="">文章内容</label>
                                        <script id="editor" type="text/plain" name="rcontent" style="width:927px;height:500px;"></script>
                                    </div>
                                    <button type="submit" class="btn btn-primary" id="fbwz">发布文章</button>
                                    <button onclick="getContent()">获得内容</button>
                                    
                                </form>
                    
     
            </div>
            <div class="col-lg-3">
                   
            </div>
        </div>
    </div>
    <script type="text/javascript">

    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');


    function isFocus(e){
        alert(UE.getEditor('editor').isFocus());
        UE.dom.domUtils.preventDefault(e)
    }
    function setblur(e){
        UE.getEditor('editor').blur();
        UE.dom.domUtils.preventDefault(e)
    }
    function insertHtml() {
        var value = prompt('插入html代码', '');
        UE.getEditor('editor').execCommand('insertHtml', value)
    }
    function createEditor() {
        enableBtn();
        UE.getEditor('editor');
    }
    function getAllHtml() {
        alert(UE.getEditor('editor').getAllHtml())
    }
    function getContent() {
        var arr = [];
        arr.push("使用editor.getContent()方法可以获得编辑器的内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getContent());
        alert(arr.join("\n"));
        
        var str='arr.join("\n")';
        var reg = new RegExp("(<img.*src=\"\.*?\>)");  //正则表达式
        str.match(reg);
        var re = /src="([^"]*)"/g; 
        alert(str.match(reg));
        while (arr = re.exec(str)) {
            alert(arr[1]);
        }
    }
    function getPlainTxt() {
        var arr = [];
        arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getPlainTxt());
        alert(arr.join('\n'))
    }
    function setContent(isAppendTo) {
        var arr = [];
        arr.push("使用editor.setContent('欢迎使用ueditor')方法可以设置编辑器的内容");
        UE.getEditor('editor').setContent('欢迎使用ueditor', isAppendTo);
        alert(arr.join("\n"));
    }
    function setDisabled() {
        UE.getEditor('editor').setDisabled('fullscreen');
        disableBtn("enable");
    }

    function setEnabled() {
        UE.getEditor('editor').setEnabled();
        enableBtn();
    }

    function getText() {
        //当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
        var range = UE.getEditor('editor').selection.getRange();
        range.select();
        var txt = UE.getEditor('editor').selection.getText();
        alert(txt)
    }

    function getContentTxt() {
        var arr = [];
        arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
        arr.push("编辑器的纯文本内容为：");
        arr.push(UE.getEditor('editor').getContentTxt());
        alert(arr.join("\n"));
    }
    function hasContent() {
        var arr = [];
        arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
        arr.push("判断结果为：");
        arr.push(UE.getEditor('editor').hasContents());
        alert(arr.join("\n"));
    }
    function setFocus() {
        UE.getEditor('editor').focus();
    }
    function deleteEditor() {
        disableBtn();
        UE.getEditor('editor').destroy();
    }
    function disableBtn(str) {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            if (btn.id == str) {
                UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
            } else {
                btn.setAttribute("disabled", "true");
            }
        }
    }
    function enableBtn() {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
        }
    }

    function getLocalData () {
        alert(UE.getEditor('editor').execCommand( "getlocaldata" ));
    }

    function clearLocalData () {
        UE.getEditor('editor').execCommand( "clearlocaldata" );
        alert("已清空草稿箱")
    }
</script>
<script type="text/javascript">
	$("#fbwz").click(function(){
		var rname= $.trim($("#rname").val());
		if(rname == ""){
			swal({ 
	  			  title: "文章标题不能空哦！", 
	  			  timer: 1500, 
	  			  type: "warning",
	  			  showConfirmButton: false 
	  			});
			return false;
		}
 		var formData = new FormData($("#fabu")[0]);
 		$.ajax({
         	type:"post",
         	url:"${pageContext.request.contextPath }/adminnewpost1",
         	data:formData,
         	async: false,  
            cache: false,
            contentType: false,  
            processData: false, 
            dataType:"text",
         	success:function(msg){
         		if(msg=="ok"){
         			swal ( "文章发布成功" ,  "正前往文章列表" ,  "success" )
         			setTimeout(function(){
             			window.location.href="${pageContext.request.contextPath }/adminpost";
         			},2000)
         		}else if(msg=="no"){
         			swal ( "文章名存在重复" ,  "请修改文章名" ,  "warning" )
         			setTimeout(function(){
             			window.location.href="${pageContext.request.contextPath }/adminpost";
         			},2000)
         		}
         	}
         });
 	}); 
function test()
{
    
}
</script>
</body>
</html>