<%@page pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<%@include file="_head.jsp"%>
<script type="text/javascript">
	$(function () {
		$("#btn-charge").click(function () {
			var money = $("#add-money").val();
			$("#add-money").val("");
			var charge = $("#user-balance");
			$.ajax({
				url:"${path}/charge",
				type:"get",
				data:{
					money:money
				},
				success:function (res) {
					if (res.result) {
						alert("充值成功！")
						charge.text(res.balance);
					}else {
						alert("充值失败！")
					}
				}
			});
		});
	});
	$(function () {
		$("#withDraw").click(function () {
			var money = $("#up-money").val();
			$("#up-money").val("");
			var charge = $("#user-balance");
			$.ajax({
				url:"${path}/withDraw",
				type:"get",
				data:{
					money:money
				},
				success:function (res) {
					if (res.result) {
						alert("提现成功！")
						charge.text(res.balance);
					}else {
						alert("提现失败！")
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
					<a href="setting"><dd>个人资料</dd></a>
					<a href="treasurer"><dd class="active">资金管理</dd></a>
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
					<div class="title">账户信息-资金管理</div>
					<div class="assets-box">
						<samll class="c6">账户余额：</samll>
						<samll class="cr">¥</samll>
						<b id="user-balance" class="fz16 cr">${requestScope.user.balance}</b>
						<ul class="nav pull-right" role="tablist">
							<li role="presentation" class="active"><a href="#add" aria-controls="add" role="tab" data-toggle="tab">充值</a></li>
							<li role="presentation" class=""><a href="#up" aria-controls="up" role="tab" data-toggle="tab">提现</a></li>
							<li role="presentation" class=""><a href="#log" aria-controls="log" role="tab" data-toggle="tab">交易记录</a></li>
						</ul>
					</div>
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane fade in active" id="add">
							<form action="" class="user-setting__form" role="form">
								<div class="form-group">
									<label for="add-money">充值金额</label>
									<input id="add-money" class="assets-control" placeholder="输入您要充值的金额" type="text">
								</div>
								<%--<div class="form-group">
									<label for="add-note">备注（可不填）</label>
									<textarea id="add-note" class="assets-control" placeholder=""></textarea>
								</div>
								<div class="form-group">
									<label for="note">支付方式（手续费 <span id="tip">0</span>）</label>
									<div class="pay-method-box tags-box">
										<label><input type="radio" name="pay_method" value="Alipay"><i class="pay-method__img alipay"></i></label>
										<label><input type="radio" name="pay_method" value="WeChat"><i class="pay-method__img wechat"></i></label>
									</div>
								</div>--%>
								<div class="user-form-group tags-box">
									<button type="button" id="btn-charge" class="btn">确认充值</button>
									<button type="reset" class="btn">重置</button>
								</div>
							</form>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="up">
							<form action="" class="user-setting__form" role="form">
								<div class="form-group">
									<label for="up-money">提现金额</label>
									<input id="up-money" class="assets-control" placeholder="输入您要提现的金额" type="text">
<%--									<span class="help-block fz12">注：单次提现，提现金额不低于100.0元</span>--%>
								</div>
								<%--<div class="form-group">
									<label for="up-name">姓名</label>
									<input id="up-name" class="assets-control" placeholder="输入您的姓名" type="text">
								</div>
								<div class="form-group">
									<label for="up-bank">开户行</label>
									<input id="up-bank" class="assets-control" placeholder="开户行" type="text">
								</div>
								<div class="form-group">
									<label for="up-number">银行账号</label>
									<input id="up-number" class="assets-control" placeholder="银行账号" type="text">
								</div>
								<div class="form-group">
									<label for="up-phone">手机号码</label>
									<input id="up-phone" class="assets-control" placeholder="请输入您的联系号码" type="text">
								</div>
								<div class="form-group">
									<label for="up-note">备注（可不填）</label>
									<textarea id="up-note" class="assets-control" placeholder=""></textarea>
								</div>--%>
								<div class="user-form-group tags-box">
									<button id="withDraw" type="button" class="btn ">申请提现</button>
									<button type="reset" class="btn ">重置</button>
								</div>
							</form>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="log">
							<div class="bs-example" data-example-id="hoverable-table">
								<table class="assets-table table table-bordered table-hover c6 text-center">
									<thead>
										<tr>
											<th>操作时间</th>
											<th>类型</th>
											<th>金额</th>
											<th>备注</th>
											<th>状态</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>2017.09.20 17:20</td>
											<td>充值</td>
											<td>50.00</td>
											<td>充值代销</td>
											<td><span class="text-primary">未确认</span></td>
											<td><a href="">付款</a> <a href="">取消</a></td>
										</tr>
										<tr>
											<td>2017.09.20 17:20</td>
											<td>提现</td>
											<td>50.00</td>
											<td>提现金额</td>
											<td><span class="text-success">完成</span></td>
											<td>-</td>
										</tr>
										<tr>
											<td>2017.09.20 17:20</td>
											<td>提现</td>
											<td>50.00</td>
											<td>提现金额</td>
											<td><span class="text-info">提现中</span></td>
											<td><a href="">联系客服</a></td>
										</tr>
										<tr>
											<td>2017.09.20 17:20</td>
											<td>提现</td>
											<td>50.00</td>
											<td>无</td>
											<td><span class="text-success">完成</span></td>
											<td>-</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
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