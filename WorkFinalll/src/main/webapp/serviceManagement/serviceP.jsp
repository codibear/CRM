<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/5
  Time: 14:06
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
        <a class="layui-btn"lay-submit="" id="modify">保存</a>
        <a href="<%=request.getContextPath()%>/serviceManagement/serviceProcessing.jsp"class="layui-btn">返回</a>
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
                    <label>
                    ${service.serviceCreateTime}
                    </label>
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
                    <textarea name="service.serviceDealContent" id="serviceDealContent"  required lay-verify="required"  style="width:900px;height:200px;"></textarea>
                    <span style="float: right;padding-right: 220px"> *</span>
                    <script language = "JavaScript">
                        KindEditor.ready(function(K) {
                            var editor1 = K.create('textarea[name="service.serviceDealContent"]', {
                                cssPath : '<%=request.getContextPath()%>/kindeditor/plugins/code/prettify.css',
                                uploadJson : '<%=request.getContextPath()%>/kindeditor/jsp/upload_json.jsp',
                                fileManagerJson : '<%=request.getContextPath()%>/kindeditor/jsp/file_manager_json.jsp',
                                allowFileManager : true,
                                afterCreate : function() {
                                    var self = this;
                                    K.ctrl(document, 13, function() {
                                        self.sync();
                                        K('form[name=myform]')[0].submit();
                                    });
                                    K.ctrl(self.edit.doc, 13, function() {
                                        self.sync();
                                        K('form[name=myform]')[0].submit();
                                    });
                                },
                                afterBlur: function(){this.sync();}
                            });
                            prettyPrint();
                        });
                    </script>
                </td>
            </tr>
            <tr>
                <!--通过session获取当前登录用户-->
                <td>处理人</td>
                <td>
                    <input id="service.serviceDealUser" type="text" readonly="readonly" name="service.serviceDealUser" value=${user.userName}>
                    <span> *</span>
                </td>
                <td>处理时间</td>
                <td>
                    <input id="service.serviceDealtime" value="<%=datetime%>" readonly="readonly" name="service.serviceDealTime"/><span> *</span>
                </td>
            </tr>
        </table>
    </div>
</form>
</div>
<!--保存的方法--->
<script type="text/javascript">
    //查询验证
    $(function(){
        $("#modify").click(function() {
            var serviceDealContent=$("#serviceDealContent").val();
            if(serviceDealContent.trim()!=""){
                $.post("<%=request.getContextPath()%>/service/servicemodify.action",$("form").serialize(),function (data) {
                    layer.confirm(data, {
                        icon:6,
                        btn: ['确定'] //按钮
                    }, function(){
                        location.href="<%=request.getContextPath()%>/serviceManagement/serviceProcessing.jsp" ;
                    });
                })
            }

        });
    }) ;

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
            content: '<div style="padding: 20px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><img src="<%=request.getContextPath()%>/images/serviceP.png" style="width:620px;height:350px"></div>',
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
