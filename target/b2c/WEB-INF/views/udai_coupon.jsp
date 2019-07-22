<%@page pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<%@include file="_head.jsp"%>
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
				<a href="login"><span class="cr">登录</span></a>
				<a href="login?p=register">注册</a>
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
					<a href="treasurer"><dd>资金管理</dd></a>
					<a href="integral"><dd>积分平台</dd></a>
					<a href="address"><dd>收货地址</dd></a>
					<a href="coupon"><dd class="active">我的优惠券</dd></a>
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
					<div class="title">账户信息-积分平台</div>
					<ul class="nav user-nav__title" role="tablist">
						<li role="presentation" class="nav-item active"><a href="#useful" aria-controls="useful" role="tab" data-toggle="tab">未使用</a></li>
						<li role="presentation" class="nav-item "><a href="#used" aria-controls="used" role="tab" data-toggle="tab">已使用</a></li>
						<li role="presentation" class="nav-item "><a href="#overdue" aria-controls="overdue" role="tab" data-toggle="tab">已过期</a></li>
					</ul>
					
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane fade in active" id="useful">
							<div class="coupon-list">

								<div class="coupon">
									<div class="coupon-hd">
										<b><small class="fz16">¥</small>2.00</b>
										<div class="fz12">【使用期限】<br>2017.09.20至2017.12.5</div>
									</div>
									<div class="coupon-bd">
										<div class="fz12 c9">券号：70000503249136</div>
										<div class="fz12 c9">规则： 消费需满50元</div>
									</div>
									<a href="item_sale_page" class="coupon-ft">立即使用</a>
								</div>

								<div class="coupon">
									<div class="coupon-hd">
										<b><small class="fz16">¥</small>5.00</b>
										<div class="fz12">【使用期限】<br>2017.09.20至2017.12.5</div>
									</div>
									<div class="coupon-bd">
										<div class="fz12 c9">券号：70000503249137</div>
										<div class="fz12 c9">规则： 消费需满60元</div>
									</div>
									<a href="item_sale_page" class="coupon-ft">立即使用</a>
								</div>

								<div class="coupon">
									<div class="coupon-hd"><b><small class="fz16">¥</small>1.50</b><div class="fz12">【使用期限】<br>2017.09.20至2017.12.5</div></div>
									<div class="coupon-bd"><div class="fz12 c9">券号：70000503249137</div><div class="fz12 c9">规则： 消费需满30元</div></div>
									<a href="item_sale_page" class="coupon-ft">立即使用</a>
								</div>
								<div class="coupon">
									<div class="coupon-hd"><b><small class="fz16">¥</small>1.00</b><div class="fz12">【使用期限】<br>2017.09.20至2017.12.5</div></div>
									<div class="coupon-bd"><div class="fz12 c9">券号：70000503249136</div><div class="fz12 c9">规则： 消费需满20元</div></div>
									<a href="item_sale_page" class="coupon-ft">立即使用</a>
								</div>
								<div class="coupon">
									<div class="coupon-hd"><b><small class="fz16">¥</small>1.50</b><div class="fz12">【使用期限】<br>2017.09.20至2017.12.5</div></div>
									<div class="coupon-bd"><div class="fz12 c9">券号：70000503249136</div><div class="fz12 c9">规则： 消费需满25元</div></div>
									<a href="item_sale_page" class="coupon-ft">立即使用</a>
								</div>
								<div class="coupon">
									<div class="coupon-hd"><b><small class="fz16">¥</small>100.00</b><div class="fz12">【使用期限】<br>2017.09.20至2017.12.5</div></div>
									<div class="coupon-bd"><div class="fz12 c9">券号：70000503249136</div><div class="fz12 c9">规则： 消费需满2000元</div></div>
									<a href="item_sale_page" class="coupon-ft">立即使用</a>
								</div>
								<div class="coupon">
									<div class="coupon-hd"><b><small class="fz16">¥</small>150.00</b><div class="fz12">【使用期限】<br>2017.09.20至2017.12.5</div></div>
									<div class="coupon-bd"><div class="fz12 c9">券号：70000503249136</div><div class="fz12 c9">规则： 消费需满2500元</div></div>
									<a href="item_sale_page" class="coupon-ft">立即使用</a>
								</div>
								<div class="coupon">
									<div class="coupon-hd"><b><small class="fz16">¥</small>100.00</b><div class="fz12">【使用期限】<br>2017.09.20至2017.12.5</div></div>
									<div class="coupon-bd"><div class="fz12 c9">券号：70000503249136</div><div class="fz12 c9">规则： 消费需满2000元</div></div>
									<a href="item_sale_page" class="coupon-ft">立即使用</a>
								</div>
								<div class="coupon">
									<div class="coupon-hd"><b><small class="fz16">¥</small>88.00</b><div class="fz12">【使用期限】<br>2017.09.20至2017.12.5</div></div>
									<div class="coupon-bd"><div class="fz12 c9">券号：70000503249136</div><div class="fz12 c9">规则： 消费需满890元</div></div>
									<a href="item_sale_page" class="coupon-ft">立即使用</a>
								</div>
								<div class="coupon">
									<div class="coupon-hd"><b><small class="fz16">¥</small>2.00</b><div class="fz12">【使用期限】<br>2017.09.20至2017.12.5</div></div>
									<div class="coupon-bd"><div class="fz12 c9">券号：70000503249136</div><div class="fz12 c9">规则： 消费需满5元</div></div>
									<a href="item_sale_page" class="coupon-ft">立即使用</a>
								</div>
								<div class="coupon">
									<div class="coupon-hd"><b><small class="fz16">¥</small>1.00</b><div class="fz12">【使用期限】<br>2017.09.20至2017.12.5</div></div>
									<div class="coupon-bd"><div class="fz12 c9">券号：70000503249136</div><div class="fz12 c9">规则： 消费需满2元</div></div>
									<a href="item_sale_page" class="coupon-ft">立即使用</a>
								</div>
								<div class="coupon">
									<div class="coupon-hd"><b><small class="fz16">¥</small>99999.00</b><div class="fz12">【使用期限】<br>2017.09.20至2017.12.5</div></div>
									<div class="coupon-bd"><div class="fz12 c9">券号：70000503249136</div><div class="fz12 c9">规则： 消费需满100000元</div></div>
									<a href="item_sale_page" class="coupon-ft">立即使用</a>
								</div>
							</div>
							<div class="page text-right clearfix">
								<a class="disabled">上一页</a>
								<a class="select">1</a>
								<a href="">2</a>
								<a href="">3</a>
								<a class="" href="">下一页</a>
							</div>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="used">
							<div class="coupon-list">
								<div class="empty-msg">哇，居然没有优惠券了？</div>
							</div>
							<div class="page text-right clearfix">
								<a class="disabled">上一页</a>
								<a class="select">1</a>
								<a href="">2</a>
								<a href="">3</a>
								<a class="" href="">下一页</a>
							</div>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="overdue">
							<div class="coupon-list">
								<div class="coupon"><div class="coupon-hd"><b><small class="fz16">¥</small>2.00</b><div class="fz12">【使用期限】<br>2017.09.20至2017.12.5</div></div><div class="coupon-bd"><div class="fz12 c9">券号：70000503249136</div><div class="fz12 c9">规则： 消费需满50元</div></div><a href="javascript:;" class="coupon-ft">已经过期</a></div><div class="coupon"><div class="coupon-hd"><b><small class="fz16">¥</small>5.00</b><div class="fz12">【使用期限】<br>2017.09.20至2017.12.5</div></div><div class="coupon-bd"><div class="fz12 c9">券号：70000503249137</div><div class="fz12 c9">规则： 消费需满60元</div></div><a href="javascript:;" class="coupon-ft">已经过期</a></div><div class="coupon"><div class="coupon-hd"><b><small class="fz16">¥</small>1.50</b><div class="fz12">【使用期限】<br>2017.09.20至2017.12.5</div></div><div class="coupon-bd"><div class="fz12 c9">券号：70000503249137</div><div class="fz12 c9">规则： 消费需满30元</div></div><a href="javascript:;" class="coupon-ft">已经过期</a></div><div class="coupon"><div class="coupon-hd"><b><small class="fz16">¥</small>1.00</b><div class="fz12">【使用期限】<br>2017.09.20至2017.12.5</div></div><div class="coupon-bd"><div class="fz12 c9">券号：70000503249136</div><div class="fz12 c9">规则： 消费需满20元</div></div><a href="javascript:;" class="coupon-ft">已经过期</a></div><div class="coupon"><div class="coupon-hd"><b><small class="fz16">¥</small>1.50</b><div class="fz12">【使用期限】<br>2017.09.20至2017.12.5</div></div><div class="coupon-bd"><div class="fz12 c9">券号：70000503249136</div><div class="fz12 c9">规则： 消费需满25元</div></div><a href="javascript:;" class="coupon-ft">已经过期</a></div><div class="coupon"><div class="coupon-hd"><b><small class="fz16">¥</small>100.00</b><div class="fz12">【使用期限】<br>2017.09.20至2017.12.5</div></div><div class="coupon-bd"><div class="fz12 c9">券号：70000503249136</div><div class="fz12 c9">规则： 消费需满2000元</div></div><a href="javascript:;" class="coupon-ft">已经过期</a></div><div class="coupon"><div class="coupon-hd"><b><small class="fz16">¥</small>150.00</b><div class="fz12">【使用期限】<br>2017.09.20至2017.12.5</div></div><div class="coupon-bd"><div class="fz12 c9">券号：70000503249136</div><div class="fz12 c9">规则： 消费需满2500元</div></div><a href="javascript:;" class="coupon-ft">已经过期</a></div><div class="coupon"><div class="coupon-hd"><b><small class="fz16">¥</small>100.00</b><div class="fz12">【使用期限】<br>2017.09.20至2017.12.5</div></div><div class="coupon-bd"><div class="fz12 c9">券号：70000503249136</div><div class="fz12 c9">规则： 消费需满2000元</div></div><a href="javascript:;" class="coupon-ft">已经过期</a></div><div class="coupon"><div class="coupon-hd"><b><small class="fz16">¥</small>88.00</b><div class="fz12">【使用期限】<br>2017.09.20至2017.12.5</div></div><div class="coupon-bd"><div class="fz12 c9">券号：70000503249136</div><div class="fz12 c9">规则： 消费需满890元</div></div><a href="javascript:;" class="coupon-ft">已经过期</a></div><div class="coupon"><div class="coupon-hd"><b><small class="fz16">¥</small>2.00</b><div class="fz12">【使用期限】<br>2017.09.20至2017.12.5</div></div><div class="coupon-bd"><div class="fz12 c9">券号：70000503249136</div><div class="fz12 c9">规则： 消费需满5元</div></div><a href="javascript:;" class="coupon-ft">已经过期</a></div><div class="coupon"><div class="coupon-hd"><b><small class="fz16">¥</small>1.00</b><div class="fz12">【使用期限】<br>2017.09.20至2017.12.5</div></div><div class="coupon-bd"><div class="fz12 c9">券号：70000503249136</div><div class="fz12 c9">规则： 消费需满2元</div></div><a href="javascript:;" class="coupon-ft">已经过期</a></div><div class="coupon"><div class="coupon-hd"><b><small class="fz16">¥</small>99999.00</b><div class="fz12">【使用期限】<br>2017.09.20至2017.12.5</div></div><div class="coupon-bd"><div class="fz12 c9">券号：70000503249136</div><div class="fz12 c9">规则： 消费需满100000元</div></div><a href="javascript:;" class="coupon-ft">已经过期</a></div>
							</div>
							<div class="page text-right clearfix">
								<a class="disabled">上一页</a>
								<a class="select">1</a>
								<a href="">2</a>
								<a href="">3</a>
								<a class="" href="">下一页</a>
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
	<!-- 底部信息 -->
	<div class="footer">
		<div class="footer-tags">
			<div class="tags-box inner">
				<div class="tag-div">
					<img src="${path}/static/images/icons/footer_1.gif" alt="厂家直供">
				</div>
				<div class="tag-div">
					<img src="${path}/static/images/icons/footer_2.gif" alt="一件代发">
				</div>
				<div class="tag-div">
					<img src="${path}/static/images/icons/footer_3.gif" alt="美工活动支持">
				</div>
				<div class="tag-div">
					<img src="${path}/static/images/icons/footer_4.gif" alt="信誉认证">
				</div>
			</div>
		</div>
		<div class="footer-links inner">
			<dl>
				<dt>U袋网</dt>
				<a href="temp_article/article10"><dd>企业简介</dd></a>
				<a href="temp_article/article11"><dd>加入U袋</dd></a>
				<a href="temp_article/article12"><dd>隐私说明</dd></a>
			</dl>
			<dl>
				<dt>服务中心</dt>
				<a href="temp_article/article1"><dd>售后服务</dd></a>
				<a href="temp_article/article2"><dd>配送服务</dd></a>
				<a href="temp_article/article3"><dd>用户协议</dd></a>
				<a href="temp_article/article4"><dd>常见问题</dd></a>
			</dl>
			<dl>
				<dt>新手上路</dt>
				<a href="temp_article/article5"><dd>如何成为代理商</dd></a>
				<a href="temp_article/article6"><dd>代销商上架教程</dd></a>
				<a href="temp_article/article7"><dd>分销商常见问题</dd></a>
				<a href="temp_article/article8"><dd>付款账户</dd></a>
			</dl>
		</div>
		<div class="copy-box clearfix">
			<ul class="copy-links">
				<a href="agent_level"><li>网店代销</li></a>
				<a href="class_room"><li>U袋学堂</li></a>
				<a href="about"><li>联系我们</li></a>
				<a href="temp_article/article10"><li>企业简介</li></a>
				<a href="temp_article/article5"><li>新手上路</li></a>
			</ul>
			<!-- 版权 -->
			<p class="copyright">
				© 2005-2017 U袋网 版权所有，并保留所有权利<br>
				ICP备案证书号：闽ICP备16015525号-2&nbsp;&nbsp;&nbsp;&nbsp;福建省宁德市福鼎市南下村小区（锦昌阁）1栋1梯602室&nbsp;&nbsp;&nbsp;&nbsp;Tel: 18650406668&nbsp;&nbsp;&nbsp;&nbsp;E-mail: 18650406668@qq.com
			</p>
		</div>
	</div>
</body>
</html>