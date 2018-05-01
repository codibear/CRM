<%--
  User: lenghaoran
  Date: 2017/7/26
  Time: 12:12
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <link rel="icon" href="${pageContext.request.contextPath}/update/">
    <title id="tttt"></title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css" media="all">
    <link rel="stylesheet" type="${pageContext.request.contextPath}/text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"></script>
    <%--<script type="text/javascript" src="${pageContext.request.contextPath}/plugins/layui/layui.js"></script>--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/layui/css/modules/layer/default/layer.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/plugins/layui/lay/modules/layer.js"></script>
    <script type="text/javascript">
//        layui.use('layer', function () {
//            var layer = layui.layer;
//        });
        $(function () {
            $.get("${pageContext.request.contextPath}/customer/cstLinkmanbrithdayTips.action", {userId:${user.userId}},function (data) {
                if (data == "") {
                } else {
                    layer.alert( '今天是您的客户联系人' + data.lkmCustName + '的' + data.lkmPostion + ':' + data.lkmName + '的生日,他的手机号为：' + data.lkmTel, {
                        skin: 'layui-layer-molv' //样式类名
                        ,closeBtn: 0
                    }
                    );
                }

            })
            <%--$.get("${pageContext.request.contextPath}/customer/cstLostcheckCstLost.action", {userId:${user.userId}}, function (data) {--%>
                <%--alert("aaaaaaaaaaaaaaaaaaa")--%>
                <%--if (data == "") {--%>

                <%--} else {--%>
<%--//                    layer.open({--%>
<%--//                        type: 1,--%>
<%--//                        title: '客户流失预警',--%>
<%--//                        skin: 'layui-layer-rim', //加上边框--%>
<%--//                        area: ['420px', '240px'], //宽高--%>
<%--//                        content: '您新增了' + data + '条客户流失预警记录，请处理！！！'--%>
<%--//                    });--%>
                    <%--layer.alert('您新增了' + data + '条客户流失预警记录，请处理！！！', {--%>
                        <%--skin: 'layui-layer-molv' //样式类名--%>
                        <%--,closeBtn: 0--%>
                    <%--});--%>
                <%--}--%>

            <%--})--%>
        })
        $(function () {
            $.get("${pageContext.request.contextPath}/customer/cstLostcheckCstLost.action", {userId:${user.userId}}, function (data) {
                if (data == "") {

                } else {
                    layer.open({
                        type: 1,
                        title: '客户流失预警',
                        skin: 'layui-layer-rim', //加上边框
                        area: ['420px', '240px'], //宽高
                        content: '您新增了' + data + '条客户流失预警记录，请处理！！！'
                    });
//                    layer.alert('您新增了' + data + '条客户流失预警记录，请处理！！！', {
//                        skin: 'layui-layer-molv' //样式类名
//                        ,closeBtn: 0
//                    });
                }

            })
        })
    </script>


</head>
<body>
<div class="layui-layout layui-layout-admin" style="border-bottom: solid 5px #1aa094;">
    <%--头部--%>
    <div class="layui-header header header-demo">
        <div class="layui-main">
            <div class="admin-login-box">
                <a class="logo" style="left: 0;" href="">
                    <%--获得title和系统名--%>
                    <script type="text/javascript">
                        $(function () {
                            $.get("logofindWeb.action",function (data) {
                                var vv=data.systemname;

                                var tit=data.title;
                                var copyright=data.copyright;
                                var logo=data.syslogoip;
                                $("#hz").append(vv);
                                $("#tttt").append(tit);

                                $("#foot").append(copyright);


                            })

                        })
                    </script>
                    <span style="font-size: 22px;" id="hz"></span>
                </a>
                <div class="admin-side-toggle">
                    <i class="fa fa-bars" aria-hidden="true"></i>
                </div>
                <div class="admin-side-full">
                    <i class="fa fa-life-bouy" aria-hidden="true"></i>
                </div>
            </div>
            <ul class="layui-nav admin-header-item">
                <li class="layui-nav-item layui-this">
                    <a href="javascript:;">首页</a>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">营销管理</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="salesManagement/ManageSaleOpportunity.jsp"><i class="fa fa-user-circle" aria-hidden="true"></i>销售机会管理</a>
                        </dd>
                        <dd>
                            <a href="salesManagement/CustDist.jsp"><i class="fa fa-user-circle" aria-hidden="true"></i>客户开发计划</a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">客户管理</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;"><i class="fa fa-user-circle" aria-hidden="true"></i>客户信息管理</a>
                        </dd>
                        <dd>
                            <a href="javascript:;"><i class="fa fa-user-circle" aria-hidden="true"></i>客户流失管理</a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">服务管理</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;"><i class="fa fa-user-circle" aria-hidden="true"></i>服务创建</a>
                        </dd>
                        <dd>
                            <a href="javascript:;"><i class="fa fa-user-circle" aria-hidden="true"></i>服务分配</a>
                        </dd>
                        <dd>
                            <a href="javascript:;"><i class="fa fa-user-circle" aria-hidden="true"></i>服务处理</a>
                        </dd>
                        <dd>
                            <a href="javascript:;"><i class="fa fa-user-circle" aria-hidden="true"></i>服务反馈</a>
                        </dd>
                        <dd>
                            <a href="javascript:;"><i class="fa fa-user-circle" aria-hidden="true"></i>服务归档</a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">报价管理</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;"><i class="fa fa-user-circle" aria-hidden="true"></i>报价创建</a>
                        </dd>
                        <dd>
                            <a href="javascript:;"><i class="fa fa-user-circle" aria-hidden="true"></i>报价处理</a>
                        </dd>
                        <dd>
                            <a href="javascript:;"><i class="fa fa-user-circle" aria-hidden="true"></i>报价审核</a>
                        </dd>
                        <dd>
                            <a href="javascript:;"><i class="fa fa-user-circle" aria-hidden="true"></i>报价归档</a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">统计报表</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;"><i class="fa fa-user-circle" aria-hidden="true"></i>客户贡献分析</a>
                        </dd>
                        <dd>
                            <a href="javascript:;"><i class="fa fa-user-circle" aria-hidden="true"></i>客户构成分析</a>
                        </dd>
                        <dd>
                            <a href="javascript:;"><i class="fa fa-user-circle" aria-hidden="true"></i>客户服务分析</a>
                        </dd>
                        <dd>
                            <a href="javascript:;"><i class="fa fa-user-circle" aria-hidden="true"></i>客户流失分析</a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">基础数据</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;"><i class="fa fa-user-circle" aria-hidden="true"></i>数据字典管理</a>
                        </dd>
                        <dd>
                            <a href="javascript:;"><i class="fa fa-user-circle" aria-hidden="true"></i>查询产品信息</a>
                        </dd>
                        <dd>
                            <a href="javascript:;"><i class="fa fa-user-circle" aria-hidden="true"></i>查询库存</a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item" >
                    <a href="javascript:;">权限管理</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;"><i class="fa fa-user-circle" aria-hidden="true"></i>用户管理</a>
                        </dd>
                        <dd>
                            <a href="javascript:;"><i class="fa fa-user-circle" aria-hidden="true"></i>角色管理</a>
                        </dd>
                        <dd>
                            <a href="javascript:;"><i class="fa fa-user-circle" aria-hidden="true"></i>权限分配</a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item" ></li>
                <li class="layui-nav-item" ></li>
                <li class="layui-nav-item" ></li>
                <li class="layui-nav-item" ></li>
                <li class="layui-nav-item">
                    <a href="javascript:;" class="admin-header-user">
                        <img src="${pageContext.request.contextPath}/images/0.jpg" />
                        <span>${user.userName}</span>
                    </a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;"><i class="fa fa-user-circle" aria-hidden="true"></i> 个人信息</a>
                        </dd>
                        <dd>
                            <a href="javascript:;"><i class="fa fa-gear" aria-hidden="true"></i> 设置</a>
                        </dd>
                        <dd id="lock">
                            <a href="javascript:;">
                                <i class="fa fa-lock" aria-hidden="true" style="padding-right: 3px;padding-left: 1px;"></i> 锁屏 (Alt+L)
                            </a>
                        </dd>
                        <dd>
                            <a href="logout.action"><i class="fa fa-sign-out" aria-hidden="true"></i> 注销</a>
                        </dd>
                    </dl>
                </li>
            </ul>
            <ul class="layui-nav admin-header-item-mobile">
                <li class="layui-nav-item">
                    <a href="login.jsp"><i class="fa fa-sign-out" aria-hidden="true"></i> 注销</a>
                </li>
            </ul>
        </div>
    </div>
        <%--左侧导航--%>
        <div class="layui-side layui-bg-black" id="admin-side">
        <div class="layui-side-scroll" id="admin-navbar-side" lay-filter="side"></div>
    </div>
    <%--右侧主体部分--%>
        <div class="layui-body" style="bottom: 0;border-left: solid 2px #1AA094;" id="admin-body">
        <div class="layui-tab admin-nav-card layui-tab-brief" lay-filter="admin-tab">
            <ul class="layui-tab-title">
                <li class="layui-this">
                    <i class="fa fa-dashboard" aria-hidden="true"></i>
                    <cite>控制面板</cite>
                </li>
            </ul>
            <div class="layui-tab-content" style="min-height: 150px; padding: 5px 0 0 0;">
                <div class="layui-tab-item layui-show">
                    <iframe src="${pageContext.request.contextPath}/main.jsp"></iframe>
                </div>
            </div>
        </div>
    </div>
    <%--右侧底部--%>
        <div class="layui-footer footer footer-demo" id="admin-footer">
        <div class="layui-main">
            <p id="foot">
            </p>
        </div>
    </div>
    <div class="site-tree-mobile layui-hide">
        <i class="layui-icon">&#xe602;</i>
    </div>
    <div class="site-mobile-shade"></div>

    <!--锁屏模板 start-->
    <script type="text/template" id="lock-temp">
        <div class="admin-header-lock" id="lock-box">
            <div class="admin-header-lock-img">
                <img src="${pageContext.request.contextPath}/images/0.jpg"/>
            </div>
            <div class="admin-header-lock-name" id="lockUserName">beginner</div>
            <input type="text" class="admin-header-lock-input" value="输入密码解锁.." name="lockPwd" id="lockPwd" />
            <button class="layui-btn layui-btn-small" id="unlock">解锁</button>
        </div>
    </script>
    <!--锁屏模板 end -->

    <script type="text/javascript" src="${pageContext.request.contextPath}/plugins/layui/layui.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/datas/nav.js"></script>
    <script src="${pageContext.request.contextPath}/js/index.js"></script>
    <script>
        layui.use('layer', function() {
            var $ = layui.jquery,
                    layer = layui.layer;
        });
    </script>
</div>
</body>
</html>
