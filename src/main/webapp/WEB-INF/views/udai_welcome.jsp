<%@page contentType="text/html; utf-8" pageEncoding="UTF-8"%>
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
					<a href="${path}/${path}/logout"><span class="cr">退出登录</span></a>
				</c:if>
				<c:if test="${sessionScope.user == null}">
					<a href="${path}/${path}/login"><span class="cr">登录</span></a>
					<a href="${path}/${path}/register">注册</a>
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
					<a href="${path}/order"><dd>我的订单</dd></a>
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
				<div class="user-center__info bgf">
					<div class="pull-left clearfix">
						<div class="port b-r50 pull-left">
							<img src="${path}/static/images/icons/default_avt.png" alt="用户名" class="cover b-r50">
							<a href="${path}/setting" class="edit"><i class="iconfont icon-edit"></i></a>
						</div>
						<p class="name text-nowrap">您好，${requestScope.user.user_name}！</p>
						<p class="money text-nowrap">余额：¥${requestScope.user.balance}</p>
						<c:if test="${requestScope.user.is_member == 0}">
							<p class="level text-nowrap">身份：普通会员 <a href="${path}/agent_level">提升</a></p>
						</c:if>
						<c:if test="${requestScope.user.is_member == 1}">
							<p class="level text-nowrap">身份：银牌会员 <a href="${path}/agent_level">提升</a></p>
						</c:if>
						<c:if test="${requestScope.user.is_member == 2}">
							<p class="level text-nowrap">身份：超级会员 <a href="${path}/agent_level">提升</a></p>
						</c:if>
						<c:if test="${requestScope.user.is_member == 3}">
							<p class="level text-nowrap">身份：VIP会员 <a href="${path}/agent_level">续费</a></p>
						</c:if>
					</div>
					<div class="pull-right user-nav">
						<a href="${path}/order" class="user-nav__but">
							<i class="iconfont icon-rmb fz40 cr"></i>
							<div class="c6">待支付 <span class="cr">${requestScope.status0.size()}</span></div>
						</a>
						<a href="${path}/order" class="user-nav__but">
							<i class="iconfont icon-eval fz40 cr"></i>
							<div class="c6">待评价 <span class="c3">${requestScope.status2.size()}</span></div>
						</a>
						<a href="${path}/collection" class="user-nav__but">
							<i class="iconfont icon-star fz40 cr"></i>
							<div class="c6">收藏 <span class="c3">0</span></div>
						</a>
						<a href="${path}/coupon" class="user-nav__but">
							<i class="iconfont icon-quan fz40 cr"></i>
							<div class="c6">优惠券 <span class="cr">${requestScope.coupons.size()}</span></div>
						</a>
						<a href="${path}/integral" class="user-nav__but">
							<i class="iconfont icon-jifen fz40 cr"></i>
							<div class="c6">积分 <span class="cr">${requestScope.user.integral}</span></div>
						</a>
						<a href="${path}/message" class="user-nav__but">
							<i class="iconfont icon-xiaoxi fz40 cr"></i>
							<div class="c6">消息 <span class="cr">${requestScope.messages.size()}</span></div>
						</a>
					</div>
				</div>
				<div class="order-list__div bgf">
					<div class="user-title">
						我的订单<span class="c6">（显示最新三条）</span>
						<a href="${path}/order" class="pull-right">查看所有订单></a>
					</div>
					<div class="order-panel">
						<ul class="nav user-nav__title" role="tablist">
							<li role="presentation" class="nav-item active"><a href="${path}/#all" aria-controls="all" role="tab" data-toggle="tab">最近订单</a></li>
<%--							<li role="presentation" class="nav-item "><a href="${path}/#pay" aria-controls="pay" role="tab" data-toggle="tab">待付款 <span class="cr">${requestScope.status0.size()}</span></a></li>--%>
<%--							<li role="presentation" class="nav-item "><a href="${path}/#emit" aria-controls="emit" role="tab" data-toggle="tab">待发货 <span class="cr">${requestScope.status1.size()}</span></a></li>--%>
<%--							<li role="presentation" class="nav-item "><a href="${path}/#take" aria-controls="take" role="tab" data-toggle="tab">待收货 <span class="cr">${requestScope.status1.size()}</span></a></li>--%>
<%--							<li role="presentation" class="nav-item "><a href="${path}/#eval" aria-controls="eval" role="tab" data-toggle="tab">待评价 <span class="cr">${requestScope.status2.size()}</span></a></li>--%>
						</ul>

						<div class="tab-content">
							<div role="tabpanel" class="tab-pane fade in active" id="all">
								<table class="table text-center">
									<tr>
										<th width="380">订单信息</th>
										<th width="85">收货地址</th>
<%--										<th width="85">数量</th>--%>
<%--										<th width="120">实付款</th>--%>
										<th width="120">交易状态</th>
										<th width="120">交易操作</th>
									</tr>
									<c:forEach items="${requestScope.latestOrders}" var="order" begin="1" end="3">
										<tr class="order-item">
											<td>
												<label>
													<div class="num">
														<!-- <input type="checkbox"> -->
														下单时间：${order.time_create}<br>
														订单号: ${order.order_id}
													</div>
													<%--<div class="card">
														<div class="img"><img src="${path}/${order}" alt="" class="cover"></div>
														<div class="name ep2">纯色圆领短袖T恤活动衫弹力柔软纯色圆领短袖T恤</div>
														<div class="format">颜色分类：深棕色  尺码：均码</div>
														<div class="favour">使用优惠券：优惠¥2.00</div>
													</div>--%>
												</label>
											</td>
											<td>${order.address.address_detail}</td>
<%--											<td>1</td>--%>
<%--											<td>$1000<br><span class="fz12 c6 text-nowrap">(含运费: ¥0.00)</span></td>--%>
											<c:if test="${order.order_status == 0}">
												<td class="state">
													<a class="but c6">等待付款</a>
													<a href="${path}/order_detail?orderId=${order.order_id}" class="but c9">订单详情</a>
												</td>
												<td class="order">
													<div class="del"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></div>
													<a href="shopcart_pay" class="but but-primary">立即付款</a>
													<!-- <a href="" class="but but-link">评价</a> -->
													<a href="" class="but c3">取消订单</a>
												</td>
											</c:if>
											<c:if test="${order.order_status == 1}">
												<td class="state">
													<a class="but c6">等待收货</a>
													<a href="udai_mail_query" class="but cr">查看物流</a>
													<a href="udai_order_detail" class="but c9">订单详情</a>
												</td>
												<td class="order">
													<div class="del"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></div>
													<a href="udai_order_receipted" class="but but-primary">确认收货</a>
													<!-- <a href="" class="but but-link">评价</a> -->
													<a href="udai_apply_return" class="but c3">退款/退货</a>
												</td>
											</c:if>
											<c:if test="${order.order_status == 2}">
												<td class="state">
													<a class="but c6">交易成功</a>
													<a href="udai_mail_query" class="but cr">查看物流</a>
													<a href="udai_order_detail" class="but c9">订单详情</a>
												</td>
												<td class="order">
													<div class="del"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></div>
													<a href="" class="but but-link">评价</a>
													<a href="" class="but c3">取消订单</a>
												</td>
											</c:if>
											<%--<td class="state">
												<a class="but c6">等待付款</a>
												<a href="${path}/" class="but c9">订单详情</a>
											</td>
											<td class="order">
												<a href="${path}/shopcart_pay" class="but but-primary">立即付款</a>
												<!-- <a href="${path}/" class="but but-link">评价</a> -->
												<a href="${path}/" class="but c3">取消订单</a>
											</td>--%>
										</tr>
									</c:forEach>
								</table>
							</div>
							<div role="tabpanel" class="tab-pane fade" id="pay">
								<table class="table text-center">
                                    <tr>
                                        <th width="380">订单信息</th>
                                        <th width="85">收货地址</th>
                                        <%--<th width="85">数量</th>--%>
                                        <%--<th width="120">实付款</th>--%>
                                        <th width="120">交易状态</th>
                                        <th width="120">交易操作</th>
                                    </tr>
                                    <c:forEach items="${requestScope.status0}" begin="1" end="3" var="order">
                                        <tr class="order-item">
                                            <td>
                                                <label>
                                                    <div class="num">
                                                        <!-- <input type="checkbox"> -->
                                                        下单时间：${order.time_status}<br>
                                                        订单号: ${order.order_id}
                                                    </div>
                                                        <%--<div class="card">
                                                            <div class="img"><img src="${path}/${order}" alt="" class="cover"></div>
                                                            <div class="name ep2">纯色圆领短袖T恤活动衫弹力柔软纯色圆领短袖T恤</div>
                                                            <div class="format">颜色分类：深棕色  尺码：均码</div>
                                                            <div class="favour">使用优惠券：优惠¥2.00</div>
                                                        </div>--%>
                                                </label>
                                            </td>
                                            <td>${order.address.address_detail}</td>
                                                <%--											<td>1</td>--%>
                                                <%--											<td>$1000<br><span class="fz12 c6 text-nowrap">(含运费: ¥0.00)</span></td>--%>
                                            <c:if test="${order.order_status == 0}">
                                                <td class="state">
                                                    <a class="but c6">等待付款</a>
                                                    <a href="${path}/order_detail?orderId=${order.order_id}" class="but c9">订单详情</a>
                                                </td>
                                                <td class="order">
                                                    <div class="del"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></div>
                                                    <a href="shopcart_pay" class="but but-primary">立即付款</a>
                                                    <!-- <a href="" class="but but-link">评价</a> -->
                                                    <a href="" class="but c3">取消订单</a>
                                                </td>
                                            </c:if>
                                            <c:if test="${order.order_status == 1}">
                                                <td class="state">
                                                    <a class="but c6">等待收货</a>
                                                    <a href="udai_mail_query" class="but cr">查看物流</a>
                                                    <a href="udai_order_detail" class="but c9">订单详情</a>
                                                </td>
                                                <td class="order">
                                                    <div class="del"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></div>
                                                    <a href="udai_order_receipted" class="but but-primary">确认收货</a>
                                                    <!-- <a href="" class="but but-link">评价</a> -->
                                                    <a href="udai_apply_return" class="but c3">退款/退货</a>
                                                </td>
                                            </c:if>
                                            <c:if test="${order.order_status == 2}">
                                                <td class="state">
                                                    <a class="but c6">交易成功</a>
                                                    <a href="udai_mail_query" class="but cr">查看物流</a>
                                                    <a href="udai_order_detail" class="but c9">订单详情</a>
                                                </td>
                                                <td class="order">
                                                    <div class="del"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></div>
                                                    <a href="" class="but but-link">评价</a>
                                                    <a href="" class="but c3">取消订单</a>
                                                </td>
                                            </c:if>
                                                <%--<td class="state">
                                                    <a class="but c6">等待付款</a>
                                                    <a href="${path}/" class="but c9">订单详情</a>
                                                </td>
                                                <td class="order">
                                                    <a href="${path}/shopcart_pay" class="but but-primary">立即付款</a>
                                                    <!-- <a href="${path}/" class="but but-link">评价</a> -->
                                                    <a href="${path}/" class="but c3">取消订单</a>
                                                </td>--%>
                                        </tr>
                                    </c:forEach>
								</table>
							</div>
							<div role="tabpanel" class="tab-pane fade" id="emit">
                                <table class="table text-center">
                                    <tr>
                                        <th width="380">订单信息</th>
                                        <th width="85">收货地址</th>
                                        <%--<th width="85">数量</th>--%>
                                        <%--<th width="120">实付款</th>--%>
                                        <th width="120">交易状态</th>
                                        <th width="120">交易操作</th>
                                    </tr>
                                    <c:forEach items="${requestScope.status1}" begin="1" end="3" var="order">
                                        <tr class="order-item">
                                            <td>
                                                <label>
                                                    <div class="num">
                                                        <!-- <input type="checkbox"> -->
                                                        下单时间：${order.time_create}<br>
                                                        订单号: ${order.order_id}
                                                    </div>
                                                        <%--<div class="card">
                                                            <div class="img"><img src="${path}/${order}" alt="" class="cover"></div>
                                                            <div class="name ep2">纯色圆领短袖T恤活动衫弹力柔软纯色圆领短袖T恤</div>
                                                            <div class="format">颜色分类：深棕色  尺码：均码</div>
                                                            <div class="favour">使用优惠券：优惠¥2.00</div>
                                                        </div>--%>
                                                </label>
                                            </td>
                                            <td>${order.address.address_detail}</td>
                                                <%--											<td>1</td>--%>
                                                <%--											<td>$1000<br><span class="fz12 c6 text-nowrap">(含运费: ¥0.00)</span></td>--%>
                                            <c:if test="${order.order_status == 0}">
                                                <td class="state">
                                                    <a class="but c6">等待付款</a>
                                                    <a href="${path}/order_detail?orderId=${order.order_id}" class="but c9">订单详情</a>
                                                </td>
                                                <td class="order">
                                                    <div class="del"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></div>
                                                    <a href="shopcart_pay" class="but but-primary">立即付款</a>
                                                    <!-- <a href="" class="but but-link">评价</a> -->
                                                    <a href="" class="but c3">取消订单</a>
                                                </td>
                                            </c:if>
                                            <c:if test="${order.order_status == 1}">
                                                <td class="state">
                                                    <a class="but c6">等待收货</a>
                                                    <a href="udai_mail_query" class="but cr">查看物流</a>
                                                    <a href="udai_order_detail" class="but c9">订单详情</a>
                                                </td>
                                                <td class="order">
                                                    <div class="del"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></div>
                                                    <a href="udai_order_receipted" class="but but-primary">确认收货</a>
                                                    <!-- <a href="" class="but but-link">评价</a> -->
                                                    <a href="udai_apply_return" class="but c3">退款/退货</a>
                                                </td>
                                            </c:if>
                                            <c:if test="${order.order_status == 2}">
                                                <td class="state">
                                                    <a class="but c6">交易成功</a>
                                                    <a href="udai_mail_query" class="but cr">查看物流</a>
                                                    <a href="udai_order_detail" class="but c9">订单详情</a>
                                                </td>
                                                <td class="order">
                                                    <div class="del"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></div>
                                                    <a href="" class="but but-link">评价</a>
                                                    <a href="" class="but c3">取消订单</a>
                                                </td>
                                            </c:if>
                                                <%--<td class="state">
                                                    <a class="but c6">等待付款</a>
                                                    <a href="${path}/" class="but c9">订单详情</a>
                                                </td>
                                                <td class="order">
                                                    <a href="${path}/shopcart_pay" class="but but-primary">立即付款</a>
                                                    <!-- <a href="${path}/" class="but but-link">评价</a> -->
                                                    <a href="${path}/" class="but c3">取消订单</a>
                                                </td>--%>
                                        </tr>
                                    </c:forEach>
                                </table>
							</div>
							<div role="tabpanel" class="tab-pane fade" id="take">
                                <table class="table text-center">
                                    <tr>
                                        <th width="380">订单信息</th>
                                        <th width="85">收货地址</th>
                                        <%--<th width="85">数量</th>--%>
                                        <%--<th width="120">实付款</th>--%>
                                        <th width="120">交易状态</th>
                                        <th width="120">交易操作</th>
                                    </tr>
                                    <c:forEach items="${requestScope.status1}" begin="1" end="3" var="order">
                                        <tr class="order-item">
                                            <td>
                                                <label>
                                                    <div class="num">
                                                        <!-- <input type="checkbox"> -->
                                                        下单时间：${order.time_create}<br>
                                                        订单号: ${order.order_id}
                                                    </div>
                                                        <%--<div class="card">
                                                            <div class="img"><img src="${path}/${order}" alt="" class="cover"></div>
                                                            <div class="name ep2">纯色圆领短袖T恤活动衫弹力柔软纯色圆领短袖T恤</div>
                                                            <div class="format">颜色分类：深棕色  尺码：均码</div>
                                                            <div class="favour">使用优惠券：优惠¥2.00</div>
                                                        </div>--%>
                                                </label>
                                            </td>
                                            <td>${order.address.address_detail}</td>
                                                <%--											<td>1</td>--%>
                                                <%--											<td>$1000<br><span class="fz12 c6 text-nowrap">(含运费: ¥0.00)</span></td>--%>
                                            <c:if test="${order.order_status == 0}">
                                                <td class="state">
                                                    <a class="but c6">等待付款</a>
                                                    <a href="${path}/order_detail?orderId=${order.order_id}" class="but c9">订单详情</a>
                                                </td>
                                                <td class="order">
                                                    <div class="del"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></div>
                                                    <a href="shopcart_pay" class="but but-primary">立即付款</a>
                                                    <!-- <a href="" class="but but-link">评价</a> -->
                                                    <a href="" class="but c3">取消订单</a>
                                                </td>
                                            </c:if>
                                            <c:if test="${order.order_status == 1}">
                                                <td class="state">
                                                    <a class="but c6">等待收货</a>
                                                    <a href="udai_mail_query" class="but cr">查看物流</a>
                                                    <a href="udai_order_detail" class="but c9">订单详情</a>
                                                </td>
                                                <td class="order">
                                                    <div class="del"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></div>
                                                    <a href="udai_order_receipted" class="but but-primary">确认收货</a>
                                                    <!-- <a href="" class="but but-link">评价</a> -->
                                                    <a href="udai_apply_return" class="but c3">退款/退货</a>
                                                </td>
                                            </c:if>
                                            <c:if test="${order.order_status == 2}">
                                                <td class="state">
                                                    <a class="but c6">交易成功</a>
                                                    <a href="udai_mail_query" class="but cr">查看物流</a>
                                                    <a href="udai_order_detail" class="but c9">订单详情</a>
                                                </td>
                                                <td class="order">
                                                    <div class="del"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></div>
                                                    <a href="" class="but but-link">评价</a>
                                                    <a href="" class="but c3">取消订单</a>
                                                </td>
                                            </c:if>
                                                <%--<td class="state">
                                                    <a class="but c6">等待付款</a>
                                                    <a href="${path}/" class="but c9">订单详情</a>
                                                </td>
                                                <td class="order">
                                                    <a href="${path}/shopcart_pay" class="but but-primary">立即付款</a>
                                                    <!-- <a href="${path}/" class="but but-link">评价</a> -->
                                                    <a href="${path}/" class="but c3">取消订单</a>
                                                </td>--%>
                                        </tr>
                                    </c:forEach>
                                </table>
							</div>
							<div role="tabpanel" class="tab-pane fade" id="eval">
                                <table class="table text-center">
                                    <tr>
                                        <th width="380">订单信息</th>
                                        <th width="85">收货地址</th>
                                        <%--<th width="85">数量</th>--%>
                                        <%--<th width="120">实付款</th>--%>
                                        <th width="120">交易状态</th>
                                        <th width="120">交易操作</th>
                                    </tr>
                                    <c:forEach items="${requestScope.status2}" begin="1" end="3" var="order">
                                        <tr class="order-item">
                                            <td>
                                                <label>
                                                    <div class="num">
                                                        <!-- <input type="checkbox"> -->
                                                        下单时间：${order.time_create}<br>
                                                        订单号: ${order.order_id}
                                                    </div>
                                                        <%--<div class="card">
                                                            <div class="img"><img src="${path}/${order}" alt="" class="cover"></div>
                                                            <div class="name ep2">纯色圆领短袖T恤活动衫弹力柔软纯色圆领短袖T恤</div>
                                                            <div class="format">颜色分类：深棕色  尺码：均码</div>
                                                            <div class="favour">使用优惠券：优惠¥2.00</div>
                                                        </div>--%>
                                                </label>
                                            </td>
                                            <td>${order.address.address_detail}</td>
                                                <%--											<td>1</td>--%>
                                                <%--											<td>$1000<br><span class="fz12 c6 text-nowrap">(含运费: ¥0.00)</span></td>--%>
                                            <c:if test="${order.order_status == 0}">
                                                <td class="state">
                                                    <a class="but c6">等待付款</a>
                                                    <a href="${path}/order_detail?orderId=${order.order_id}" class="but c9">订单详情</a>
                                                </td>
                                                <td class="order">
                                                    <div class="del"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></div>
                                                    <a href="shopcart_pay" class="but but-primary">立即付款</a>
                                                    <!-- <a href="" class="but but-link">评价</a> -->
                                                    <a href="" class="but c3">取消订单</a>
                                                </td>
                                            </c:if>
                                            <c:if test="${order.order_status == 1}">
                                                <td class="state">
                                                    <a class="but c6">等待收货</a>
                                                    <a href="udai_mail_query" class="but cr">查看物流</a>
                                                    <a href="udai_order_detail" class="but c9">订单详情</a>
                                                </td>
                                                <td class="order">
                                                    <div class="del"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></div>
                                                    <a href="udai_order_receipted" class="but but-primary">确认收货</a>
                                                    <!-- <a href="" class="but but-link">评价</a> -->
                                                    <a href="udai_apply_return" class="but c3">退款/退货</a>
                                                </td>
                                            </c:if>
                                            <c:if test="${order.order_status == 2}">
                                                <td class="state">
                                                    <a class="but c6">交易成功</a>
                                                    <a href="udai_mail_query" class="but cr">查看物流</a>
                                                    <a href="udai_order_detail" class="but c9">订单详情</a>
                                                </td>
                                                <td class="order">
                                                    <div class="del"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></div>
                                                    <a href="" class="but but-link">评价</a>
                                                    <a href="" class="but c3">取消订单</a>
                                                </td>
                                            </c:if>
                                                <%--<td class="state">
                                                    <a class="but c6">等待付款</a>
                                                    <a href="${path}/" class="but c9">订单详情</a>
                                                </td>
                                                <td class="order">
                                                    <a href="${path}/shopcart_pay" class="but but-primary">立即付款</a>
                                                    <!-- <a href="${path}/" class="but but-link">评价</a> -->
                                                    <a href="${path}/" class="but c3">取消订单</a>
                                                </td>--%>
                                        </tr>
                                    </c:forEach>
                                </table>
							</div>
						</div>
					</div>
				</div>
				<div class="recommends">
					<div class="lace-title type-2">
						<span class="cr">爆款推荐</span>
					</div>
					<div class="swiper-container recommends-swiper">
						<div class="swiper-wrapper">
							<div class="swiper-slide">
								<c:forEach begin="1" end="4" items="${requestScope.hot}" var="product">
									<a class="picked-item" href="${path}/item_show?productId=${product.product_id}">
										<img src="${product.url}" alt="${product.name}" class="cover">
										<div class="look_price">￥${product.price}</div>
									</a>
								</c:forEach>
							</div>
							<div class="swiper-slide">
								<c:forEach begin="5" end="8" items="${requestScope.hot}" var="product">
									<a class="picked-item" href="${path}/item_show?productId=${product.product_id}">
										<img src="${product.url}" alt="${product.name}" class="cover">
										<div class="look_price">￥${product.price}</div>
									</a>
								</c:forEach>
							</div>
							<div class="swiper-slide">
								<c:forEach begin="9" end="12" items="${requestScope.hot}" var="product">
									<a class="picked-item" href="${path}/item_show?productId=${product.product_id}">
										<img src="${product.url}" alt="${product.name}" class="cover">
										<div class="look_price">￥${product.price}</div>
									</a>
								</c:forEach>
							</div>
						</div>
					</div>
					<script>
						$(document).ready(function(){
							var recommends = new Swiper('.recommends-swiper', {
								spaceBetween : 40,
								autoplay : 5000,
							});
						});
					</script>
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