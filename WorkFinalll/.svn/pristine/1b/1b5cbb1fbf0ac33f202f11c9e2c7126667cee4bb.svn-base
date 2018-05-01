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
    <title>确认流失</title>
    <link rel="stylesheet" href="../plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="../css/main.css" />
    <link rel="stylesheet" href="../customer/css/mitigate.css"/>
    <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="../plugins/layui/layui.js"></script>
    <script type="text/javascript">
        //        layui.use('layer', function(){
        //            var layer = layui.layer;
        //        });
        $(function () {
            layui.use('layer', function () {
                var layer = layui.layer;
                var index = layer.load(1, {
                    shade: [0.1, '#fff'],
                    time: 500//0.1透明度的白色背景
                });
            });
            $("#affirm").click(function () {

                var lstDate = new Date();
                var date = lstDate.getFullYear() + "-" + (lstDate.getMonth() + 1) + "-" + lstDate.getDate()
                        + " " + lstDate.getHours() + ":" + lstDate.getMinutes() + ":" + lstDate.getSeconds();
//                alert(date);
                $("#lstdate").val(date);
                $("#status").val("确认流失");
                $("#confirm").submit();
            })
        })

        //        //帮助按钮弹出框方法
        function help() {
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
                content: '<div style="padding: 20px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><img src="../images/help_comfirmLoss.png.png" ></div>'
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
		  <a href="../customer/custChurn.jsp">客户流失管理 > </a>
		  <a href="${pageContext.request.contextPath}/customer/cstLostconfirmLoss.action?lstId=${cstLost.lstId}">确认流失></a>
		</span>
    </div>

    <div class="layui-btn-group globalHight">
        <button data-method="notice" class="layui-btn" type="button" onclick="help()">帮助</button>
        <%--<a href="../customer/custChurn.jsp"><button class="layui-btn">返回</button></a>--%>
        <%--<a href="mitigate.jsp"><button class="layui-btn">暂缓流失</button></a>--%>
        <button class="layui-btn" id="affirm">保存</button>
    </div>

    <div>
        <form id="confirm" action="cstLostmodify.action">
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
                    <input type="text" readonly="readonly" name="cstLost.lstId" value="${cstLost.lstId}"/>
                    <%--<label>${cstLost.lstId}</label>--%>
                </td>
                <td>客户</td>
                <td>
                    <input type="text" readonly="readonly" name="cstLost.lstCustName" value="${cstLost.lstCustName}"/>
                    <%--<label>${cstLost.lstCustName}</label>--%>
                </td>
            </tr>
            <tr>
                <td>客户经理</td>
                <td>
                    <input type="text" readonly="readonly" name="cstLost.lstCustManagerName"
                           value="${cstLost.lstCustManagerName}"/>
                    <%--<label>${cstLost.lstCustManagerName}</label>--%>
                </td>
                <td>上次下单时间</td>
                <td>
                    <input type="text" readonly="readonly" name="cstLost.lstLastOrderDate"
                           value="${cstLost.lstLastOrderDate}"/>
                    <%--<label>${cstLost.lstLastOrderDate}</label>--%>
                </td>
            </tr>
            <tr>
                <td>暂缓措施</td>
                <td colspan="3">
                    <input type="text" readonly="readonly" name="cstLost.lstDelay" value="${cstLost.lstDelay}"/>
                    <%--<label>${cstLost.lstDelay}</label>--%>
                </td>
            </tr>
            <tr>
                <td>流失原因</td>
                <td colspan="3" >
                    <select id="sel" name="cstLost.lstReason">
                        <option>${cstLost.lstReason}</option>
                        <option>企业内部员工流动导致客户流失</option>
                        <option>客户遭遇新诱惑</option>
                        <option>市场监控不力，销管渠道不畅</option>
                        <option>缺失诚信</option>
                        <option>细节的疏忽使客户离去</option>
                        <option>其他</option>
                    </select>
                </td>
            </tr>
            <tr>
                <input style="display: none" value="${cstLost.lstStatus}" name="cstLost.lstStatus" id="status"/>
                <input style="display: none" value="${cstLost.lstLostDate}" name="cstLost.lstLostDate" id="lstdate"/>
            </tr>
        </table>
            <input style="display: none" value="${cstLost.lstCustNo}" name="cstLost.lstCustNo" readonly="readonly"/>
            <input style="display: none" value="${cstLost.lstCustManagerId}" name="cstLost.lstCustManagerId"
                   readonly="readonly"/>
            <%--<input style="display: none" value="${cstLost.lstLostDate}" name="cstLost.lstLostDate" readonly="readonly"/>--%>
            <%--<input style="display: none" value="${cstLost.lstStatus}" name="cstLost.lstStatus" />--%>
        </form>
    </div>
</div>
</body>
</html>
