<%@page pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
	<meta charset="UTF-8">
	<link rel="shortcut icon" href="${path}/favicon.ico">
	<link rel="stylesheet" href="${path}/static/css/iconfont.css">
	<link rel="stylesheet" href="${path}/static/css/global.css">
	<link rel="stylesheet" href="${path}/static/css/bootstrap.min.css">
	<link rel="stylesheet" href="${path}/static/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="${path}/static/css/swiper.min.css">
	<link rel="stylesheet" href="${path}/static/css/styles.css">
	<script src="${path}/static/js/jquery.1.12.4.min.js" charset="UTF-8"></script>
	<script src="${path}/static/js/bootstrap.min.js" charset="UTF-8"></script>
	<script src="${path}/static/js/swiper.min.js" charset="UTF-8"></script>
	<script src="${path}/static/js/global.js" charset="UTF-8"></script>
	<script src="${path}/static/js/jquery.DJMask.2.1.1.js" charset="UTF-8"></script>
	<title>U袋网</title>
<%--	<script src = "${path}/static/js/jquery-1.8.3.min.js" type="text/javascript"></script>--%>
	<script type="text/javascript">
		function queryTotal() {
			var inputs = $(".check-individual:checked");
			var url = "${path}/cartTotal?";
			inputs.each(function () {
				url += "cartId="+this.value+"&";
				// console.log(this);
			});
			$.ajax({
				url:url,
				type:"get",
				success:function (res) {
					/*if (res.totalAmount == null) {
						res.totalAmount = 0;
					}
					if (res.totalPrice == null) {
						res.totalPrice = 0;
					}*/
					$("#alreadyCheckedProduct").text(res.totalAmount);
					$(".fz24").text(res.totalPrice);
				}
			});
		}
		function updateAmount(e){
			var tr = $(e).parent().parent().parent();
			tr.children(":first").children().children()[0].checked = true;
			var cartId = tr.children(":first").children().children()[0].value;
			var inputs = tr.children(":last").children("input");
			var productId = inputs[0].value;
			var color = inputs[1].value;
			var size = inputs[2].value;
			var input = $(e).parent().children(":text");
			var action = "add";
			if ($(e).val() === "-"){
				action = "sub";
			}
			$.ajax({
				url: "${path}/updateAmount",
				type: "get",
				data: {
					cartId:cartId,
					productId:productId,
					color:color,
					size:size,
					action:action
				},
				success:function (res) {
					console.log(res);
					var amount = input.val();
					if (res.totalPrice.succ){
						if (action === "add"){
							input.val(++amount);
							tr.children(".productTotalPrice")[0].innerHTML = res.totalPrice.totalPrice
							// price =  parseFloat(price);
							// totalPrice = parseFloat(totalPrice);
							// td.text((input.val() * price).toFixed(1));
							// span.innerText = totalPrice + price;
							// inputs[4].value = totalPrice + price;
						}else{
							if (input.val() === "1"){
								alert("不能再减少了哦!")
								return false;
							}
							// price =  parseFloat(price);
							// totalPrice = parseFloat(totalPrice);
							input.val(--amount);
							tr.children(".productTotalPrice")[0].innerHTML = res.totalPrice.totalPrice
							// td.text((input.val() * price).toFixed(1));
							// span.innerText = totalPrice - price;
							<%--span.innerHTML = <fmt:formatNumber value="totalPrice - price"></fmt:formatNumber>;--%>
							// console.log();
							// inputs[4].value = totalPrice - price;
						}
					}else {
						alert("不能再减少了哦!")
						return;
					}
					queryTotal();
				}
			});
		}
		$(function () {
			$(".delete").click(function () {
				var tr = $(this).parent().parent();
				var inputs = tr.children(":last").children("input");
				var productId = inputs[0].value;
				var color = inputs[1].value;
				var size = inputs[2].value;
				$.ajax({
					url:"${path}/cart/delete",
					type:"get",
					data:{
						productId:productId,
						color:color,
						size:size
					},
					success:function (res) {
						tr.remove();
					}
				});
				return false;

			});
		});
		$(function () {
			$("#deleteAll").click(function () {
				var trs = $(".check-individual:checked").parent().parent().parent();
				if (trs.length === 0) {
					alert("请选择要删除的商品！")
					return false;
				}
				var url = "${path}/cart/deleteAll?";
				console.log(trs.length);
				var productId = [];
				var color = [];
				var size = [];
				trs.each(function () {
					var inputs = $(this).children(":last").children("input");
					productId.push(inputs[0].value)
					color.push(inputs[1].value);
					size.push(inputs[2].value);
				});
				url += "productId="+productId+"&"+"color="+color+"&"+"size="+size+"&";
				console.log(url);
				$.ajax({
					url:url,
					type:"get",
					data:{
						productId:productId,
						color:color,
						size:size
					},
					success:function (res) {
						console.log(res);
						if (res.succ){
							trs.each(function () {
								$(this).remove();
								// queryTotal();
								// $(".check-all").checked = false;
							})
						}else {
							alert("删除失败！")
						}
					}
				});
				return false;
			});
		});
		$(function () {
			$(".btn").click(function () {
				var inputs = $(".check-individual:checked");
				if (inputs.length === 0){
					alert("请选择要结算的商品！");
					return false;
				}
				var url = "${path}/shopcart_pay?";
				inputs.each(function () {
					url += "cartId="+this.value+"&";
					// console.log(this);
				});
				location = url;
			});

		});
	</script>
</head>
<body>
	<!-- 顶部tab -->
	<div class="tab-header">
		<div class="inner">
			<div class="pull-left">
				<div class="pull-left">嗨，欢迎来到<span class="cr">U袋网</span></div>
				<a href="${path}/agent_level">网店代销</a>
				<a href="${path}/temp_article/${path}/article4">帮助中心</a>
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
				<div class="title">购物车</div>
			</div>
		</div>
	</div>
	<div class="content clearfix bgf5">
		<section class="user-center inner clearfix">
			<div class="user-content__box clearfix bgf">
				<div class="title">购物车</div>
				<form class="shopcart-form__box">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th width="150">
									<label class="checked-label"><input type="checkbox" class="check-all"><i></i> 全选</label>
								</th>
								<th width="300">商品信息</th>
								<th width="150">单价</th>
								<th width="200">数量</th>
								<th width="200">小计</th>
								<th width="80">运费</th>
								<th width="80">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${requestScope.products}" var="product">
								<tr>
									<td scope="row">
										<label class="checked-label"><input class="check-individual" value="${product.cartId}" type="checkbox"><i></i>
											<div class="img"><img src=${path}/${product.children[0].url} alt=${product.children[0].name} class="cover"></div>
										</label>
									</td>
									<td>
										<div class="name ep3">${product.children[0].name}</div>
										<div class="type c9">颜色分类：${product.color}  尺码：${product.size}</div>
									</td>
									<td class="productPrice">${product.children[0].price}</td>
									<td>
										<div class="cart-num__box">
											<input type="button" class="sub" value="-" onclick="updateAmount(this)">
											<input readonly type="text" class="val" value="${product.amount}" maxlength="2">
											<input type="button" class="add" value="+" onclick="updateAmount(this)">
										</div>
									</td>
									<td class="productTotalPrice">${product.children[0].price * product.amount}</td>
									<td>${product.children[0].freight}</td>
									<td>
										<input type="hidden" value="${product.productId}"/>
										<input type="hidden" value="${product.color}"/>
										<input type="hidden" value="${product.size}"/>
										<input type="hidden" value="${product.children[0].price}"/>
										<input type="hidden" value="${requestScope.total.get('TOTAL')}"/>
										<a class="delete" href="${path}/">删除</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="user-form-group tags-box shopcart-submit pull-right">
						<button type="button" class="btn">提交订单</button>
					</div>
					<div class="checkbox shopcart-total">
						<label><input type="checkbox" class="check-all"><i></i> 全选</label>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a id="deleteAll" href="${path}/">删除</a>
						<div class="pull-right">
							已选商品 <span id="alreadyCheckedProduct"><%--${requestScope.products.size()}--%>0</span> 件
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;合计（含运费）
							<b class="cr"><span class="fz24"><%--<fmt:formatNumber value="${requestScope.total.get('TOTAL')}" type="CURRENCY"></fmt:formatNumber>--%>￥0.00</span></b>
						</div>
					</div>
					<script>
						$(document).ready(function(){
							var $item_checkboxs = $('.shopcart-form__box tbody input[type="checkbox"]'),
								$check_all = $('.check-all');
							// 全选
							$check_all.on('change', function() {
								$check_all.prop('checked', $(this).prop('checked'));
								$item_checkboxs.prop('checked', $(this).prop('checked'));
								var inputs = $(".check-individual:checked");
								if (inputs.size()>0){
									queryTotal();
								} else{
									$("#alreadyCheckedProduct").text(0);
									$(".fz24").text("￥0.00");
								}
							});
							// 点击选择
							$item_checkboxs.on('change', function() {
								var inputs = $(".check-individual:checked");
								if (inputs.size()>0){
									queryTotal();
								}else{
									$("#alreadyCheckedProduct").text(0);
									$(".fz24").text("￥0.00");
								}
								var flag = true;
								$item_checkboxs.each(function() {
									if (!$(this).prop('checked')) { flag = false }
								});
								$check_all.prop('checked', flag);
							});
							/*// 个数限制输入数字
							$('input.val').onlyReg({reg: /[^0-9.]/g});
							// 加减个数
							$('.cart-num__box').on('click', '.sub,.add', function() {
								var value = parseInt($(this).siblings('.val').val());
								if ($(this).hasClass('add')) {
									$(this).siblings('.val').val(Math.min((value += 1),99));
								} else {
									$(this).siblings('.val').val(Math.max((value -= 1),1));
								}
							});*/
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