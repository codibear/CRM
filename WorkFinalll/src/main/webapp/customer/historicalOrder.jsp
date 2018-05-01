<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>


<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/28
  Time: 11:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>历史订单</title>
    <link rel="stylesheet" href="../plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="../css/main.css" />
    <link rel="stylesheet" href="../customer/css/historicalOrder.css" />
    <script type="text/javascript" src="../plugins/layui/layui.js" ></script>
    <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="../plugins/layui/lay/dest/layui.all.js" ></script>
    <script type="text/javascript" >

        function json2TimeStamp(milliseconds){
            var datetime = new Date();
            datetime.setTime(milliseconds);
            var year=datetime.getFullYear();
            //月份重0开始，所以要加1，当小于10月时，为了显示2位的月份，所以补0
            var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
            var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
            var hour = datetime.getHours()< 10 ? "0" + datetime.getHours() : datetime.getHours();
            var minute = datetime.getMinutes()< 10 ? "0" + datetime.getMinutes() : datetime.getMinutes();
            var second = datetime.getSeconds()< 10 ? "0" + datetime.getSeconds() : datetime.getSeconds();
            return year + "-" + month + "-" + date;
        }

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
                area: ['1400px', '400px']
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
                content: '<div style="padding: 20px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><img src="../images/help_historicalOrder.png" ></div>'
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

        //公用方法
        function ch(data) {
            var tbody = $("#order-tbody") ;
            var tr = "<tr>" ;
            $("#order-tbody").html("");
            $(data).each(function(i,obj){
                var time=json2TimeStamp(obj.orderTime);
                var td = "<td>" + obj.orderId + "</td>" +
                        "<td>" + time + "</td>" +
                        "<td>" + obj.orderAddr + "</td>" +
                        "<td>" + obj.orderStatic + "</td>"+
                        "<td>" + obj.orderMoney + "</td>"+
                        "<td> <a style='cursor: pointer' title='查看订单明细' onclick='sss("+obj.orderId+")'"+" > <i class='layui-icon'  style='font-size: 30px'>"+"&#xe60a;"+"</i></a></td>";
                <%--<a href="ordersdetails1.action?orderId=${orders.orderId}" title="查看订单明细"><i class="layui-icon" style="font-size: 30px" >&#xe60a;</i></a>--%>
                tr = tr + td + "</tr>" ;
            });
            $(tbody).append(tr) ;
        }


        function  sss(i) {
            window.location.href="ordersdetails1.action?orderId="+i;
        }

        //分页的公用方法
        function fenye(curr,id,paixu) {
            $.get("orderspageList.action",{currentPage:curr,id:${customer.id},paixu:paixu},function (data) {
                ch(data.data);
                layui.use(['laypage', 'layer'],function () {
                    var laypage = layui.laypage
                            ,layer = layui.layer;
                    laypage({
                        cont: 'demo7'
                        ,pages: data.pageSize
                        ,skip: true,
                        curr: curr || 1,
                        jump: function (obj, first) {//触发分页后的回调
                            if (!first) {//点击跳页触发函数自身，并传递当前页：obj.curr
                                $("#order-tbody").html("");
                                getCurrentpage(obj.curr);
                            }
                        }
                    });
                })
            }) ;


        }
        //分页公用方法
        function getCurrentpage(curr) {
            var paixu=$("#paixu").val();
            fenye(curr,${customer.id},paixu)

        }
        $(function () {
            getCurrentpage(1);
        })


        //排序
        $(function () {
            layui.use('layer', function(){
                var layer = layui.layer;
                var index = layer.load(1, {
                    shade: [0.1,'#fff'] ,
                    time: 500//0.1透明度的白色背景
                });
            });

            $("#paixu").change(function () {
                var paixu=$("#paixu").val();
//                alert(paixu);
                $("#order-tbody").html("");
                $("#demo7").html("");
                fenye(1,${id},paixu)
            })

        })

        //导出Excel表格方法
        function exportExcel() {
            $.get("ordersexportExcel.action",{id:${customer.id}},function (data) {
                alert("导出成功");
            })
        }

    </script>
</head>
<body>
<div id="main">
    <div>
       <span id="title1">
		  <a href="">客户信息管理 ></a>
		  <a href="">客户信息 ></a>
		  <a href="">历史订单</a>
		</span>
    </div>

    <div class="layui-btn-group globalHight">
        <a  class="layui-btn" type="button"  onclick="help()">帮助</a>
        <a data-method="notice" class="layui-btn"  href="ordersexportExcel.action?id=${customer.id}" >导出</a>
        <a class="layui-btn"href="orderscreate.action?id=${customer.id}">新建 </a>
        <a class="layui-btn" href="customerloadById.action?id=${customer.id}">返回</a>
    </div>

    <div>
        <table class="layui-table">
            <tr>
                <td>客户编号</td>
                <td>
                    <label>${customer.cusId}</label>
                </td>
                <td>客户名称</td>
                <td>
                    <label>${customer.cusName}</label>
                </td>
            </tr>
        </table>
        <br>
        <table class="layui-table">
            <thead>
            <tr>
                <td>订单编号</td>
                <td>日期 &nbsp;&nbsp;&nbsp;<select id="paixu" style="width: 80px" ><option  value="1">升序</option><option value="2">降序</option></select></td>
                <td>送货地址</td>
                <td>状态</td>
                <td>订单金额</td>
                <td>查看明细</td>
            </tr>
            </thead>
            <tbody id="order-tbody">
            <%--<c:forEach items="${orderses}" var="orders">--%>
                <%--<tr>--%>
                    <%--<td>${orders.orderId}</td>--%>
                    <%--<td>${orders.orderTime}</td>--%>
                    <%--<td>${orders.orderAddr}</td>--%>
                    <%--<td>${orders.orderStatic}</td>--%>
                    <%--<td>--%>
                        <%--<a href="ordersdetails1.action?orderId=${orders.orderId}" title="查看订单明细"><i class="layui-icon" style="font-size: 30px" >&#xe60a;</i></a>--%>
                    <%--</td>--%>
                <%--</tr>--%>
            <%--</c:forEach>--%>
            </tbody>
        </table>
        <div id="demo7"></div>

    </div>
</div>
</body>
</html>
