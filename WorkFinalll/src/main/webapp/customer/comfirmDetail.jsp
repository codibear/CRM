<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/18 0018
  Time: 13:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>确认流失</title>
    <link rel="stylesheet" href="../plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="../css/main.css" />
    <link rel="stylesheet" href="../customer/css/mitigate.css" />
    <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript"  src="../plugins/layui/layui.js" ></script>
    <script type="text/javascript">

        function back() {
            window.location.href="../customer/custChurn.jsp";
        }


        $(function () {
            $("#affirm").click(function () {

                var lstDate=new Date();
                var date = lstDate.getFullYear() + "-" + (lstDate.getMonth() + 1) + "-" + lstDate.getDate()
                        +" "+lstDate.getHours()+":"+lstDate.getMinutes()+":"+lstDate.getSeconds();
//                alert(date);
                $("#lstdate").val(date);
                $("#status").val("确认流失");
                $("#confirm").submit();
            })
        })
    </script>
</head>
<body>
<div id="main">
    <div>
        <span id="title1">
		  <a href="../custManagement/custChurn.jsp">客户流失管理 > </a>
		  <a href="${pageContext.request.contextPath}/customer/cstLostconfirmLoss.action?lstId=${cstLost.lstId}">确认流失></a>
		</span>
    </div>

    <div class="layui-btn-group globalHight">

        <button class="layui-btn" onclick="back()">返回</button>

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
                        <input type="text" readonly="readonly" name="cstLost.lstCustManagerName" value="${cstLost.lstCustManagerName}"/>
                        <%--<label>${cstLost.lstCustManagerName}</label>--%>
                    </td>
                    <td>上次下单时间</td>
                    <td>
                        <input type="text" readonly="readonly" name="cstLost.lstLastOrderDate" value="${cstLost.lstLastOrderDate}"/>
                        <%--<label>${cstLost.lstLastOrderDate}</label>--%>
                    </td>
                </tr>
                <tr>
                    <td>暂缓措施</td>
                    <td colspan="3">
                        <input  type="text" readonly="readonly" name="cstLost.lstDelay" value="${cstLost.lstDelay}"/>
                        <%--<label>${cstLost.lstDelay}</label>--%>
                    </td>
                </tr>
                <tr>
                    <td>流失原因</td>
                    <td colspan="3" >
                        <input readonly="readonly" value="${cstLost.lstReason}" name="cstLost.lstReason"   id="sel" />
                    </td>
                </tr>
                <tr>
                    <td>状态</td>
                    <td>
                        <input readonly="readonly" value="${cstLost.lstStatus}" name="cstLost.lstStatus" id="status" />
                    </td>
                    <td>流失时间</td>
                    <td>
                        <input readonly="readonly" value="${cstLost.lstLostDate}" name="cstLost.lstLostDate" id="lstdate" />
                    </td>
                </tr>
            </table>
            <input style="display: none" value="${cstLost.lstCustNo}" name="cstLost.lstCustNo" readonly="readonly"/>
            <input style="display: none" value="${cstLost.lstCustManagerId}" name="cstLost.lstCustManagerId" readonly="readonly"/>
            <%--<input style="display: none" value="${cstLost.lstLostDate}" name="cstLost.lstLostDate" readonly="readonly"/>--%>
            <%--<input style="display: none" value="${cstLost.lstStatus}" name="cstLost.lstStatus" />--%>
        </form>
    </div>
</div>
</body>
</html>
