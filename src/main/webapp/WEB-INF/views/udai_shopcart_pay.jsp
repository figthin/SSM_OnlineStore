<%@page pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<%@include file="_head.jsp"%>
<script type="text/javascript">
	$(function () {
		$(".btn").click(function () {
            var addressId = $(".addr-radio").children(".active").children(":first").val();
            if (addressId == null){
            	alert("请选择收货地址！");
            	return false;
			}
            var products = $("input[name=productId]");
            var url = "${path}/createOrder?addressId="+addressId+"&";
            products.each(function () {
                url += "cartId="+this.value+"&";
            });
            location = url;
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
				<a href="temp_article/udai_article4">帮助中心</a>
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
				<div class="title">购物车</div>
			</div>
		</div>
	</div>
	<div class="content clearfix bgf5">
		<section class="user-center inner clearfix">
			<div class="user-content__box clearfix bgf">
				<div class="title">购物车-确认支付 </div>
				<div class="shop-title">收货地址</div>
				<form class="shopcart-form__box">
					<div class="addr-radio">
						<c:forEach items="${requestScope.address}" var="address">
							<div class="radio-line radio-box <c:if test="${address.is_default == 1}">active</c:if>">
                                <input type="hidden" value="${address.address_id}">
								<a href="" class="default">设为默认地址</a>
                                <label class="radio-label ep" title="${address.address_detail}（${address.name} 收） ${address.tel}">
                                    <input <c:if test="${address.is_default == 1}">checked</c:if> name="addr" value="2" autocomplete="off" type="radio"><i class="iconfont icon-radio"></i>
                                        ${address.address_detail}
                                    （${address.name} 收） ${address.tel}
                                </label>
                                <a href="address_edit" class="edit">修改</a>
							</div>
						</c:forEach>
					</div>
					<div class="add_addr"><a href="address">添加新地址</a></div>
					<div class="shop-title">确认订单</div>
					<div class="shop-order__detail">
						<table class="table">
							<thead>
								<tr>
									<th width="120"></th>
									<th width="300">商品信息</th>
									<th width="150">单价</th>
									<th width="200">数量</th>
									<th width="200">运费</th>
									<th width="80">总价</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${requestScope.cartList}" var="cart">
									<tr>
                                        <input type="hidden" name="productId" value="${cart.cartId}">
										<th scope="row"><a href="item_show"><div class="img"><img src="${path}/${cart.product[0].url}" alt="" class="cover"></div></a></th>
										<td>
											<div class="name ep3">${cart.product[0].name}</div>
											<div class="type c9">颜色分类：${cart.color}  尺码：${cart.size}</div>
										</td>
										<td>¥${cart.product[0].price}</td>
										<td>${cart.amount}</td>
										<td>¥${cart.product[0].freight}</td>
										<td>¥${cart.totalPrice}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="shop-cart__info clearfix">
						<div class="pull-left text-left">
							<div class="info-line text-nowrap">购买时间：<span class="c6">2017年09月14日 17:31:05</span></div>
							<div class="info-line text-nowrap">交易类型：<span class="c6">担保交易</span></div>
							<div class="info-line text-nowrap">交易号：<span class="c6">1001001830267490496</span></div>
						</div>
						<div class="pull-right text-right">
							<div class="form-group">
								<label for="coupon" class="control-label">优惠券使用：</label>
								<select id="coupon" >
									<option value="-1" selected>- 请选择可使用的优惠券 -</option>
									<option value="1">【满￥20.0元减￥2.0】</option>
									<option value="2">【满￥30.0元减￥2.0】</option>
									<option value="3">【满￥25.0元减￥1.0】</option>
									<option value="4">【满￥10.0元减￥1.5】</option>
									<option value="5">【满￥15.0元减￥1.5】</option>
									<option value="6">【满￥20.0元减￥1.0】</option>
								</select>
							</div>
							<script>
								$('#coupon').bind('change',function() {
									console.log($(this).val());
								})
							</script>
<%--							<div class="info-line">优惠活动：<span class="c6">八折</span></div>--%>
<%--							<div class="info-line">运费：<span class="c6">¥0.00</span></div>--%>
							<div class="info-line"><span class="favour-value"></span>合计：<b class="fz18 cr">¥${requestScope.total.totalPrice}</b></div>
<%--							<div class="info-line fz12 c9">（可获 <span class="c6">20</span> 积分）</div>--%>
						</div>
					</div>
					<div class="shop-title">确认订单</div>
					<div class="pay-mode__box">
						<div class="radio-line radio-box">
							<label class="radio-label ep">
								<input name="pay-mode" value="1" autocomplete="off" type="radio"><i class="iconfont icon-radio"></i>
								<span class="fz16">余额支付</span><span class="fz14">（可用余额：¥88.0）</span>
							</label>
							<div class="pay-value">支付<b class="fz16 cr">${requestScope.total.totalPrice}</b>元</div>
						</div>
						<div class="radio-line radio-box">
							<label class="radio-label ep">
								<input name="pay-mode" value="2" autocomplete="off" type="radio"><i class="iconfont icon-radio"></i>
								<img src="${path}/static/images/icons/alipay.png" alt="支付宝支付">
							</label>
							<div class="pay-value">支付<b class="fz16 cr">${requestScope.total.totalPrice}</b>元</div>
						</div>
						<div class="radio-line radio-box">
							<label class="radio-label ep">
								<input name="pay-mode" value="3" autocomplete="off" type="radio"><i class="iconfont icon-radio"></i>
								<img src="${path}/static/images/icons/paywechat.png" alt="微信支付">
							</label>
							<div class="pay-value">支付<b class="fz16 cr">${requestScope.total.totalPrice}</b>元</div>
						</div>
					</div>
					<div class="user-form-group shopcart-submit">
						<button type="button" class="btn">确认下单</button>
					</div>
					<script>
						$(document).ready(function(){
							$(this).on('change','input',function() {
								$(this).parents('.radio-box').addClass('active').siblings().removeClass('active');
							})
						});
					</script>
				</form>
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