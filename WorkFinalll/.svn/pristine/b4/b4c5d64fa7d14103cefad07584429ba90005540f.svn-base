<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/5
  Time: 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>暂缓流失</title>
    <link rel="stylesheet" href="../plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="../css/main.css" />
    <link rel="stylesheet" href="../customer/css/mitigate.css" />
    <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript"  src="../plugins/layui/layui.js" ></script>
    <script type="text/javascript">


        var index;
        var layedit;
        layui.use('layedit', function(){
            layedit = layui.layedit;
            index=layedit.build('delaytext'); //建立编辑器
        });
        $(function () {
            layui.use('layer', function(){
                var layer = layui.layer;
                var index = layer.load(1, {
                    shade: [0.1,'#fff'] ,
                    time: 500//0.1透明度的白色背景
                });
            });
            $("#save").click(function () {
                var  context=layedit.getText(index);
                var newContext="${cstLost.lstDelay}"+"--->"+context;
                $("#delay").val(newContext);
                $("#hold").submit();
                
            });
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
                content: '<div style="padding: 20px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><img src="../images/help_mitigate.png" ></div>'
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

        function back() {

            window.location.href="../customer/custChurn.jsp";
        }

        function confirm() {

            window.location.href="${pageContext.request.contextPath}/customer/cstLostconfirmLoss.action?lstId=${cstLost.lstId}";
        }
    </script>

</head>

<body>

<div id="main">
    <div>
        <span id="title1">
		  <a href="../customer/custChurn.jsp">客户流失管理 > </a>
		  <a href="<%=request.getContextPath()%>/customer/cstLostfindById.action?lstId=${cstLost.lstId}">暂缓流失> </a>
		</span>
    </div>

    <div class="layui-btn-group globalHight">
        <button data-method="notice" class="layui-btn" type="button"  onclick="help()">帮助</button>
        <button class="layui-btn" onclick="back()">返回</button>
        <button class="layui-btn" onclick="confirm()">确认流失</button>
        <button class="layui-btn" id="save">保存</button>
    </div>

    <div>
     <form id="hold" action="cstLostmodify.action">
        <table class="layui-table" id="t">
            <colgroup>
                <col class="tit">
                <col class="content">
                <col class="tit">
                <col class="content">
            </colgroup>
            <tr>
                <td>编号</td>
                <td >
                    <input  type="text" readonly="readonly" name="cstLost.lstId" value="${cstLost.lstId}">
                    <%--<label name="cstLost.lstId">${cstLost.lstId}</label>--%>
                </td>
                <td>客户</td>
                <td>
                    <input  type="text"readonly="readonly" name="cstLost.lstCustName" value="${cstLost.lstCustName}">
                    <%--<label name="cstLost.lstCustName">${cstLost.lstCustName}</label>--%>
                </td>
            </tr>
            <tr>
                <td>客户经理</td>
                <td>
                    <input type="text" readonly="readonly" name="cstLost.lstCustManagerName" value="${cstLost.lstCustManagerName}">
                    <%--<label >${cstLost.lstCustManagerName}</label>--%>
                </td>
                <td>上次下单时间</td>
                <td>
                    <input  type="text" readonly="readonly" name="cstLost.lstLastOrderDate" value="${cstLost.lstLastOrderDate}">
                    <%--<label>${cstLost.lstLastOrderDate}</label>--%>
                </td>
            </tr>
            <tr>
                <td>暂缓措施</td>
                <td colspan="3">
                    <input  type="text" readonly="readonly" id="delay"  name="cstLost.lstDelay" value="${cstLost.lstDelay}" >
                    <%--<label>${cstLost.lstDelay}</label>--%>
                </td>
            </tr>
            <tr>
                <td>增加暂缓措施</td>
                <td colspan="3">
                    <textarea  rows="5" cols="40" id="delaytext">

                    </textarea>
                </td>
            </tr>

        </table>
         <input style="display: none" value="${cstLost.lstCustNo}" name="cstLost.lstCustNo" readonly="readonly"/>
         <input style="display: none" value="${cstLost.lstCustManagerId}" name="cstLost.lstCustManagerId" readonly="readonly"/>
         <input style="display: none" value="${cstLost.lstLostDate}" name="cstLost.lstLostDate" readonly="readonly"/>
         <input style="display: none" value="${cstLost.lstReason}" name="cstLost.lstReason" readonly="readonly"/>
         <input style="display: none" value="${cstLost.lstStatus}" name="cstLost.lstStatus" readonly="readonly"/>
     </form>
    </div>
</div>
</body>
</html>
