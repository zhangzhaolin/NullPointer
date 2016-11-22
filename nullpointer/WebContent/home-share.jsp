<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en-gb" dir="ltr" class="uk-notouch">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>nullpointer</title>
<link rel="shortcut icon" href="${ctx}/images/favicon.png" />
<!-- Style Sheet-->
<link href="${ctx}/docs/css/zui.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${ctx}/css/zui.lite.css">
<link rel="stylesheet" type="text/css" href="${ctx}/css/zui-theme.css">
<link href="${ctx}/docs/css/doc.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${ctx}/css/style.css">
<link rel="stylesheet" type="text/css" href="${ctx}/css/main5152.css">
<style id="themeStyle"></style>

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
				<img src="images/logo.png" alt="nullpointer" width="200"
					style="margin-top: 3px;">
			</div>
			<!-- 导航项目 -->
			<div class="collapse navbar-collapse navbar-collapse-example">

				<ul class="nav navbar-nav navbar-right">
					<li class="current-menu-item"><a href="${ctx}/ndex.html">主页</a></li>
					<li><a href="${ctx}/bug-list-admin.jsp">BUGS</a></li>
					<li><a href="${ctx}/q_a_list.jsp">技术问答</a></li>
					<li><a href="${ctx}/contact.jsp">帮助</a></li>
					<li><a href="${ctx}/login.jsp">登陆/注册</a></li>
					<!-- 导航中的下拉菜单 -->
					<li class="dropdown"><a href="your/nice/url"
						class="dropdown-toggle" data-toggle="dropdown"><img
							src="${ctx}/images/touxiang.jpg" width="20px" height="20px"
							class="img-circle" /> <b class="caret"></b></a>
						<ul class="dropdown-menu" role="menu" style="text-align: center;">
							<li><a href="${ctx}/home.jsp">我的主页</a></li>
							<li><a href="${ctx}/home-question.jsp">信息管理</a></li>
							<li><a href="${ctx}/accountSetting.jsp">账号设置</a></li>
							<li><a href="${ctx}/contact.jsp">建议反馈</a></li>
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
						<img class="img-circle" width="100" height="100"
							src="${ctx}/images/touxiang.jpg" alt="头像">

					</div>

					<h3>巴斯塔</h3>
					<p>这个小孩没有个性签名</p>
				</div>
				<div class="col-md-12">


					<nav class="menu" data-toggle="menu"
						style="width: 200px;margin-top:20px;margin-bottom: 20px;">
					<ul class="nav nav-primary">
						<li class="nav-heading">个人中心</li>
						<li><a href="${ctx}/home.jsp"><i class="icon icon-home"></i>
								我的主页</a></li>
						<li><a href="${ctx}/accountSetting.jsp"><i
								class="icon-user"></i> 账号设置</a></li>
						<li><a href="${ctx}/home-question.jsp"><i
								class="icon icon-question-sign"></i> 我的问题<span
								class="label label-badge label-success">4</span></a></li>
						<li><a href="${ctx}/home-answer.jsp"><i
								class="icon icon-reply"></i> 我的回答<span
								class="label label-badge label-success">4</span></a></li>
						<li><a href="${ctx}/home-comment.jsp"><i
								class="icon icon-comments"></i> 我的评论<span
								class="label label-badge label-success">4</span></a></li>
						<li class="active"><a href="${ctx}/home-share.jsp"><i
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
					hi!&nbsp;&nbsp;&nbsp;巴斯塔&nbsp;&nbsp;&nbsp;你已经在这里度过了1年2个月3天</div>
				<button type="button" class="close" data-dismiss="alert"
					aria-hidden="true">×</button>
			</div>

			<div class="items">
				<h2 class="header-dividing">我的分享</h2>
				<div class="item">
					<div class="item-heading">
						<div class="pull-right label label-success">维基</div>
						<h4>
							<a href="###">HTML5 发展历史</a>
						</h4>
					</div>
					<div class="item-content">
						<div class="text">HTML 5草案的前身名为Web Applications
							1.0，是在2004年由WHATWG提出。2008年1月22日，第一份正式草案发布。WHATWG表示该规范是目前仍在进行的工作，仍须多年的努力。[8]目前Mozilla
							Firefox、Google Chrome、Opera、Safari（版本4以上）、Internet
							Explorer（版本9以上）已支持HTML5技术。</div>
					</div>
					<div class="item-footer">
						<a href="#" class="text-muted"><i class="icon-comments"></i>
							243</a> &nbsp; <span class="text-muted">2013-11-11 16:14:37</span>
					</div>
				</div>
				<div class="item">
					<div class="item-heading">
						<div class="pull-right label label-success">维基</div>
						<h4>
							<a href="###">HTML5 发展历史</a>
						</h4>
					</div>
					<div class="item-content">

						<div class="text">HTML 5草案的前身名为Web Applications
							1.0，是在2004年由WHATWG提出。2008年1月22日，第一份正式草案发布。WHATWG表示该规范是目前仍在进行的工作，仍须多年的努力。[8]目前Mozilla
							Firefox、Google Chrome、Opera、Safari（版本4以上）、Internet
							Explorer（版本9以上）已支持HTML5技术。</div>
					</div>
					<div class="item-footer">
						<a href="#" class="text-muted"><i class="icon-comments"></i>
							243</a> &nbsp; <span class="text-muted">2013-11-11 16:14:37</span>
					</div>
				</div>
				<div class="item">
					<div class="item-heading">
						<div class="pull-right label label-success">维基</div>
						<h4>
							<a href="###">HTML5 发展历史</a>
						</h4>
					</div>
					<div class="item-content">
						<div class="text">HTML 5草案的前身名为Web Applications
							1.0，是在2004年由WHATWG提出。2008年1月22日，第一份正式草案发布。WHATWG表示该规范是目前仍在进行的工作，仍须多年的努力。[8]目前Mozilla
							Firefox、Google Chrome、Opera、Safari（版本4以上）、Internet
							Explorer（版本9以上）已支持HTML5技术。</div>
					</div>
					<div class="item-footer">
						<a href="#" class="text-muted"><i class="icon-comments"></i>
							243</a> &nbsp; <span class="text-muted">2013-11-11 16:14:37</span>
					</div>
				</div>
				<ul class="pager">
					<li class="previous"><a href="your/nice/url">«</a></li>
					<li><a href="your/nice/url">1</a></li>
					<li class="active"><a href="your/nice/url">2</a></li>
					<li><a href="your/nice/url">3</a></li>
					<li><a href="your/nice/url">4</a></li>
					<li><a href="your/nice/url">5</a></li>
					<li class="next"><a href="your/nice/url">»</a></li>
				</ul>
			</div>

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

</script>

</html>