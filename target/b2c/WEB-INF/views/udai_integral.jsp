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
					<a href="treasurer"><dd>资金管理</dd></a>
					<a href="integral"><dd class="active">积分平台</dd></a>
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
					<div class="title">账户信息-积分平台</div>
					<ul class="nav user-nav__title" role="tablist">
						<li role="presentation" class="nav-item active"><a href="#list" aria-controls="list" role="tab" data-toggle="tab">我的积分</a></li>
						<li role="presentation" class="nav-item "><a href="#detail" aria-controls="detail" role="tab" data-toggle="tab">积分明细</a></li>
					</ul>
					<div class="integral-box clearfix bgf5">
						<div class="integral-total">
							<div class="fz16">可用的积分</div>
							<b class="num">${requestScope.user.integral}</b>
						</div>
						<div class="integral-desc">
							<b class="cr fz16">积分使用规则：</b><br>
							<span class="c3">1、如何获得积分？</span>
							<ul>
								<li>1) 积分可以通过在购买商品获得，积分会在确认收货的时候增加。</li>
								<li>2) 通过签到获得：每次签到可获得 3 积分</li>
							</ul>
							<span class="c3">2、如何使用积分？</span>
							<ul><li>可使用积分兑换商品</li></ul>
						</div>
					</div>
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane fade in active" id="list">
							<p class="fz18 cr">商品兑换</p>
							<ul class="nav user-nav__title" role="tablist">
								<li role="presentation" class="nav-item active"><a href="#all" aria-controls="all" role="tab" data-toggle="tab">全部</a></li>
								<li role="presentation" class="nav-item "><a href="#usable" aria-controls="usable" role="tab" data-toggle="tab">可兑换</a></li>
							</ul>
							<div class="table-thead">
								<div class="tdf3">商品信息</div>
								<div class="tdf2">市场价</div>
								<div class="tdf2">所需积分</div>
								<div class="tdf1">操作</div>
							</div>
							<div class="tab-content">
								<div role="tabpanel" class="tab-pane fade in active" id="all">
									<div class="integral-item__list">
										<div class="integral-item">
											<div class="tdf3">
												<a class="integral-item__info" href="">
													<div class="img"><img src="${path}/static/images/temp/M-001.jpg" alt="" class="cover"></div>
													<div class="name ep2">锦瑟 原创传统日常汉服男绣花交领衣裳cp情侣装春夏款</div>
													<div class="type">颜色分类：深棕色 尺码：均码</div>
												</a>
											</div>
											<div class="tdf2"><span class="c9">¥269.90</span></div>
											<div class="tdf2"><span class="cr">500</span></div>
											<div class="tdf1">
												<a class="but" href="#" role="button">兑换</a>
											</div>
										</div>
										<div class="integral-item">
											<div class="tdf3">
												<a class="integral-item__info" href="">
													<div class="img"><img src="${path}/static/images/temp/M-002.jpg" alt="" class="cover"></div>
													<div class="name ep2">霜天月明 原创日常汉服男云纹绣花单大氅传统礼服外套</div>
													<div class="type">颜色分类：深棕色 尺码：均码</div>
												</a>
											</div>
											<div class="tdf2"><span class="c9">¥1269.90</span></div>
											<div class="tdf2"><span class="cr">2000</span></div>
											<div class="tdf1">
												<a class="but disabled" href="#" role="button">积分不够</a>
											</div>
										</div>
										<div class="integral-item">
											<div class="tdf3">
												<a class="integral-item__info" href="">
													<div class="img"><img src="${path}/static/images/temp/M-003.jpg" alt="" class="cover"></div>
													<div class="name ep2">霜天月明 原创日常汉服男云纹绣花单大氅传统礼服外套</div>
													<div class="type">颜色分类：深棕色 尺码：均码</div>
												</a>
											</div>
											<div class="tdf2"><span class="c9">¥1269.90</span></div>
											<div class="tdf2"><span class="cr">700</span></div>
											<div class="tdf1">
												<a class="but" href="#" role="button">兑换</a>
											</div>
										</div>
										<div class="integral-item">
											<div class="tdf3">
												<a class="integral-item__info" href="">
													<div class="img"><img src="${path}/static/images/temp/M-004.jpg" alt="" class="cover"></div>
													<div class="name ep2">霜天月明 原创日常汉服男云纹绣花单大氅传统礼服外套</div>
													<div class="type">颜色分类：深棕色 尺码：均码</div>
												</a>
											</div>
											<div class="tdf2"><span class="c9">¥1269.90</span></div>
											<div class="tdf2"><span class="cr">700</span></div>
											<div class="tdf1">
												<a class="but" href="#" role="button">兑换</a>
											</div>
										</div>
										<div class="integral-item">
											<div class="tdf3">
												<a class="integral-item__info" href="">
													<div class="img"><img src="${path}/static/images/temp/M-005.jpg" alt="" class="cover"></div>
													<div class="name ep2">霜天月明 原创日常汉服男云纹绣花单大氅传统礼服外套</div>
													<div class="type">颜色分类：深棕色 尺码：均码</div>
												</a>
											</div>
											<div class="tdf2"><span class="c9">¥1269.90</span></div>
											<div class="tdf2"><span class="cr">700</span></div>
											<div class="tdf1">
												<a class="but" href="#" role="button">兑换</a>
											</div>
										</div>
										<div class="integral-item">
											<div class="tdf3">
												<a class="integral-item__info" href="">
													<div class="img"><img src="${path}/static/images/temp/M-006.jpg" alt="" class="cover"></div>
													<div class="name ep2">霜天月明 原创日常汉服男云纹绣花单大氅传统礼服外套</div>
													<div class="type">颜色分类：深棕色 尺码：均码</div>
												</a>
											</div>
											<div class="tdf2"><span class="c9">¥1269.90</span></div>
											<div class="tdf2"><span class="cr">700</span></div>
											<div class="tdf1">
												<a class="but" href="#" role="button">兑换</a>
											</div>
										</div>
										<div class="integral-item">
											<div class="tdf3">
												<a class="integral-item__info" href="">
													<div class="img"><img src="${path}/static/images/temp/M-007.jpg" alt="" class="cover"></div>
													<div class="name ep2">霜天月明 原创日常汉服男云纹绣花单大氅传统礼服外套</div>
													<div class="type">颜色分类：深棕色 尺码：均码</div>
												</a>
											</div>
											<div class="tdf2"><span class="c9">¥1269.90</span></div>
											<div class="tdf2"><span class="cr">700</span></div>
											<div class="tdf1">
												<a class="but" href="#" role="button">兑换</a>
											</div>
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
								<div role="tabpanel" class="tab-pane fade" id="usable">
									<div class="integral-item__list">
										<div class="integral-item">
											<div class="tdf3">
												<a class="integral-item__info" href="">
													<div class="img"><img src="${path}/static/images/temp/S-001.jpg" alt="" class="cover"></div>
													<div class="name ep2">锦瑟 原创传统日常汉服男绣花交领衣裳cp情侣装春夏款</div>
													<div class="type">颜色分类：深棕色 尺码：均码</div>
												</a>
											</div>
											<div class="tdf2"><span class="c9">¥269.90</span></div>
											<div class="tdf2"><span class="cr">500</span></div>
											<div class="tdf1">
												<a class="but" href="#" role="button">兑换</a>
											</div>
										</div>
										<div class="integral-item">
											<div class="tdf3">
												<a class="integral-item__info" href="">
													<div class="img"><img src="${path}/static/images/temp/S-002.jpg" alt="" class="cover"></div>
													<div class="name ep2">霜天月明 原创日常汉服男云纹绣花单大氅传统礼服外套</div>
													<div class="type">颜色分类：深棕色 尺码：均码</div>
												</a>
											</div>
											<div class="tdf2"><span class="c9">¥1269.90</span></div>
											<div class="tdf2"><span class="cr">2000</span></div>
											<div class="tdf1">
												<a class="but disabled" href="#" role="button">积分不够</a>
											</div>
										</div>
										<div class="integral-item">
											<div class="tdf3">
												<a class="integral-item__info" href="">
													<div class="img"><img src="${path}/static/images/temp/S-003.jpg" alt="" class="cover"></div>
													<div class="name ep2">霜天月明 原创日常汉服男云纹绣花单大氅传统礼服外套</div>
													<div class="type">颜色分类：深棕色 尺码：均码</div>
												</a>
											</div>
											<div class="tdf2"><span class="c9">¥1269.90</span></div>
											<div class="tdf2"><span class="cr">700</span></div>
											<div class="tdf1">
												<a class="but" href="#" role="button">兑换</a>
											</div>
										</div>
										<div class="integral-item">
											<div class="tdf3">
												<a class="integral-item__info" href="">
													<div class="img"><img src="${path}/static/images/temp/S-004.jpg" alt="" class="cover"></div>
													<div class="name ep2">霜天月明 原创日常汉服男云纹绣花单大氅传统礼服外套</div>
													<div class="type">颜色分类：深棕色 尺码：均码</div>
												</a>
											</div>
											<div class="tdf2"><span class="c9">¥1269.90</span></div>
											<div class="tdf2"><span class="cr">700</span></div>
											<div class="tdf1">
												<a class="but" href="#" role="button">兑换</a>
											</div>
										</div>
										<div class="integral-item">
											<div class="tdf3">
												<a class="integral-item__info" href="">
													<div class="img"><img src="${path}/static/images/temp/S-005.jpg" alt="" class="cover"></div>
													<div class="name ep2">霜天月明 原创日常汉服男云纹绣花单大氅传统礼服外套</div>
													<div class="type">颜色分类：深棕色 尺码：均码</div>
												</a>
											</div>
											<div class="tdf2"><span class="c9">¥1269.90</span></div>
											<div class="tdf2"><span class="cr">700</span></div>
											<div class="tdf1">
												<a class="but" href="#" role="button">兑换</a>
											</div>
										</div>
										<div class="integral-item">
											<div class="tdf3">
												<a class="integral-item__info" href="">
													<div class="img"><img src="${path}/static/images/temp/S-006.jpg" alt="" class="cover"></div>
													<div class="name ep2">霜天月明 原创日常汉服男云纹绣花单大氅传统礼服外套</div>
													<div class="type">颜色分类：深棕色 尺码：均码</div>
												</a>
											</div>
											<div class="tdf2"><span class="c9">¥1269.90</span></div>
											<div class="tdf2"><span class="cr">700</span></div>
											<div class="tdf1">
												<a class="but" href="#" role="button">兑换</a>
											</div>
										</div>
										<div class="integral-item">
											<div class="tdf3">
												<a class="integral-item__info" href="">
													<div class="img"><img src="${path}/static/images/temp/S-007.jpg" alt="" class="cover"></div>
													<div class="name ep2">霜天月明 原创日常汉服男云纹绣花单大氅传统礼服外套</div>
													<div class="type">颜色分类：深棕色 尺码：均码</div>
												</a>
											</div>
											<div class="tdf2"><span class="c9">¥1269.90</span></div>
											<div class="tdf2"><span class="cr">700</span></div>
											<div class="tdf1">
												<a class="but" href="#" role="button">兑换</a>
											</div>
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
							</div>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="detail">
							<div class="table-thead">
								<div class="tdf3">来源/用途</div>
								<div class="tdf2">积分变化</div>
								<div class="tdf2">日期</div>
								<div class="tdf1">备注</div>
							</div>
							<div class="integral-item__list">
								<div class="integral-item">
									<div class="tdf3">
										<a class="integral-item__info" href="">
											<div class="img"><img src="${path}/static/images/temp/M-001.jpg" alt="" class="cover"></div>
											<div class="name ep2">锦瑟 原创传统日常汉服男绣花交领衣裳cp情侣装春夏款</div>
											<div class="type">颜色分类：深棕色 尺码：均码</div>
										</a>
									</div>
									<div class="tdf2">
										<b class="fz24 cg">+200</b>
									</div>
									<div class="tdf2"><span class="c6">2017年4月12日 15:13:14</span></div>
									<div class="tdf1">
										<span class="c6">交易获得</span>
									</div>
								</div>
								<div class="integral-item">
									<div class="tdf3">
										<a class="integral-item__info" href="">
											<div class="img"><img src="${path}/static/images/temp/M-002.jpg" alt="" class="cover"></div>
											<div class="name ep2">锦瑟 原创传统日常汉服男绣花交领衣裳cp情侣装春夏款</div>
											<div class="type">颜色分类：深棕色 尺码：均码</div>
										</a>
									</div>
									<div class="tdf2">
										<b class="fz24 cr">-1500</b>
									</div>
									<div class="tdf2"><span class="c6">2017年4月12日 15:13:14</span></div>
									<div class="tdf1">
										<span class="c6">兑换消耗</span>
									</div>
								</div>
								<div class="integral-item">
									<div class="tdf3">
										<a class="integral-item__info" href="">
											<div class="img"><img src="${path}/static/images/temp/M-003.jpg" alt="" class="cover"></div>
											<div class="name ep2">锦瑟 原创传统日常汉服男绣花交领衣裳cp情侣装春夏款</div>
											<div class="type">颜色分类：深棕色 尺码：均码</div>
										</a>
									</div>
									<div class="tdf2">
										<b class="fz24 cg">+300</b>
									</div>
									<div class="tdf2"><span class="c6">2017年4月12日 15:13:14</span></div>
									<div class="tdf1">
										<span class="c6">交易获得</span>
									</div>
								</div>
								<div class="integral-item">
									<div class="tdf3">
										<a class="integral-item__info" href="">
											<div class="img"><img src="${path}/static/images/temp/M-004.jpg" alt="" class="cover"></div>
											<div class="name ep2">锦瑟 原创传统日常汉服男绣花交领衣裳cp情侣装春夏款</div>
											<div class="type">颜色分类：深棕色 尺码：均码</div>
										</a>
									</div>
									<div class="tdf2">
										<b class="fz24 cg">+250</b>
									</div>
									<div class="tdf2"><span class="c6">2017年4月12日 15:13:14</span></div>
									<div class="tdf1">
										<span class="c6">交易获得</span>
									</div>
								</div>
								<div class="integral-item">
									<div class="tdf3">
										<a class="integral-item__info" href="">
											<div class="img"><img src="${path}/static/images/temp/M-005.jpg" alt="" class="cover"></div>
											<div class="name ep2">锦瑟 原创传统日常汉服男绣花交领衣裳cp情侣装春夏款</div>
											<div class="type">颜色分类：深棕色 尺码：均码</div>
										</a>
									</div>
									<div class="tdf2">
										<b class="fz24 cg">+450</b>
									</div>
									<div class="tdf2"><span class="c6">2017年4月12日 15:13:14</span></div>
									<div class="tdf1">
										<span class="c6">交易获得</span>
									</div>
								</div>
								<div class="integral-item">
									<div class="tdf3">
										<a class="integral-item__info" href="">
											<div class="img"><img src="${path}/static/images/temp/M-006.jpg" alt="" class="cover"></div>
											<div class="name ep2">锦瑟 原创传统日常汉服男绣花交领衣裳cp情侣装春夏款</div>
											<div class="type">颜色分类：深棕色 尺码：均码</div>
										</a>
									</div>
									<div class="tdf2">
										<b class="fz24 cr">-1000</b>
									</div>
									<div class="tdf2"><span class="c6">2017年4月12日 15:13:14</span></div>
									<div class="tdf1">
										<span class="c6">兑换消耗</span>
									</div>
								</div>
								<div class="integral-item">
									<div class="tdf3">
										<a class="integral-item__info" href="">
											<div class="img"><img src="${path}/static/images/temp/M-007.jpg" alt="" class="cover"></div>
											<div class="name ep2">锦瑟 原创传统日常汉服男绣花交领衣裳cp情侣装春夏款</div>
											<div class="type">颜色分类：深棕色 尺码：均码</div>
										</a>
									</div>
									<div class="tdf2">
										<b class="fz24 cr">-12450</b>
									</div>
									<div class="tdf2"><span class="c6">2017年4月12日 15:13:14</span></div>
									<div class="tdf1">
										<span class="c6">兑换消耗</span>
									</div>
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