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
				<a href="${path}/agent_level">网店代销</a>
				<a href="${path}/temp_article/article4">帮助中心</a>
			</div>
			<div class="pull-right">
				<c:if test="${sessionScope.user != null}">
					<a href="${path}/logout"><span class="cr">退出登录</span></a>
				</c:if>
				<c:if test="${sessionScope.user == null}">
					<a href="${path}/login"><span class="cr">登录</span></a>
					<a href="${path}/register">注册</a>
				</c:if>
				<a href="${path}/welcome">我的U袋</a>
				<a href="${path}/order">我的订单</a>
				<a href="${path}/integral">积分平台</a>
			</div>
		</div>
	</div>
	<!-- 顶部标题 -->
	<div class="bgf5 clearfix">
		<div class="top-user">
			<div class="inner">
				<a class="logo" href="${path}/index"><img src="${path}/static/images/icons/logo.jpg" alt="U袋网" class="cover"></a>
				<div class="title">个人中心</div>
			</div>
		</div>
	</div>
	<div class="content clearfix bgf5">
		<section class="user-center inner clearfix">
			<div class="pull-left bgf">
				<a href="${path}/welcome" class="title">U袋欢迎页</a>
				<dl class="user-center__nav">
					<dt>帐户信息</dt>
					<a href="${path}/setting"><dd>个人资料</dd></a>
					<a href="${path}/treasurer"><dd>资金管理</dd></a>
					<a href="${path}/integral"><dd>积分平台</dd></a>
					<a href="${path}/address"><dd>收货地址</dd></a>
					<a href="${path}/coupon"><dd>我的优惠券</dd></a>
					<a href="${path}/paypwd_modify"><dd>修改支付密码</dd></a>
					<a href="${path}/pwd_modify"><dd>修改登录密码</dd></a>
				</dl>
				<dl class="user-center__nav">
					<dt>订单中心</dt>
					<a href="${path}/order"><dd class="active">我的订单</dd></a>
					<a href="${path}/collection"><dd>我的收藏</dd></a>
					<a href="${path}/refund"><dd>退款/退货</dd></a>
				</dl>
				<dl class="user-center__nav">
					<dt>服务中心</dt>
					<a href="${path}/mail_query"><dd>物流查询</dd></a>
					<a href="${path}/"><dd>数据自助下载</dd></a>
					<a href="${path}/temp_article/article1"><dd>售后服务</dd></a>
					<a href="${path}/temp_article/article2"><dd>配送服务</dd></a>
					<a href="${path}/temp_article/article3"><dd>用户协议</dd></a>
					<a href="${path}/temp_article/article4"><dd>常见问题</dd></a>
				</dl>
				<dl class="user-center__nav">
					<dt>新手上路</dt>
					<a href="${path}/temp_article/article5"><dd>如何成为代理商</dd></a>
					<a href="${path}/temp_article/article6"><dd>代销商上架教程</dd></a>
					<a href="${path}/temp_article/article7"><dd>分销商常见问题</dd></a>
					<a href="${path}/temp_article/article8"><dd>付款账户</dd></a>
				</dl>
				<dl class="user-center__nav">
					<dt>U袋网</dt>
					<a href="${path}/temp_article/article10"><dd>企业简介</dd></a>
					<a href="${path}/temp_article/article11"><dd>加入U袋</dd></a>
					<a href="${path}/temp_article/article12"><dd>隐私说明</dd></a>
				</dl>
			</div>
			<div class="pull-right">
				<div class="user-content__box clearfix bgf">
					<div class="title">订单中心-订单 ${requestScope.orderDetail.order_id}</div>
					<div class="order-info__box">
						<div class="order-addr">收货地址：<span class="c6">${requestScope.orderDetail.address.name},${requestScope.orderDetail.address.tel},${requestScope.orderDetail.address.address_detail}</span></div>
						<div class="order-info">
							订单信息
							<table>
								<tr>
									<td>订单编号：${requestScope.orderDetail.order_id}</td>
<%--									<td>支付宝交易号：20175215464616164616</td>--%>
									<td>创建时间：${requestScope.orderDetail.time_create}</td>
								</tr>
								<tr>
									<td>付款时间：${requestScope.orderDetail.time_pay}</td>
									<td>成交时间：${requestScope.orderDetail.time_finish}</td>
									<td></td>
								</tr>
							</table>
						</div>
						<div class="table-thead">
							<div class="tdf3">商品</div>
							<div class="tdf1">状态</div>
							<div class="tdf1">数量</div>
							<div class="tdf1">单价</div>
<%--							<div class="tdf2">优惠</div>--%>
<%--							<div class="tdf1">总价</div>--%>
							<div class="tdf1">运费</div>
						</div>
						<div class="order-item__list">
							<c:forEach items="${requestScope.orderDetail.products}" var="product">
<%--								<h1>${product}</h1>--%>
								<div class="item">
									<div class="tdf3">
										<a href="${path}/item_show"><div class="img"><img src="${path}/${product.url}" alt="${product.name}" class="cover"></div>
											<div class="ep2 c6">${product.name}</div></a>
										<div class="attr ep">颜色分类：${product.color}  尺码：${product.product_size}</div>
									</div>
									<div class="tdf1">
										<a href="${path}/order_evaluate"><c:if test="${product.product_status == 0}">待评价</c:if></a><!-- 已确认收货 -->
										<a href="${path}/order_evaluate"><c:if test="${product.product_status == 1}">已评价</c:if></a><!-- 已确认收货 -->
									</div>
									<div class="tdf1">1</div>
									<div class="tdf1">¥${product.price}</div>
									<%--<div class="tdf2">
										<div class="ep2">活动${product.discount * 10}折优惠&lt;%&ndash;<br>优惠：¥4.0&ndash;%&gt;</div>
									</div>--%>
<%--									<div class="tdf1">￥${product.price}</div>--%>
									<div class="tdf1">
										<div class="ep2">￥${product.freight}</div>
									</div>
								</div>
							</c:forEach>
						</div>
						<div class="price-total">
<%--							<div class="fz12 c9">使用优惠券【满￥20.0减￥2.0】优惠￥2.0元<br>快递运费 ￥0.0</div>--%>
							<div class="fz18 c6">实付款：<b class="cr">￥${requestScope.orderDetail.totalPrice}</b></div>
<%--							<div class="fz12 c9">（本单可获 <span class="c6">380</span> 积分）</div>--%>
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
				<a href="${path}/welcome" class="r-item-hd">
					<i class="iconfont icon-user" data-badge="0"></i>
					<div class="r-tip__box"><span class="r-tip-text">用户中心</span></div>
				</a>
			</li>
			<li class="r-toolbar-item">
				<a href="${path}/shopcart" class="r-item-hd">
					<i class="iconfont icon-cart"></i>
					<div class="r-tip__box"><span class="r-tip-text">购物车</span></div>
				</a>
			</li>
			<li class="r-toolbar-item">
				<a href="${path}/collection" class="r-item-hd">
					<i class="iconfont icon-aixin"></i>
					<div class="r-tip__box"><span class="r-tip-text">我的收藏</span></div>
				</a>
			</li>
			<li class="r-toolbar-item">
				<a href="${path}/" class="r-item-hd">
					<i class="iconfont icon-liaotian"></i>
					<div class="r-tip__box"><span class="r-tip-text">联系客服</span></div>
				</a>
			</li>
			<li class="r-toolbar-item">
				<a href="${path}/issues" class="r-item-hd">
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