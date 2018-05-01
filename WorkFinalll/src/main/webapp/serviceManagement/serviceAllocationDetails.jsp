<%--
  Created by IntelliJ IDEA.
  User: xiaowei
  Date: 2017/8/13
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*"%> <!--获取系统时间必须导入的-->
<%@ page import="java.text.*"%>
<%@ page import="com.chinasofti.crm.domain.User" %>
<!--获取系统时间必须导入的-->
<html>
<head>
    <title>服务处理</title>
    <script type="text/javascript" src="../js/jquery-1.8.3.min.js" ></script>
    <script type="text/javascript" src="../plugins/layui/layui.js" ></script>
    <script type="text/javascript" src="../plugins/layui/lay/dest/layui.all.js" ></script>
    <link rel="stylesheet" href="../plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="../css/main.css" />
    <link rel="stylesheet" href="../serviceManagement/css/serviceP.css" />
    <link rel="stylesheet" href="../kindeditor/themes/default/default.css" />
    <link rel="stylesheet" href="../kindeditor/plugins/code/prettify.css" />
    <script charset="utf-8" src="../kindeditor/kindeditor-all-min.js"></script>
    <script charset="utf-8" src="../kindeditor/zh-CN.js"></script>
    <script charset="utf-8" src="../kindeditor/prettify.js"></script>

    <%
        String datetime=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(Calendar.getInstance().getTime()); //获取系统时间
    %>
    <%--<%--%>
        <%--User user = (User) session.getAttribute("user");--%>
        <%--String name =  user.getUserName();--%>
    <%--%>--%>
    <script type="text/javascript">

        //获取客户经理
        $(function () {
            var dealUser=$("#serviceDealUser");
            var new_opts;
            $.get("${pageContext.request.contextPath}/customer/customerfindUser.action",function (data) {
                $(data).each(function (i,obj) {
                    var option = "<option value="+'"'+obj.userName+'"'+">"+obj.userName+"</option>";
                    new_opts +=option;
                })
                $("#serviceDealUser").append(new_opts);
            })
        })


        //  时间戳
        function formatDateTime(inputTime) {
            var date = new Date(inputTime);
            var y = date.getFullYear();
            var m = date.getMonth() + 1;
            m = m < 10 ? ('0' + m) : m;
            var d = date.getDate();
            d = d < 10 ? ('0' + d) : d;
            var h = date.getHours();
            h = h < 10 ? ('0' + h) : h;
            var minute = date.getMinutes();
            var second = date.getSeconds();
            minute = minute < 10 ? ('0' + minute) : minute;
            second = second < 10 ? ('0' + second) : second;
            return y + '-' + m + '-' + d+' '+h+':'+minute+':'+second;
        };
    </script>


</head>
<body>
<div id="main">
    <div>
        <span style="color: black;">客户服务管理 ></span>
        <a href="serviceProcessing.jsp"><span style="color: black;" >服务处理 ></span></a>
        <span style="color: black;">服务处理详情</span>
    </div>
    <form class="layui-form">

        <div class="layui-btn-group globalHight">
            <a data-method="notice" class="layui-btn" type="button"  onclick="help()">帮助</a>
            <a class="layui-btn"lay-submit="" id="Allo">分配</a>
            <a href="<%=request.getContextPath()%>/serviceManagement/serviceAllocation.jsp"class="layui-btn">返回</a>
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
                        <label>${serviceAllo.serviceId}</label>
                    </td>
                    <td>服务类型</td>
                    <td>
                        <label>${serviceAllo.serviceType}</label>
                    </td>
                </tr>
                <tr>
                    <td>概要</td>
                    <td colspan="3">
                        <label>${serviceAllo.serviceOutline}</label>
                    </td>
                </tr>
                <tr>
                    <td>客户</td>
                    <td>
                        <label>${serviceAllo.cusName}</label>
                    </td>
                    <td>状态</td>
                    <td>
                        <label>${serviceAllo.serviceState}</label>
                    </td>
                </tr>
                <tr>
                    <td>服务请求</td>
                    <td colspan="3">
                        <label>${serviceAllo.serviceRequest}</label>
                    </td>
                </tr>
                <tr>
                    <td>创建人</td>
                    <td>
                        <label>${serviceAllo.serviceCreateUser}</label>
                    </td>
                    <td>创建时间</td>
                    <td>
                        <label>${serviceAllo.serviceCreateTime}</label>
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
                        <select  id="serviceDealUser" required="required" name="service.serviceDealUser" lay-verify="required" style="display: block; width: 50%;height: 40px; ">
                            <option value="" selected="">请选择</option>
                        </select>
                    </td>
                    <td></td>
                    <td>

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
                    <!--通过session获取当前登录用户-->
                    <td>处理人</td>
                    <td>
                        <input id="serviceAlloUser" type="text" readonly="readonly" name="service.serviceAlloUser" value="${user.userName}"/>
                        <span> *</span>
                    </td>
                    <td>分配时间</td>
                    <td>
                        <input id="serviceAlloTime" value="<%=datetime%>" readonly="readonly" name="service.serviceAlloTime"/><span> *</span>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</div>
<!--保存的方法--->
<script type="text/javascript">
    $(function () {
        var serviceDealUser;
        $("#Allo").click(function () {
            serviceDealUser =$("#serviceDealUser").val();
            if(serviceDealUser!=""){
                $.post("<%=request.getContextPath()%>/service/serviceaddAllo.action",$("form").serialize(),function (data) {
                    layer.confirm(data, {
                        icon:6,
                        btn: ['确定'] //按钮
                    }, function(){
                        location.href="<%=request.getContextPath()%>/serviceManagement/serviceAllocation.jsp" ;
                    });
                })
            }
        })
    })

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
            content: '<div style="padding: 20px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><img src="<%=request.getContextPath()%>/images/serviceAllocationDetails.png" ></div>',
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
