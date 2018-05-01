<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/1
  Time: 14:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="../css/main.css" />
    <link rel="stylesheet" href="../customer/css/custManage.css" />
    <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript"  src="../plugins/layui/layui.js" ></script>

    <script>
        layui.use('layer', function(){
            var layer = layui.layer;
        });

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
                area: ['1400px', '700px']
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
                content: '<div style="padding: 20px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><img src="../images/help_cusManage.png" ></div>'
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
            var tbody = $("#cus_content") ;
            var tr = "<tr>" ;
            $(data).each(function(i,obj){
                var td = "<td id='cusId" +i +"'>" + obj.cusId + "</td>" +
                        "<td>" + obj.cusName + "</td>" +
                        "<td>" + obj.cusManagerName + "</td>"+
                        "<td>" + obj.cusLevel + "</td>"+
                        "<td> <a onclick='modify("+obj.id+")'"+" > <i class='layui-icon' style='cursor: pointer'>"+"&#xe642;"+"</i></a>"
                        +"&nbsp;&nbsp;&nbsp;&nbsp;"+"<a onclick='s("+obj.id+")'"+"><i class='layui-icon' style='cursor: pointer'>"+"&#xe615;"+"</i></a></td>";
                tr = tr + td + "</tr>" ;
            });
            $(tbody).append(tr) ;
        }
        //分页公用方法
         function getCurrentpage(curr) {
            $.get("${pageContext.request.contextPath}/customer/customerpageList.action",{currentPage:curr,userId:${user.userId}},function (data) {
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
                             $("#cus_content").html("");
                             getCurrentpage(obj.curr);
                         }
         }
                });
                })
            }) ;

        }
    $(function () {
        layui.use('layer', function(){
            var layer = layui.layer;
            var index = layer.load(1, {
                shade: [0.1,'#fff'] ,
                time: 500//0.1透明度的白色背景
            });
        });
        getCurrentpage(1);
        <%--$.get("${pageContext.request.contextPath}/customer/customerlist.action",function (data) {--%>
            <%--ch(data);--%>
    <%--}) ;--%>
  })
        function query_cus() {
            var cusId=$("#cusId").val();
//            alert(111);
            var cusName=$("#cusName").val();
            var s=$("#cus_content");
            if(cusId==""&&cusName==""){
                layer.msg('不能都为空呦', {
                    msg: [1, '#3595CC'],
                    area: ['200px', '48px'], //宽高
                    time: 1000
                })
//                layer.msg('至少输入其中一个条件哦', {
//                    time: 20000, //20s后自动关闭
//                    btn: ['明白了', '知道了', '哦']
//                });
//                alert("11");
            }else{
                s.html("");
                $.get("${pageContext.request.contextPath}/customer/customersearch.action",$("#query").serialize(),function (data) {
                    ch(data);
                }) ;
            }
        }
        //查看方法
        function s(i) {
            window.location.href="${pageContext.request.contextPath}/customer/customerloadById.action?id="+i+"";
        }
        //修改方法
        function modify(i) {
            window.location.href="${pageContext.request.contextPath}/customer/customerloadById.action?id="+i+"";
        };

    </script>
</head>
<body>
<div id="main">
    <div id="nav">
        <span id="title1">
		  <a href="">客户信息管理 ></a>
		</span>
    </div>
    <div class="layui-btn-group globalHight">
        <a data-method="notice" class="layui-btn" href="customerexportExcel.action">导出</a>
    <a data-method="notice" class="layui-btn" type="button"  onclick="help()">帮助</a>
       <a class="layui-btn" id="query_cus" onclick="query_cus()">查询</a>
    </div>
<form id="query">

        <table class="layui-table">
            <tr>
                <td>客户编号</td>
                <td>
                    <input type="text" id="cusId" name="customer.cusId"/>
                </td>
                <td>客户名称</td>
                <td>
                    <input type="text" id="cusName" name="customer.cusName"/>
                </td>
            </tr>
        </table>
</form>
        <br/>
        <table class="layui-table">
            <tr>
            <td>客户编号</td>
            <td>客户名称</td>
            <td>客户经理</td>
            <td>客户等级</td>
            <td>操作</td>
        </tr>
            <tbody id="cus_content">
            </tbody>

        </table>
        <%--<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">--%>
            <%--<legend>开门见山 ： 默认分页</legend>--%>
        <%--</fieldset>--%>

    <div id="demo7"></div>
    </div>

</div>

</body>
</html>
