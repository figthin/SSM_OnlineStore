<%@page pageEncoding="UTF-8" contentType="text/html; utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<%@include file="_head.jsp"%>
<script type="text/javascript" src="${path}/static/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">

	$(function () {
		$("#pay").click(function () {
			var val = $("input:checked").val();
			if (val == null) {
				alert("请选择会员级别！");
				return false;
			}
			var money = 300;
			if (val == 2) {
				money = 500;
			}
			if (val == 3){
				money = 1000;
			}
			$.ajax({
				url:"${path}/agentLevel",
				type:"get",
				data:{
					val:val,
					money:money
				},
				success:function (res) {
					console.log(res);
					if (res.succ){
						alert("恭喜，会员开通成功！");
						location = "${path}/welcome";
					}
					else {
						alert(res.error);
					}
				}
			});
			return false;
		});

	})
</script>
<body>
	<!-- 顶部tab -->
	<%@include file="_nav.jsp"%>
	<div class="content inner">
		<section class="invite-agent clearfix">
			<div class="agent-level">
				<%--<h2 class="cr fz18">诚邀网店代销</h2>
				<p class="c6">您的账户还不是代销商，<a href="#agent">立即开通</a>！</p>--%>
				<!-- <p class="c6">欢迎您，亲爱的代销商，您当前的等级是【一级会员代销商】</p> -->
				<div class="agent-buy clearfix">
					<form action="" class="content" id="agent" style="border-right: 1px solid #b31e22">
						<b class="fz16 cr">选择您所需的会员：</b>
						<div class="radio"><label><input name="agent" value="1" type="radio"><i class="iconfont icon-radio-checked"></i>银牌会员：300元</label></div>
						<div class="radio"><label><input name="agent" value="2" type="radio"><i class="iconfont icon-radio"></i>超级会员：500元</label></div>
						<div class="radio"><label><input name="agent" value="3" type="radio"><i class="iconfont"></i>VIP会员：1000元</label></div>
						<button type="button" id="pay" class="btn btn-block btn-primary">立即支付</button>
					</form>
					<!-- <form action="" class="content" id="agent" style="border-right: 1px solid #b31e22">
						<b class="fz16 cr">您可以升级为以下会员：</b>
						<div class="radio"><label><i class="iconfont"></i><input name="agent" value="lv2" type="radio">二级会员代销商：500元</label></div>
						<div class="radio"><label><i class="iconfont"></i><input name="agent" value="lv3" type="radio">高级会员代销商：1000元</label></div>
						<button type="button" class="btn btn-block btn-primary">立即支付</button>
					</form> -->
					<!-- <form action="" class="content" id="agent" style="border-right: 1px solid #b31e22">
						<b class="fz16 cr">您已高级会员代销商！</b>
						<p><br></p>
						<b class="fz20 c6">感谢您对我们的信赖，<br><small>U袋网竭诚为您服务~</small></b>
					</form> -->
					<div class="content">
						<h2>特权说明</h2>
						<p>1.支付宝网站(www.alipay.com) 是国内先进的网上支付平台。<br>支付宝收款接口：在线即可开通，零预付，免年费，单笔阶梯费率，无流量限制支付宝网站(www.alipay.com) <br>是国内先进的网上支付平台。<br>2.支付宝收款接口：在线即可开通，零预付，免年费，单笔阶梯费率，无流量限制</p>
					</div>
				</div>
			</div>
		</section>
		<%--<section class="invite-agent clearfix">
			<div class="filter-value">
				<div class="filter-title">网店代销说明</div>
			</div>
			<div class="html-code">
				<p>1.开通代理需要填写申请代理的信息，并额定支付代理费用提交后台审核，审核通过后成为代理，代理和普通会员显示的商品的价格不同，结算的时候会展示比普通会员优惠的金额</p>
				<p>2.代理和普通会员的区别：普通会员可以购买2件商品。代理购买商品时无数量限制</p>
				<p><img src="images/temp/agent-rule.jpg" alt="" width="100%"></p>
			</div>
		</section>--%>
	</div>
	<!-- 右侧菜单 -->
	<div class="right-nav">
		<ul class="r-with-gotop">
			<li class="r-toolbar-item">
				<a href="udai_welcome.html" class="r-item-hd">
					<i class="iconfont icon-user" data-badge="0"></i>
					<div class="r-tip__box"><span class="r-tip-text">用户中心</span></div>
				</a>
			</li>
			<li class="r-toolbar-item">
				<a href="udai_shopcart.html" class="r-item-hd">
					<i class="iconfont icon-cart"></i>
					<div class="r-tip__box"><span class="r-tip-text">购物车</span></div>
				</a>
			</li>
			<li class="r-toolbar-item">
				<a href="udai_collection.html" class="r-item-hd">
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
				<a href="issues.html" class="r-item-hd">
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
				<a href="temp_article/udai_article10.html"><dd>企业简介</dd></a>
				<a href="temp_article/udai_article11.html"><dd>加入U袋</dd></a>
				<a href="temp_article/udai_article12.html"><dd>隐私说明</dd></a>
			</dl>
			<dl>
				<dt>服务中心</dt>
				<a href="temp_article/udai_article1.html"><dd>售后服务</dd></a>
				<a href="temp_article/udai_article2.html"><dd>配送服务</dd></a>
				<a href="temp_article/udai_article3.html"><dd>用户协议</dd></a>
				<a href="temp_article/udai_article4.html"><dd>常见问题</dd></a>
			</dl>
			<dl>
				<dt>新手上路</dt>
				<a href="temp_article/udai_article5.html"><dd>如何成为代理商</dd></a>
				<a href="temp_article/udai_article6.html"><dd>代销商上架教程</dd></a>
				<a href="temp_article/udai_article7.html"><dd>分销商常见问题</dd></a>
				<a href="temp_article/udai_article8.html"><dd>付款账户</dd></a>
			</dl>
		</div>
		<div class="copy-box clearfix">
			<ul class="copy-links">
				<a href="agent_level.html"><li>网店代销</li></a>
				<a href="class_room.html"><li>U袋学堂</li></a>
				<a href="udai_about.html"><li>联系我们</li></a>
				<a href="temp_article/udai_article10.html"><li>企业简介</li></a>
				<a href="temp_article/udai_article5.html"><li>新手上路</li></a>
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