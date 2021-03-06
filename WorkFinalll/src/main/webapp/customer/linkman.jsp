<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/28
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>联系人</title>
    <link rel="stylesheet" href="../plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="../css/main.css" />
    <link rel="stylesheet" href="../customer/css/linkman.css" />
    <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript"  src="../plugins/layui/layui.js" ></script>
    <script type="text/javascript">
        layui.use('layer', function(){
            var layer = layui.layer;

        });
        function s(i) {
//            alert(i);
            $.get("cstLinkmandelete.action",{lkmId:i,id:${id}},function (data) {

                layui.use('layer', function(){
                    var layer = layui.layer;

                    layer.msg('修改成功',{icon: 1});
                });

                window.location.reload();
            })
        }


        //利用ajax获取联系人集合
        $(function () {
            layui.use('layer', function(){
                var layer = layui.layer;
                var index = layer.load(1, {
                    shade: [0.1,'#fff'] ,
                    time: 500//0.1透明度的白色背景
                });
            });
            $.get("cstLinkmanlist.action",{id:${id}},function(data){
                var tbody = $("#linkmantoby") ;
                var tr = "<tr>" ;
                $(data).each(function(i,obj){
//                    alert(obj.lkmMemo);
                    var td = "<td>" + obj.lkmName + "</td>" +
                            "<td>" + obj.lkmSex + "</td>" +
                            "<td>" + obj.lkmPostion + "</td>"+
                            "<td>" + obj.lkmTel + "</td>"+
                            "<td>" + obj.lkmMemo + "</td>"+
                            "<td>"+"<a href='cstLinkmanloadById.action?lkmId="+obj.lkmId+"&&id=${id}'><i class='layui-icon'>&#xe642;</i>"+"</a>"
                            +"&nbsp;&nbsp;&nbsp;&nbsp;"+"<a onclick='s("+obj.lkmId+")'  style=' cursor: pointer;' "+"><i class='layui-icon' >"+"&#xe640;"+"</i></a></td>";
                    tr = tr + td + "</tr>" ;
                });
                $(tbody).append(tr) ;

            });
        });

        //        //帮助按钮弹出框方法
        function  help() {
//            alert("你试试");

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
                content: '<div style="padding: 20px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><img src="../images/help_linkman.png" ></div>'
                ,
                success: function (layero) {
//                    alert("试试就试试");
                    var btn = layero.find('.layui-layer-btn');
                    btn.css('text-align', 'center');
                    btn.find('.layui-layer-btn0').attr({
                        target: '_blank'
                    });
                }
            });
        }


        //导出Excel表格方法
        function exportExcel() {
            $.get("cstLinkmanexportExcel.action",{id:${customer.id}},function (data) {
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
            <a href="">联系人 ></a>
		</span>
    </div>

    <div class="layui-btn-group globalHight">
        <a class="layui-btn" type="button"  onclick="help()">帮助</a>
        <a data-method="notice" class="layui-btn" href="cstLinkmanexportExcel.action?id=${customer.id}" >导出</a>
        <a class="layui-btn" href="cstLinkmancreate.action?id=${customer.id}">新建 </a>
        <a class="layui-btn" href="customerloadById.action?id=${id}">返回</a>
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
                    <td>姓名</td>
                    <td>性别</td>
                    <td>职位</td>
                    <td>手机号</td>
                    <td>备注</td>
                    <td>操作</td>
                </tr>
            </thead>
            <tbody id="linkmantoby">
            <%--<c:forEach items="${cstLinkmans}" var="cstLinkman">--%>
                <%--<tr>--%>
                    <%--<td>${cstLinkman.lkmName}</td>--%>
                    <%--<td>${cstLinkman.lkmSex}</td>--%>
                    <%--<td>${cstLinkman.lkmPostion}</td>--%>
                    <%--<td>${cstLinkman.lkmTel}</td>--%>

                    <%--<td></td>--%>
                    <%--<td>--%>
                        <%--<a href="cstLinkmanloadById.action?lkmId=${cstLinkman.lkmId}&&id=${customer.id}"><i class="layui-icon">&#xe642;</i></a>--%>
                        <%--&nbsp;&nbsp;&nbsp;&nbsp;<a style="cursor: pointer" onclick="delete_link(${cstLinkman.lkmId},${customer.id})"><i class="layui-icon">&#xe640;</i></a>--%>
                    <%--</td>--%>
                <%--</tr>--%>

            <%--</c:forEach>--%>
            </tbody>
        </table>
    </div>

</div>
</body>
</html>
