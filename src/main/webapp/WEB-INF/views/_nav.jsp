<%@ page pageEncoding="UTF-8" %>
<div class="tab-header">
    <div class="inner">
        <div class="pull-left">
            <div class="pull-left">嗨，欢迎来到<span class="cr">U袋网</span></div>
            <a href="${path}/agent_level">网店代销</a>
            <a href="${path}/temp_article/udai_article4">帮助中心</a>
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
<!-- 搜索栏 -->
<div class="top-search">
    <div class="inner">
        <a class="logo" href="${path}/index"><img src="${path}/static/images/icons/logo.jpg" alt="U袋网" class="cover"></a>
        <div class="search-box">
            <form class="input-group" method="get" action="${path}/list">
                <input placeholder="输入关键字" value="${param.name}" name="name" type="text">
                <span class="input-group-btn">
                    <button type="submit">
                        <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                    </button>
                </span>
            </form>
            <%--<p class="help-block text-nowrap">
                <a href="${path}/">连衣裙</a>
                <a href="${path}/">裤</a>
                <a href="${path}/">衬衫</a>
                <a href="${path}/">T恤</a>
                <a href="${path}/">女包</a>
                <a href="${path}/">家居服</a>
                <a href="${path}/">2017新款</a>
            </p>--%>
        </div>
        <div class="cart-box">
            <a href="${path}/cart" class="cart-but">
                <i class="iconfont icon-shopcart cr fz16"></i> 购物车 ${requestScope.cartAmount.count} 件
            </a>
        </div>
    </div>
</div>
<!-- 内页导航栏 -->
<div class="top-nav bg3">
    <div class="nav-box inner">
        <div class="all-cat">
            <div class="title"><i class="iconfont icon-menu"></i> 全部分类</div>
        </div>
        <ul class="nva-list">
            <a href="${path}/index"><li>首页</li></a>
            <a href="${path}/temp_article/udai_article10"><li>企业简介</li></a>
            <a href="${path}/temp_article/udai_article5"><li>新手上路</li></a>
            <a href="${path}/class_room"><li>U袋学堂</li></a>
            <a href="${path}/enterprise_id"><li>企业账号</li></a>
            <a href="${path}/udai_contract"><li>诚信合约</li></a>
            <a href="${path}/item_remove"><li>实时下架</li></a>
        </ul>
    </div>
</div>
