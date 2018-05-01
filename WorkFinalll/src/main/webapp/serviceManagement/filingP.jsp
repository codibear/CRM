<%@ page import="com.chinasofti.crm.domain.User" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/5
  Time: 14:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>归档处理</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/plugins/layui/layui.js" ></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/plugins/layui/lay/dest/layui.all.js" ></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/serviceManagement/css/filingP.css" />
</head>
<body>
<div id="main">
    <div>
        <span style="color: black;"> 客户服务管理 ></span>
        <a href="<%=request.getContextPath()%>/serviceManagement/serviceFiling.jsp"><span style="color: black;">服务归档 ></span></a>
        <span style="color: black;">服务归档处理</span>
    </div>

    <div class="layui-btn-group globalHight">
        <a data-method="notice" class="layui-btn" type="button"  onclick="help()">帮助</a>
        <a href="<%=request.getContextPath()%>/serviceManagement/serviceFiling.jsp" class="layui-btn">返回</a>
    </div>

    <div>
        <table class="layui-table">
            <colgroup>
                <col class="tit">
                <col class="content">
                <col class="tit">
                <col class="content">
            </colgroup>
            <tr>
                <td>编号</td>
                <td>
                    <label>${service.serviceId}</label>
                </td>
                <td>服务类型</td>
                <td>
                    <label>${service.serviceType}</label>
                </td>
            </tr>
            <tr>
                <td>概要</td>
                <td colspan="3">
                    <label>${service.serviceOutline}</label>
                </td>
            </tr>
            <tr>
                <td>客户</td>
                <td>
                    <label>${service.cusName}</label>
                </td>
                <td>状态</td>
                <td>
                    <label>${service.serviceState}</label>
                </td>
            </tr>
            <tr>
                <td>服务请求</td>
                <td colspan="3">
                    <label>${service.serviceRequest}</label>
                </td>
            </tr>
            <tr>
                <td>创建人</td>
                <td>
                    <label>${service.serviceCreateUser}</label>
                </td>
                <td>创建时间</td>
                <td>
                    <label>${service.serviceCreateTime}</label>
                </td>
            </tr>
        </table>
        <table class="layui-table">
            <colgroup>
                <col class="tit">
                <col class="content">
                <col class="tit">
                <col class="content">
            </colgroup>
            <tr>
                <td>分配给</td>
                <td>
                    <label>${service.serviceAlloUser}</label>
                </td>
                <td>分配时间</td>
                <td>
                    <label>${service.serviceAlloTime}</label>
                </td>
            </tr>
        </table>
        <table class="layui-table">
            <colgroup>
                <col class="tit">
                <col class="content">
                <col class="tit">
                <col class="content">
            </colgroup>
            <tr>
                <td>服务处理</td>
                <td colspan="3">
                    <label>${service.serviceDealContent}</label>
                </td>
            </tr>
            <tr>
                <td>处理人</td>
                <td>
                    <label>${service.serviceDealUser}</label>
                </td>
                <td>处理时间</td>
                <td>
                    <label>${service.serviceDealTime}</label>
                </td>
            </tr>
        </table>
        <table class="layui-table">
            <colgroup>
                <col class="tit">
                <col class="content">
                <col class="tit">
                <col class="content">
            </colgroup>
            <tr>
                <td>处理结果</td>
                <td>
                    <label>${service.serviceDealResult}</label>
                </td>
                <td>满意度</td>
                <td>
                    <label>${service.serviceSatisfy}</label>
                </td>
            </tr>
        </table>
    </div>
</div>
<script>
    //  帮助按钮
    function  help() {
        //示范一个公告层
        layer.open({
            type: 1,
            title: false, //不显示标题栏
            closeBtn: false,
            area: ['650px', '450px'],
            shade: 0.8,
            resize: true,
            id: 'LAY_layuipro', //设定一个id，防止重复弹出
            btn: ['好啦，我知道啦'],
            moveType: 0,//拖拽模式，0或者1
            content: '<div style="padding: 20px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><img src="<%=request.getContextPath()%>/images/filingP.png" style="width:620px;height:350px"></div>',
            success: function (layero) {
                var btn = layero.find('.layui-layer-btn');
                btn.css('text-align', 'center');
                btn.find('.layui-layer-btn0').attr({
                    target: '_blank'
                });
            }
        });
    }
</script>
</body>
</html>
