<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/5
  Time: 14:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<html>
<head>
    <title>报价审核</title>
    <script type="text/javascript" src="<%=request.getContextPath()%>/plugins/layui/layui.js" ></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/plugins/layui/lay/dest/layui.all.js" ></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/quotationManagement/css/serviceP.css" />
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
                content: '<div style="padding: 20px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><img src="<%=request.getContextPath()%>/images/审核详情.png" style="width:620px;height:350px"></div>'
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
                var processor=$("#processor").val();
                if(processor==""){
                }else{
                var formVal=$("#myForm").serialize();
                $.post("<%=request.getContextPath()%>/quotationPro/prosave.action",formVal,function (data) {
                    layer.confirm(data,{
                        icon:6,
                        btn: ['确定'] //按钮
                    }, function(){
                        window.location.href="<%=request.getContextPath()%>/quotationManagement/quotationAudit.jsp";
                    });
                })

            }
            })

        })

    </script>
</head>
<body>
<div id="main">
    <div>
        <span>
		  <a href="">客户服务管理 ></a>
		  <a href="">报价审核 ></a>
		</span>
    </div>
<form id="myForm" method="post" class="layui-form">
    <div class="layui-btn-group globalHight">
        <button data-method="notice" class="layui-btn" type="button"  onclick="help()">帮助</button>
        <a class="layui-btn" id="submit" lay-submit>保存</a>
        <a href="<%=request.getContextPath()%>/quotationManagement/quotationAudit.jsp" class="layui-btn"  lay-filter="formDemo">返回</a>
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
                    <label >${quotation.quotationId}</label>
                </td>
                <td>产品报价</td>
                <td>
                    <label>${quotation.quotationSales}</label>
                </td>
            </tr>
            <tr>
                <td>实施报价</td>
                <td colspan="3">
                    <label>${quotation.quotationImplementation}</label>
                </td>
            </tr>
            <tr>
                <td>服务报价</td>
                <td>
                    <label>${quotation.quotationService}</label>
                </td>
                <td>专项服务报价</td>
                <td>
                    <label>${quotation.quotationSpecialservice}</label>
                </td>
            </tr>
            <tr>
                <td>项目损益预算</td>
                <td colspan="3">
                    <label>${quotation.quotationBudget}</label>
                </td>
            </tr>
            <tr>
                <td>总价</td>
                <td>
                    <label>${quotation.quotationTotal}</label>
                </td>
                <td>报单状态</td>
                <td>
                    <label>${quotation.quotationStatus}</label>
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
                    <label>${quotation.quotationCreater}</label>
                </td>
                <td>订单编号</td>
                <td>
                    <label>${quotation.orderId}</label>
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
                    <input id="processor" value="${user.userName}" name="quotation.processor" type="text" placeholder="请输入您的姓名:" required readonly lay-verify="required"/>
                    <span> *</span>
                    <input type="hidden" value="${user.userId}" name="quotation.processorNo"/>
                </td>
                <td>处理结果</td>
                <td>
                    <select style="display: block;width: 100px" id="select" name="quotation.quotationStatus">
                        <c:forEach items="${quotationStatus}" var="quotationS">
                        <option value="${quotationS.quotationStatus}">${quotationS.quotationStatus}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
        </table>
    </div>
</form>
</div>

</body>
</html>
