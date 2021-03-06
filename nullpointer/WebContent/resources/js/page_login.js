$(document).ready(
				function() {

					// 获取JS传递的语言参数
					var utils = new Utils();
					var args = utils.getScriptArgs();

					// 隐藏Loading/登录失败 DIV
					$(".loading").hide();
					$(".login-error").hide();

					// 加载国际化语言包资源
					// utils.loadProperties(args.lang);
					var remeberUser = new RemeberUser();

					// 输入框激活焦点、移除焦点
					jQuery.focusblur = function(focusid) {
						var focusblurid = $(focusid);
						var defval = focusblurid.val();
						focusblurid.focus(function() {
							var thisval = $(this).val();
							if (thisval == defval) {
								$(this).val("");
							}
						});
						focusblurid.blur(function() {
							var thisval = $(this).val();
							if (thisval == "") {
								$(this).val(defval);
							}
						});

					};
					/* 下面是调用方法 */
//					$.focusblur("#email");
					$.focusblur("#loginName");
					$.focusblur("#password");
					$.focusblur("#codeValue");

					// 获取表单验证对象[填写验证规则]
					var validate = $("#signupForm")
							.validate(
									{
										rules : {
//											email : {
//												required : true,
//												email : true
//											},
											password : {
												required : true,
												minlength : 4,
												maxlength : 16
											},
											codeValue : {
												required : true
											},
											loginName : {
												required : true,
											}

										},
										messages : {
//											email : {
//												required : $.i18n
//														.prop("Form.PleaseInputEmail"),
//												email : $.i18n
//														.prop("Form.PleaseInputCorrectEmail")
//											},
											password : {
												required : $.i18n
														.prop("Form.PleaseInputPassword"),
												minlength : jQuery
														.format($.i18n
																.prop("Form.PasswordFormat")),
												maxlength : jQuery
														.format($.i18n
																.prop("Form.PasswordFormatMax"))
											},
											codeValue : {
												required : $.i18n
														.prop("not exists")
											},
											loginName : {
												required : $.i18n
														.prop("Form.PleaseInputLoginName"),
											},
										}
									});

					// 输入框激活焦点、溢出焦点的渐变特效
//					if ($("#email").val()) {
//						$("#email").prev().fadeOut();
//					}
					if ($("#loginName").val()) {
						$("#loginName").prev().fadeOut();
					}
					if ($("#codeValue").val()) {
						$("#codeValue").prev().fadeOut();
					}
					if ($("#password").val()) {
						$("#password").prev().fadeOut();
					}
//					$("#email").focus(function() {
//						$(this).prev().fadeOut();
//					});
//					$("#email").blur(function() {
//						if (!$("#email").val()) {
//							$(this).prev().fadeIn();
//						}
//					});
					$("#codeValue").focus(function() {
						$(this).prev().fadeOut();
					});
					$("#codeValue").blur(function() {
						if (!$("#codeValue").val()) {
							$(this).prev().fadeIn();
						}
					});
					$("#loginName").focus(function() {
						$(this).prev().fadeOut();
					});
					$("#loginName").blur(function() {
						if (!$("#loginName").val()) {
							$(this).prev().fadeIn();
						}
					});
					$("#password").focus(function() {
						$(this).prev().fadeOut();
					});
					$("#password").blur(function() {
						if (!$("#password").val()) {
							$(this).prev().fadeIn();
						}
					});

					// ajax提交登录
					$("#submit").bind("click", function() {
						login(validate, remeberUser);
					});

					// $("body").each(function() {
					// $(this).keydown(function() {
					// if (event.keyCode == 13) {
					// login(validate, remeberUser);
					// }
					// });
					// });
				});

function login(validate, remeberUser) {
	// 校验email, password,loginName,code，校验如果失败的话不提交

	if (validate.form()) {
		remeberUser.SetPwdAndChk();
		var md5 = new MD5();
		var f = "......" == $("#password").val() ? "" : md5.MD5($("#password")
				.val());
		$.post({
			url : "loginUser/login",
			data : {
				password : f,
				loginName : $("#loginName").val(),
				codeValue : $("#codeValue").val()
			},
			beforeSend : function() {
				$('.loading').show();
			},
			success : function(data, status) {
				console.log(data);
				$('.loading').hide();
				if (data == "0") {
					// 登录成功
					window.location.href = "index";
				}else if(data=="-1"){
					//验证码错误
					$(".login-error").show();
					$(".login-error").html($.i18n.prop("您的验证码有误"));
				}else if (data == "1") {
					// 数据库链接失败
					$(".login-error").show();
					$(".login-error").html($.i18n.prop("您的网络有问题")); //正如大多数公司干的，如果是服务器遇到问题，就说是网络问题
				}else if (data == "2") {
					// 参数传递失败
					$(".login-error").show();
					$(".login-error").html($.i18n.prop("请刷新重写"));
				} else if (data == "14") {
					// 用户名
					$(".login-error").show();
					$(".login-error").html(
							$.i18n.prop("不存在该用户"));
				} else if (data =="19") {
					// 登录失败[需要重新输入密码]
					$(".login-error").show();
					$(".login-error").html(
							$.i18n.prop("登录失败[密码错误]"));
				} else if (data == "16") {
					// 邮箱未激活
					$(".login-error").show();
					$(".login-error").html(
							$.i18n.prop("邮箱未激活，请激活后登录"));
				}else {
				// 登录异常
				$(".login-error").show();
				$(".login-error").html($.i18n.prop("未知异常！关闭浏览器后重试"));
				}
			}
		});
	}
}
var Utils = function() {
};

// Utils.prototype.loadProperties = function(lang) {
// jQuery.i18n.properties({// 加载资浏览器语言对应的资源文件
// name : 'ApplicationResources',
// language : lang,
// path : 'resources/i18n/',
// mode : 'map',
// callback : function() {// 加载成功后设置显示内容
// }
// });
// };

Utils.prototype.getScriptArgs = function() {// 获取多个参数
	var scripts = document.getElementsByTagName("script"),
	// 因为当前dom加载时后面的script标签还未加载，所以最后一个就是当前的script
	script = scripts[scripts.length - 1], src = script.src, reg = /(?:\?|&)(.*?)=(.*?)(?=&|$)/g, temp, res = {};
	while ((temp = reg.exec(src)) != null)
		res[temp[1]] = decodeURIComponent(temp[2]);
	return res;
};

/**
 * 记住用户类
 */
var RemeberUser = function() {
	this.GetLastUser();
};

RemeberUser.prototype.GetLastUser = function() {
	var id = "currentuser";
	var usr = this.GetCookie(id);
	// if (usr != null) {
	// $("#email").val(usr);
	// }
	this.GetPwdAndChk();
};

// 点击登录时触发客户端事件
RemeberUser.prototype.SetPwdAndChk = function() {
	// 取用户名
	var usr = $("#email").val();
	// 将最后一个用户信息写入到Cookie
	this.SetLastUser(usr);
	// 如果记住密码选项被选中
	// var chk = $("#remeber").attr("checked");
	// if(chk == "checked")
	// {
	// //取密码值
	// var pwd = $("#password").val();
	// var expdate = new Date();
	// expdate.setTime(expdate.getTime() + 14 * (24 * 60 * 60 * 1000));
	// //将用户名和密码写入到Cookie
	// this.SetCookie(usr,pwd, expdate);
	// }
	// else
	// {
	// //如果没有选中记住密码,则立即过期
	// this.ResetCookie();
	// }
};
// 设置初始用户名
RemeberUser.prototype.SetLastUser = function(usr) {
	// var id = "49BAC005-3D3B-4231-8CEA-16939BEACD67";
	var id = "currentuser";
	var expdate = new Date();
	// 当前时间加上两周的时间
	expdate.setTime(expdate.getTime() + 14 * (24 * 60 * 60 * 1000));
	// TODO:this.SetCookie(id, usr, expdate,"/",".dataeye.com");
	this.SetCookie(id, usr, expdate);
};

// 用户名失去焦点时调用该方法
RemeberUser.prototype.GetPwdAndChk = function() {
	var usr = $("#email").val();
	var pwd = this.GetCookie("currenttoken");
	if (pwd != null) {
		// $("#password").val(pwd);
		$("#password").val("......");
	} else {
		$("#password").val("");
	}
};

// 取Cookie的值
RemeberUser.prototype.GetCookie = function(name) {
	var arg = name + "=";
	var alen = arg.length;
	var clen = document.cookie.length;
	var i = 0;
	while (i < clen) {
		var j = i + alen;
		if (document.cookie.substring(i, j) == arg)
			return this.getCookieVal(j);
		i = document.cookie.indexOf(" ", i) + 1;
		if (i == 0)
			break;
	}
	return null;
};
// 获取cookie值
RemeberUser.prototype.getCookieVal = function(offset) {
	var endstr = document.cookie.indexOf(";", offset);
	if (endstr == -1)
		endstr = document.cookie.length;
	return unescape(document.cookie.substring(offset, endstr));
};

// 写入到Cookie
RemeberUser.prototype.SetCookie = function(name, value, expiresTime) {
	var argv = this.SetCookie.arguments;
	// 本例中length = 3
	var argc = this.SetCookie.arguments.length;
	var expires = (argc > 2) ? argv[2] : null;
	var path = (argc > 3) ? argv[3] : null;
	path = "/";
	var domain = (argc > 4) ? argv[4] : null;

	var secure = (argc > 5) ? argv[5] : false;
	document.cookie = name + "=" + escape(value)
			+ ((expires == null) ? "" : ("; expires=" + expires.toGMTString()))
			+ ((path == null) ? "" : ("; path=" + path))
			+ ((domain == null) ? "" : ("; domain=" + domain))
			+ ((secure == true) ? "; secure" : "");
};
// 重置cookie
RemeberUser.prototype.ResetCookie = function() {
	var usr = $("#email").val();
	var expdate = new Date();
	this.SetCookie(usr, null, expdate);
};