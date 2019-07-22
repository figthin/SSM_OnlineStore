<%@page contentType="text/html; utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<%@include file="_head.jsp"%>
<script type="text/javascript">
	$(function () {
		$("#btn-modify").click(function () {
			var form = $(this).parent().parent();
			var userName = $("#user-id").val();
			var userBirth = $("#user-birth").val();
			var gender = $("#div-gender").children().children(":checked").val();
			if (gender == 'W') {
				gender = '女'
			}else if (gender == 'M') {
				gender = '男'
			}else{
				gender = '保密'
			}
			console.log(userName);
			console.log(userBirth);
			console.log(gender);
			$.ajax({
				url:"${path}/updateUserMessage",
				type:"get",
				data:{
					userName:userName,
					userBirth:userBirth,
					gender:gender
				},
				success:function (res) {
					console.log(res);
					if (res.result) {
						alert("修改成功！");
					}else {
						alert("修改失败！");
					}
				}
			});
		});
	});
</script>
<body>
	<!-- 顶部tab -->
	<div class="tab-header">
		<div class="inner">
			<div class="pull-left">
				<div class="pull-left">嗨，欢迎来到<span class="cr">U袋网</span></div>
				<a href="agent_level">网店代销</a>
				<a href="temp_article/article4">帮助中心</a>
			</div>
			<div class="pull-right">
				<c:if test="${sessionScope.user != null}">
					<a href="${path}/logout"><span class="cr">退出登录</span></a>
				</c:if>
				<c:if test="${sessionScope.user == null}">
					<a href="${path}/login"><span class="cr">登录</span></a>
					<a href="${path}/register">注册</a>
				</c:if>
				<a href="welcome">我的U袋</a>
				<a href="order">我的订单</a>
				<a href="integral">积分平台</a>
			</div>
		</div>
	</div>
	<!-- 顶部标题 -->
	<div class="bgf5 clearfix">
		<div class="top-user">
			<div class="inner">
				<a class="logo" href="index"><img src="${path}/static/images/icons/logo.jpg" alt="U袋网" class="cover"></a>
				<div class="title">个人中心</div>
			</div>
		</div>
	</div>
	<div class="content clearfix bgf5">
		<section class="user-center inner clearfix">
			<div class="pull-left bgf">
				<a href="welcome" class="title">U袋欢迎页</a>
				<dl class="user-center__nav">
					<dt>帐户信息</dt>
					<a href="setting"><dd class="active">个人资料</dd></a>
					<a href="treasurer"><dd>资金管理</dd></a>
					<a href="integral"><dd>积分平台</dd></a>
					<a href="address"><dd>收货地址</dd></a>
					<a href="coupon"><dd>我的优惠券</dd></a>
					<a href="paypwd_modify"><dd>修改支付密码</dd></a>
					<a href="pwd_modify"><dd>修改登录密码</dd></a>
				</dl>
				<dl class="user-center__nav">
					<dt>订单中心</dt>
					<a href="order"><dd>我的订单</dd></a>
					<a href="collection"><dd>我的收藏</dd></a>
					<a href="refund"><dd>退款/退货</dd></a>
				</dl>
				<dl class="user-center__nav">
					<dt>服务中心</dt>
					<a href="mail_query"><dd>物流查询</dd></a>
					<a href=""><dd>数据自助下载</dd></a>
					<a href="temp_article/article1"><dd>售后服务</dd></a>
					<a href="temp_article/article2"><dd>配送服务</dd></a>
					<a href="temp_article/article3"><dd>用户协议</dd></a>
					<a href="temp_article/article4"><dd>常见问题</dd></a>
				</dl>
				<dl class="user-center__nav">
					<dt>新手上路</dt>
					<a href="temp_article/article5"><dd>如何成为代理商</dd></a>
					<a href="temp_article/article6"><dd>代销商上架教程</dd></a>
					<a href="temp_article/article7"><dd>分销商常见问题</dd></a>
					<a href="temp_article/article8"><dd>付款账户</dd></a>
				</dl>
				<dl class="user-center__nav">
					<dt>U袋网</dt>
					<a href="temp_article/article10"><dd>企业简介</dd></a>
					<a href="temp_article/article11"><dd>加入U袋</dd></a>
					<a href="temp_article/article12"><dd>隐私说明</dd></a>
				</dl>
			</div>
			<div class="pull-right">
				<div class="user-content__box clearfix bgf">
					<div class="title">账户信息-个人资料</div>
					<div class="port b-r50" id="crop-avatar">
						<div class="img"><img src="${path}/static/images/icons/default_avt.png" class="cover b-r50"></div>
					</div>
					<form action="" class="user-setting__form" role="form">
						<div class="user-form-group">
							<label for="user-id">用户名：</label>
							<input type="text" id="user-id" value="${requestScope.user.user_name}" placeholder="请输入您的昵称">
						</div>
						<div class="user-form-group">
							<label>等级：</label>
							<c:if test="${sessionScope.user.is_member == 0}">
								普通会员 <a href="${path}/agent_level">提升</a>
							</c:if>
							<c:if test="${sessionScope.user.is_member == 1}">
								银牌会员 <a href="${path}/agent_level">提升</a>
							</c:if>
							<c:if test="${sessionScope.user.is_member == 2}">
								超级会员 <a href="${path}/agent_level">提升</a>
							</c:if>
							<c:if test="${sessionScope.user.is_member == 3}">
								VIP会员 <a href="${path}/agent_level">续费</a>
							</c:if>
						</div>
						<div id="div-gender" class="user-form-group">
							<label>性别：</label>
							<label><input type="radio" name="sex" value="M" <c:if test="${requestScope.user.gender == '男'}">checked</c:if>><i class="iconfont icon-radio"></i> 男士</label>
							<label><input type="radio" name="sex" value="W" <c:if test="${requestScope.user.gender == '女'}">checked</c:if>><i class="iconfont icon-radio"></i> 女士</label>
							<label><input type="radio" name="sex" value="S" <c:if test="${requestScope.user.gender == '保密'}">checked</c:if>><i class="iconfont icon-radio"></i> 保密</label>
						</div>
						<div class="user-form-group">
							<label>生日：</label>
							<label><input type="text" id="user-birth" class="datepicker" value="${requestScope.user.birth}" placeholder="请选择您的出生日期"></label>
						</div>
						<div class="user-form-group">
							<button type="button" class="btn" id="btn-modify"> 确认修改</button>
						</div>
					</form>
					<script src="js/zebra.datepicker.min.js"></script>
					<link rel="stylesheet" href="css/zebra.datepicker.css">
					<script>
						$('input.datepicker').Zebra_DatePicker({
							default_position: 'below',
							show_clear_date: false,
							show_select_today: false,
						});
					</script>
				</div>
			</div>
		</section>
	</div>
	<!-- 头像选择模态框 -->
	<link href="css/cropper/cropper.min.css" rel="stylesheet">
	<link href="css/cropper/sitelogo.css" rel="stylesheet">
	<script src="js/cropper/cropper.min.js"></script>
	<script src="js/cropper/sitelogo.js"></script>
	<div class="modal fade" id="avatar-modal" aria-hidden="true" aria-labelledby="avatar-modal-label" role="dialog" tabindex="-1">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<form class="avatar-form" action="{%url('admin/upload-logo')%}" enctype="multipart/form-data" method="post">
					<div class="modal-header">
						<button class="close" data-dismiss="modal" type="button">&times;</button>
						<h4 class="modal-title" id="avatar-modal-label">Change Logo Picture</h4>
					</div>
					<div class="modal-body">
						<div class="avatar-body">
							<div class="avatar-upload">
								<input class="avatar-src" name="avatar_src" type="hidden">
								<input class="avatar-data" name="avatar_data" type="hidden">
								<label for="avatarInput">图片上传</label>
								<input class="avatar-input" id="avatarInput" name="avatar_file" type="file"></div>
							<div class="row">
								<div class="col-md-9">
									<div class="avatar-wrapper"></div>
								</div>
								<div class="col-md-3">
									<div class="avatar-preview preview-lg"></div>
									<div class="avatar-preview preview-md"></div>
									<div class="avatar-preview preview-sm"></div>
								</div>
							</div>
							<div class="row avatar-btns">
								<div class="col-md-9">
									<div class="btn-group">
										<button class="btn" data-method="rotate" data-option="-90" type="button" title="Rotate -90 degrees"><i class="fa fa-undo"></i> 向左旋转</button>
									</div>
									<div class="btn-group">
										<button class="btn" data-method="rotate" data-option="90" type="button" title="Rotate 90 degrees"><i class="fa fa-repeat"></i> 向右旋转</button>
									</div>
								</div>
								<div class="col-md-3">
									<button class="btn btn-success btn-block avatar-save" type="submit"><i class="fa fa-save"></i> 保存修改</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="loading" aria-label="Loading" role="img" tabindex="-1"></div>
	<!-- 右侧菜单 -->
	<div class="right-nav">
		<ul class="r-with-gotop">
			<li class="r-toolbar-item">
				<a href="welcome" class="r-item-hd">
					<i class="iconfont icon-user" data-badge="0"></i>
					<div class="r-tip__box"><span class="r-tip-text">用户中心</span></div>
				</a>
			</li>
			<li class="r-toolbar-item">
				<a href="shopcart" class="r-item-hd">
					<i class="iconfont icon-cart"></i>
					<div class="r-tip__box"><span class="r-tip-text">购物车</span></div>
				</a>
			</li>
			<li class="r-toolbar-item">
				<a href="collection" class="r-item-hd">
					<i class="iconfont icon-aixin"></i>
					<div class="r-tip__box"><span class="r-tip-text">我的收藏</span></div>
				</a>
			</li>
			<li class="r-toolbar-item">
				<a href="" class="r-item-hd">
					<i class="iconfont icon-liaotian"></i>
					<div class="r-tip__box"><span class="r-tip-text">联系客服</span></div>
				</a>
			</li>
			<li class="r-toolbar-item">
				<a href="issues" class="r-item-hd">
					<i class="iconfont icon-liuyan"></i>
					<div class="r-tip__box"><span class="r-tip-text">留言反馈</span></div>
				</a>
			</li>
			<li class="r-toolbar-item to-top">
				<i class="iconfont icon-top"></i>
				<div class="r-tip__box"><span class="r-tip-text">返回顶部</span></div>
			</li>
		</ul>
		<script>
			$(document).ready(function(){ $('.to-top').toTop({position:false}) });
		</script>
	</div>
	<%@include file="_foot.jsp"%>
</body>
</html>