<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/28
  Time: 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订单明细</title>
    <link rel="stylesheet" href="../plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="../css/main.css" />
    <link rel="stylesheet" href="../customer/css/orderDetails.css" />
    <script type="text/javascript" src="../plugins/layui/layui.js" ></script>
    <script type="text/javascript" src="../plugins/layui/lay/dest/layui.all.js" ></script>
    <script type="text/javascript" >

        $(function () {
            layui.use('layer', function(){
                var layer = layui.layer;
                var index = layer.load(1, {
                    shade: [0.1,'#fff'] ,
                    time: 500//0.1透明度的白色背景
                });
            });
        })
        //        //帮助按钮弹出框方法
        function  help() {
            //示范一个公告层
            layer.open({
                type: 1
                ,
                title: false //不显示标题栏
                ,
                closeBtn: false
                ,
                area: ['1400px', '500px']
                ,
                shade: 0.8
                ,
                resize: true
                ,
                id: 'LAY_layuipro' //设定一个id，防止重复弹出
                ,
                btn: ['好啦，我知道啦']
                ,
                moveType: 0//拖拽模式，0或者1
//                        ,content: '<img src="../images/help_cusManage.png" >'
                ,
                content: '<div style="padding: 20px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><img src="../images/help_orderDetails.png" ></div>'
                ,
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
</head>
<body>
<div id="main">
    <div>
        <span id="title1">
		  <a href="">客户信息管理 ></a>
		  <a href="">客户信息 ></a>
            <a href="">历史订单 ></a>
		  <a href="">订单明细 ></a>
		</span>
    </div>

    <div class="layui-btn-group globalHight">
        <a data-method="notice" class="layui-btn" type="button"  onclick="help()">帮助</a>
        <a class="layui-btn" onclick="history.back(-1);"  href="orderslist.action?id=${id}">返回</a>
        <%--<input type=”button” name=”Submit” onclick="history.back(-1);" value=”返回上一页”>--%>
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
                <td>订单编号</td>
                <td>
                    <label>${order.orderCusNo}</label>
                </td>
                <td>日期</td>
                <td>
                    <label>${order.orderTime}</label>
                </td>
            </tr>
            <tr>
                <td>送货地址</td>
                <td>
                    <label>${order.orderAddr}</label>
                </td>
                <td>订单总金额（元）</td>
                <td>
                    <label>${order.orderMoney}</label>
                </td>
            </tr>
            <tr>
                <td>状态</td>
                <td>
                    <label>${order.orderStatic}</label>
                </td>
                <td></td>
                <td></td>
            </tr>
        </table>
        <br>
        <table class="layui-table">
            <thead>
                <tr>
                    <td>商品ID</td>
                    <td>商品名称</td>
                    <td>商品数量</td>
                    <td>单位</td>
                    <td>单价（元）</td>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${goodses}" var="goods">
                <tr>
                    <td><label>${goods.goodsId} </label></td>
                    <td><label>${goods.goodsName} </label></td>
                    <td><label>${goods.goodsNum}</label></td>
                    <td><label>${goods.goodsCom}</label></td>
                    <td><label>${goods.goodsPrice}</label></td>
                </tr>
            </c:forEach>

            </tbody>
        </table>
    </div>

</div>
</body>
</html>
