<%@page pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<%@include file="_head.jsp"%>
<script type="text/javascript">
	function setDefault(e){
		var addressId = $(e).parent().children("input").val();
		$.ajax({
			url:"${path}/setDefault",
			type:"get",
			data:{
				addressId:addressId
			},
			success:function (res) {
				if (res.succ){
					alert("修改成功！")
					location.reload();//尽量不要刷新页面
				}
			}
		});
		return false;
	}

	$(function () {
		$(":button").click(function () {
			var form = $(this).parent().parent().parent();
			var name = form.children().children("div").children("input")[0].value;
			var address = form.children().children("div").children("input")[1].value;
			var tel = form.children().children("div").children("input")[2].value;
			var isDefault = $(":checkbox")[0].checked ? 1 : 0;
			$.ajax({
				url:"${path}/addAddress",
				type:"get",
				data:{
					name:name,
					address:address,
					tel:tel,
					isDefault:isDefault
				},
				success:function (res) {
					alert("添加成功！")
				}
			});
			return false;
		});
	});
	$(function () {
		$(".delete").click(function () {
			var div = $(this).parent().parent();
			var addressId = $(this).parent().children("input").val();
			$.ajax({
				url:"${path}/deleteAddress",
				type:"get",
				data:{
					addressId:addressId
				},
				success:function (res) {
					if (res.succ){
						alert("删除成功！");
						div.remove();
					}else {
						alert("删除失败！有未完成的订单")
					}
				}
			});
			return false;
		});
	});
</script>
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
					<a href="${path}/address"><dd class="active">收货地址</dd></a>
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
				<div class="user-content__box clearfix bgf">
					<div class="title">账户信息-收货地址</div>
					<form class="user-addr__form form-horizontal" role="form">
						<p class="fz18 cr">新增收货地址<span class="c6" style="margin-left: 20px">电话号码、手机号码选填一项，其余均为必填项</span></p>
						<div class="form-group">
							<label for="name" class="col-sm-2 control-label">收货人姓名：</label>
							<div class="col-sm-6">
								<input class="form-control" id="name" placeholder="请输入姓名" type="text">
							</div>
						</div>
						<div class="form-group">
							<label for="details" class="col-sm-2 control-label">收货地址：</label>
							<div class="col-sm-10">
								<%--<div class="addr-linkage">
									<select name="province">
										<option value ="山东">山东</option>
										<option value ="山西">山西</option>
										<option value="河南">河南</option>
										<option value="河北">河北</option>
									</select>
									<select name="city"></select>
									<select name="area"></select>
									<select name="town"></select>
								</div>--%>
								<input class="form-control" id="details" placeholder="建议您如实填写详细收货地址，例如街道名称，门牌号码等信息" maxlength="30" type="text">
							</div>
						</div>
						<!-- <div class="form-group">
							<label for="code" class="col-sm-2 control-label">地区编码：</label>
							<div class="col-sm-6">
								<input class="form-control" id="code" placeholder="请输入邮政编码" type="text">
							</div>
						</div> -->
						<div class="form-group">
							<label for="mobile" class="col-sm-2 control-label">手机号码：</label>
							<div class="col-sm-6">
								<input class="form-control" id="mobile" placeholder="请输入手机号码" type="text">
							</div>
						</div>
						<%--<div class="form-group">
							<label for="phone" class="col-sm-2 control-label">电话号码：</label>
							<div class="col-sm-6">
								<input class="form-control" id="phone" placeholder="请输入电话号码" type="text">
							</div>
						</div>--%>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-6">
								<div class="checkbox">
									<label><input type="checkbox"><i></i> 设为默认收货地址</label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-6">
								<button type="button" class="but">保存</button>
							</div>
						</div>
						<%--<script src="${path}/static/js/jquery.citys.js"></script>
						<script src="http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js"></script>
						<script>
							$(document).ready(function(){
								// 添加街道/乡镇
								function townFormat(info){
									$('.addr-linkage select[name="town"]').hide().empty();
									if (info['code'] % 1e4 && info['code'] < 7e6){	//是否为“区”且不是港澳台地区
										var ajaxConfig = {
											url: 'http://passer-by.com/data_location/town/' + info['code'] + '.json',
											scriptCharset:'UTF-8',
											dataType: "json",
											timeout: 4000,
											success: function(data) {
												$('.addr-linkage select[name="town"]').show();
												// $('#code').val(info['code']) // 填地区编码
												for (i in data) {
													$('.addr-linkage select[name="town"]').append(
														'<option value="' + data[i] + '">' + data[i] + '</option>'
													);
												}
											},
										};
										$.ajax(ajaxConfig).fail(function(p1,p2,p3){
											ajaxConfig.url = 'js/data_location/town/' + info['code'] + '.json';
											$.ajax(ajaxConfig)
										});
									}
								};
								$('.addr-linkage').citys({
									// 如果某天这个仓库地址失效了dataUrl请使用本地 2017.10 的数据 'js/data_location/list.json'
									dataUrl: 'http://passer-by.com/data_location/list.json',
									spareUrl: 'js/data_location/list.json',
									dataType: 'json',
									valueType: 'name',
									province: remote_ip_info['province'],
									city: remote_ip_info['city'],
									area: remote_ip_info['district'],
									onChange: function(data) {
										townFormat(data)
									},
								},function(api){
									var info = api.getInfo();
									townFormat(info);
								});
							}); 
						</script>--%>
					</form>
					<p class="fz18 cr">已保存的有效地址</p>

					<div class="table-thead addr-thead">
						<div class="tdf1">收货人</div>
<%--						<div class="tdf2">所在地</div>--%>
						<div class="tdf3"><div class="tdt-a_l">详细地址</div></div>
						<!-- <div class="tdf1">邮编</div> -->
						<div class="tdf1">电话/手机</div>
						<div class="tdf1">操作</div>
						<div class="tdf1"></div>
					</div>
					<div class="addr-list">
						<c:forEach items="${requestScope.address}" var="address">
							<div class="addr-item">
								<div class="tdf1">${address.name}</div>
<%--								<div class="tdf2 tdt-a_l">福建省 福州市 晋安区</div>--%>
								<div class="tdf3 tdt-a_l">${address.address_detail}</div>
								<!-- <div class="tdf1">350111</div> -->
								<div class="tdf1">${address.tel}</div>
								<div class="tdf1 order">
									<input type="hidden" value="${address.address_id}">
									<a href="${path}/address_edit?addressId=${address.address_id}">修改</a><a type="button" class="delete" >删除</a>
								</div>
								<div class="tdf1">
									<input type="hidden" value="${address.address_id}">
									<a onclick="setDefault(this)" href="javascript:void (0);" <c:if test="${address.is_default == 1}">	class="default active" </c:if> >默认地址</a>
								</div>
							</div>
						</c:forEach>
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