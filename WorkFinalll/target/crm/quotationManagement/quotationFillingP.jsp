<%--
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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/quotationManagement/css/filingP.css" />
    <script type="text/javascript" src="../plugins/layui/lay/dest/layui.all.js" ></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript">
        function  help() {
            //示范一个公告层
            layer.open({
                type: 1
                ,
                title: false //不显示标题栏
                ,
                closeBtn: false
                ,
                area: ['650px', '450px']
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
                content: '<div style="padding: 20px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><img src="<%=request.getContextPath()%>/images/归档详情.png" style="width:620px;height:350px"></div>'
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
        $(function () {
            $("#submit").click(function () {
                var email=$("#email").val();
                var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
                var flag=reg.test(email);
                if(flag==false){
                    layer.confirm('邮箱格式不正确', {
                        icon:6,
                        btn: ['确定'] //按钮
                    });

                }else{
                    var formVal=$("#myForm").serialize();
                    $.post("<%=request.getContextPath()%>/quotationProcess/pagesubmit.action",formVal,function (data) {

                    })
                    layer.confirm('上传成功', {
                        icon:6,
                        btn: ['确定'] //按钮
                    }, function(){
                        window.location.href="<%=request.getContextPath()%>/quotationManagement/quotationFilling.jsp";
                    });
                }
            })

        })

    </script>
</head>
<body>
<div id="main">
    <div>
        <span style="color: black;"> 报价管理 ></span>
        <a href="quotationFilling.jsp"><span style="color: black;">报价归档 ></span></a>
        <span style="color: black;">报价归档处理</span>
    </div>
    <form id="myForm" method="post" class="layui-form">
    <div class="layui-btn-group globalHight">
        <button data-method="notice" class="layui-btn" type="button"  onclick="help()">帮助</button>
        <button class="layui-btn"><a href="<%=request.getContextPath()%>/quotationManagement/quotationFilling.jsp" style="color: white">返回</a></button>
        <a class="layui-btn" id="submit" lay-submit>保存</a>
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
                <td>报价编号</td>
                <td>
                    <input type="hidden" value="${quotation.quotationId}" name="quotation.quotationId">
                    ${quotation.quotationId}
                </td>
                <td>产品报价</td>
                <td>
                    ${quotation.quotationSales}
                </td>
            </tr>
            <tr>
                <td>实施报价</td>
                <td>
                    ${quotation.quotationImplementation}
                </td>
                <td>服务报价</td>
                <td>
                    ${quotation.quotationService}
                </td>
            </tr>
            <tr>
                <td>专项服务报价</td>
                <td>
                    ${quotation.quotationSpecialservice}
                </td>
                <td>项目损益预算</td>
                <td>
                    ${quotation.quotationBudget}
                </td>
            </tr>
            <tr>
                <td>总价</td>
                <td>
                    ${quotation.quotationTotal}
                </td>
                <td>报单状态</td>
                <td>
                    ${quotation.quotationStatus}
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
                <td>报价创建人</td>
                <td>
                    ${quotation.quotationCreater}
                </td>
                <td>订单编号</td>
                <td>
                    ${quotation.orderId}
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
                <td>处理人</td>
                <td>
                    ${quotation.processor}
                </td>
                <td>处理结果</td>
                <td>
                    <label>已通过</label>
                </td>
            </tr>
            <tr>
                <td>客户名称</td>
                <td>
                    ${quotation.clientName}
                </td>
                <td>邮箱地址</td>
                <td>
                    <input id="email"name="email" type="text" placeholder="请输入您的邮箱:" required lay-verify="email"/>
                </td>
            </tr>
        </table>
    </div>
        </form>
</div>
</body>
</html>
