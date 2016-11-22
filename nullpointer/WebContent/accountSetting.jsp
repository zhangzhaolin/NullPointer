<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>nullpointer</title>
<link rel="shortcut icon" href="images/favicon.png" />
<!-- Style Sheet-->
<link href="${ctx}/docs/css/zui.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${ctx}/css/zui.lite.css">
<link rel="stylesheet" type="text/css" href="${ctx}/css/zui-theme.css">
<link href="${ctx}/docs/css/doc.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${ctx}/css/style.css">
<link rel="stylesheet" type="text/css" href="${ctx}/css/main5152.css">
<!-- 头像上传  -->
<link href="${ctx}/css/main.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/jquery.Jcrop.min.css" rel="stylesheet"
	type="text/css" />

<!-- add scripts -->
<script src="${ctx}/js/jquery.min.js"></script>
<script src="${ctx}/js/jquery.Jcrop.min.js"></script>


<style id="themeStyle"></style>
<style type="text/css">
#changeHeadImgText {
	position: absolute;
	z-index: 1;
	left: 6.2em;
	top: 6em;
	color: black;
}
</style>
</head>

<body>

	<!-- Start of Header -->
	<nav class="navbar navbar-inverse" role="navigation"
		style="margin-bottom: 0px;">
	<div class="center-block">
		<div class="container">
			<!-- 导航头部 -->
			<div class="navbar-header">
				<!-- 移动设备上的导航切换按钮 -->
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse-example">
					<span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<!-- 品牌名称或logo -->
				<img src="${ctx}/images/logo.png" alt="nullpointer" width="200"
					style="margin-top: 3px;">
			</div>
			<!-- 导航项目 -->
			<div class="collapse navbar-collapse navbar-collapse-example">

				<ul class="nav navbar-nav navbar-right">
					<li class="current-menu-item"><a href="${ctx}/index.html">主页</a></li>
					<li><a href="${ctx}/bug-list-admin.html">BUGS</a></li>
					<li><a href="${ctx}/q_a_list.html">技术问答</a></li>
					<li><a href="${ctx}/contact.html">帮助</a></li>
					<li><a href="${ctx}/login.html">登陆/注册</a></li>
					<!-- 导航中的下拉菜单 -->
					<li class="dropdown"><a href="${ctx}/your/nice/url"
						class="dropdown-toggle" data-toggle="dropdown"> <c:if
								test="${imgname!=null}">
								<img src="${ctx}/imgUp/${imgname}" width="20px" height="20px"
									class="img-circle" />
							</c:if> <c:if test="${imgname==null}">
								<img src="${ctx}/imgUp/${userinfo.getUserInfoHeadPortrait()}"
									width="20px" height="20px" class="img-circle" />
							</c:if> <b class="caret"></b></a>
						<ul class="dropdown-menu" role="menu" style="text-align: center;">
							<li><a href="${ctx}/home.jsp">我的主页</a></li>
							<li><a href="${ctx}/home-question.jsp">信息管理</a></li>
							<li><a href="${ctx}/accountSetting.jsp">账号设置</a></li>
							<li><a href="${ctx}/contact.html">建议反馈</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</div>

	</nav>
	<!--导航栏完成-->
	<!-- End of Header -->
	<div class="container" style="padding-top: 20px;">
		<div class="col-md-3 column">

			<div class="col-md-11 column">
				<div class="example"
					style="text-align: center; background-color: #fafafa;">
					<div class="container">

						<c:if test="${imgname!=null}">
							<img class="${ctx}/img-circle" width="100" height="100"
								src="${ctx}/imgUp/${imgname}" alt="头像" id="personalImage">
						</c:if>
						<c:if test="${imgname==null}">
							<img class="${ctx}/img-circle" width="100" height="100"
								src="${ctx}/imgUp/${userinfo.getUserInfoHeadPortrait()}"
								alt="头像" id="personalImage">
						</c:if>

						<div id="changeHeadImgText" style="display: none">
							<a style="color: white; cursor: pointer;" data-type="iframe"
								data-url="modifyAvatar.jsp" data-width="900px"
								data-height="800px" data-toggle="modal">修改头像</a>
						</div>
					</div>
					<h3>${userinfo.getLoginUser().getLoginName() }</h3>
					<p>${userinfo.getUserInfoDescribe() }</p>
				</div>
				<div class="col-md-12">
					<nav class="menu" data-toggle="menu"
						style="width: 200px;margin-top:20px;margin-bottom: 20px;">
					<ul class="nav nav-primary">
						<li class="nav-heading">个人中心</li>
						<li><a href="${ctx }/home?id=1"><i class="icon icon-home"></i>
								我的主页</a></li>
						<li class="active"><a href="${ctx}/accountSetting.html"><i
								class="icon-user"></i> 账号设置</a></li>
						<li><a href="${ctx}/home-question.html"><i
								class="icon icon-question-sign"></i> 我的问题<span
								class="label label-badge label-success">4</span></a></li>
						<li><a href="${ctx}/home-answer.html"><i
								class="icon icon-reply"></i> 我的回答<span
								class="label label-badge label-success">4</span></a></li>
						<li><a href="${ctx}/home-comment.html"><i
								class="icon icon-comments"></i> 我的评论<span
								class="label label-badge label-success">4</span></a></li>
						<li><a href="${ctx}/home-share.html"><i
								class="icon icon-share"></i> 我的分享<span
								class="label label-badge label-success">4</span></a></li>
					</ul>
					</nav>
				</div>

			</div>

		</div>
		<div class="col-md-9 column">
			<div class="alert alert-success with-icon alert-dismissable">
				<i class="icon-user"></i>
				<div class="content">
					hi!&nbsp;&nbsp;&nbsp;${userinfo.getLoginUser().getLoginName() }&nbsp;&nbsp;&nbsp;你已经在这里度过了${request.day }天${hour }小时${min }分钟${second }秒
				</div>
				<button type="button" class="close" data-dismiss="alert"
					aria-hidden="true">×</button>
			</div>

			<form class="form-horizontal"
				action="${ctx }/edit?id=${userinfo.getUserInfoId()}" method="post">
				<div class="form-group">
					<label for="exampleInputAccount4" class="col-sm-2">账号:</label>
					<div class="col-sm-10">
						<p class="form-control-static">${userinfo.getLoginUser().getLoginEmail() }</p>
					</div>
				</div>
				<div class="form-group">
					<label for="exampleInputAccount4" class="col-sm-2">用户名：</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" name="loginName"
							value="${userinfo.getLoginUser().getLoginName() }">
					</div>
				</div>
				<div class="form-group">
					<label for="exampleInputPassword4" class="col-sm-2">个性签名:</label>
					<div class="col-sm-10">
						<textarea name="describe" class="form-control" rows="3"
							value="${userinfo.getUserInfoDescribe() }"></textarea>
					</div>
				</div>
				<div class="form-group">
					<label for="exampleInputPassword4" class="col-sm-2">性别:</label> <label
						class="radio-inline-3"> <input type="radio" name="sex"
						value="男"> 男
					</label> <label class="radio-inline-3"> <input type="radio"
						name="sex" value="女"> 女
					</label>

				</div>
				<div class="form-group">
					<label for="exampleInputPassword4" class="col-sm-2">出生日期:</label>
					<div class="col-sm-10">
						<input id="birthday" name="birthday" onclick="laydate()"
							value="${birthday}"
							style="padding: 7px 10px; border: 1px solid #ccc; margin-right: 10px;"
							class="laydate-icon" />
					</div>
				</div>

				<div class="form-group" style="margin-top: 30px;">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-primary">更新信息</button>
					</div>
				</div>
			</form>







		</div>

	</div>
	<!-- Footer Bottom -->
	<div id="footer-bottom-wrapper">
		<div id="footer-bottom" class="container">
			<div class="row">
				<div class="col-md-6 column">
					<p class="copyright">
						Copyright © 2013. All Rights Reserved by KnowledgeBase.Collect
						from <a href="#" title="EXP" target="_blank">EXP小组</a>
					</p>
				</div>
				<div class="col-md-6 column">
					<!-- Social Navigation -->
					<ul class="social-nav clearfix">
						<li class="linkedin"><a target="_blank" href="#"></a></li>
						<li class="stumble"><a target="_blank" href="#"></a></li>
						<li class="google"><a target="_blank" href="#"></a></li>
						<li class="deviantart"><a target="_blank" href="#"></a></li>
						<li class="flickr"><a target="_blank" href="#"></a></li>
						<li class="skype"><a target="_blank" href="skype:#?call"></a></li>
						<li class="rss"><a target="_blank" href="#"></a></li>
						<li class="twitter"><a target="_blank" href="#"></a></li>
						<li class="facebook"><a target="_blank" href="#"></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

</body>
<script src="${ctx}/assets/jquery.js"></script>
<script src="${ctx}/assets/clipboard/clipboard.min.js"></script>
<script src="${ctx}/assets/less/less.min.js"></script>

<!-- ZUI Javascript组件 -->
<script src="${ctx}/docs/js/zui.min.js"></script>
<script src="${ctx}/docs/js/doc.min.js"></script>
<!-- 增强文档插件 -->
<script async src="${ctx}/assets/prettify/prettify.js"></script>
<script src="${ctx}/assets/marked/marked.min.js"></script>

<script src="${ctx}/js/jquery.min.js"></script>
<script src="${ctx}/js/jquery.Jcrop.min.js"></script>
<script src="${ctx}/js/script.js"></script>

<script src="${ctx}/js/laydate.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function() {
		//当鼠标移到这里时
		$("#personalImage").mouseover(function() {
			$("#changeHeadImgText").show();
		})
		$("#personalImage").mouseout(function() {
			$("#changeHeadImgText").hide();
		})
		$("#changeHeadImgText").mouseover(function() {
			$("#changeHeadImgText").show();
		})
		$("#changeHeadImgText").mouseout(function() {
			$("#changeHeadImgText").hide();
		})
	});
</script>


</html>