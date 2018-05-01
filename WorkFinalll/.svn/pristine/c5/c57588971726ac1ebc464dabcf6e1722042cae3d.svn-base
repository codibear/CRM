<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
 
  User: Wang Bin
  Date: 2017/8/9
  Time: 14:01

--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="../plugins/layui/layui.js" ></script>
    <script type="text/javascript" src="../plugins/layui/lay/dest/layui.all.js" ></script>
    <link rel="stylesheet" href="../plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="../css/main.css" />
    <link rel="stylesheet" href="../customer/css/custInformation.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript">
        function SumNum() {
            var total=document.getElementById("orderM").value;
            var i=document.getElementById("orderM").value;
            var i2=document.getElementById("quotationImplementation").value;
            var i3=document.getElementById("quotationService").value;
            var i4=document.getElementById("quotationSpecialservice").value;
            var i5=document.getElementById("quotationBudget").value;
            total=parseFloat(total);
            i=parseFloat(i);
            i2=parseFloat(i2);
            i3=parseFloat(i3);
            i4=parseFloat(i4);
            i5=parseFloat(i5);
            if(i2==null){
                i2=0;
            }
            if(i3==null){
                i3=0;
            }
            if(i4==null){
                i4=0;
            }
            if(i5==null){
                i5=0;
            }
            total=i+i2+i3+i4+i5;
            var reg =/\d{9,}/ //;
            var flag=reg.test(total);
            if(flag==false){

                $("#total").val(total);}else {
                $("#quotationImplementation").val(0);
                $("#quotationService").val(0);
                $("#quotationSpecialservice").val(0);
                $("#quotationBudget").val(0);
                $("#total").val(0);
                layer.confirm('位数超限制！请输入8位以内数字', {
                    icon:6,
                    btn: ['确定'] //按钮
                });
            }
        }
        function  help() {
            //示范一个公告层
            layer.open({
                type: 1
                ,
                title: false //不显示标题栏
                ,
                closeBtn: false
                ,
                area: ['650px', '300px']
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
                content: '<div style="padding: 20px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><img src="<%=request.getContextPath()%>/images/报价处理详情.png" style="width:620px;height:300px"></div>'
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
                var quotationImplementation =$("#quotationImplementation").val();
                var quotationService=$("#quotationService").val();
                var quotationSpecialservice=$("#quotationSpecialservice").val();
                var quotationBudget=$("#quotationBudget").val();
                if(quotationImplementation==""||quotationService==""||quotationSpecialservice==""||quotationBudget==""){

                }else{
                    var formVal=$("#myForm").serialize();
                    $.post("<%=request.getContextPath()%>/quotationProcess/pageupdate.action",formVal,function(data) {
                        layer.confirm(data, {
                            icon:6,
                            btn: ['确定'] //按钮
                        }, function(){
                            location.href="<%=request.getContextPath()%>/quotationManagement/quotationShow.jsp";
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
		  <a href="">报价管理 ></a>
		  <a href="">报价处理 ></a>
		</span>
    </div>
    <form class="layui-form" id="myForm">
        <div class="layui-btn-group globalHight">
            <button data-method="notice" class="layui-btn" type="button"  onclick="help()">帮助</button>
            <a class="layui-btn" id="submit" lay-submit>保存</a>
            <%--<button class="layui-btn" lay-submit  lay-filter="formDemo" id="submit">保存</button>--%>
            <a href="<%=request.getContextPath()%>/quotationManagement/quotationShow.jsp" class="layui-btn"  lay-filter="formDemo">返回</a>
        </div>
        <div>
            <table class="layui-table"  style="text-align: center">
                <tr>
                    <td style="width: 150px;">客户名称</td>
                    <td>
                        <input type="text" id="cusName" name="quotation.clientName" value="${quotation.clientName}" readonly style="border:none;text-align: center;background-color: #F8F8F8">
                    </td>
                    <td style="width: 150px;">客户经理</td>
                    <td>
                        <input type="text"   value="${quotation.quotationCreater}" readonly style="border:none;text-align: center;background-color: #F8F8F8">
                    </td>
                    <td style="width: 100px;">状态</td>
                    <td  style="width: 150px;">
                        <label>${quotation.quotationStatus}</label>
                        <input type="hidden" name="quotation.quotationStatus">
                    </td>
                </tr>
            </table>
            <table  class="layui-table"  style="text-align: center">
                <tr>
                    <td>订单编号</td>
                    <td>产品名称</td>
                    <td>单价（元）</td>
                </tr>
                <c:forEach items="${goodses}" var="goods">
                    <tr>
                        <td>${quotation.orderId}</td>
                        <td>${goods.goodsName}</td>
                        <td>${goods.goodsPrice}</td>
                    </tr>
                </c:forEach>
                <tr>
                    <td>产品报价</td>
                    <td colspan="2">
                        <input type="text" id="orderM" name="quotation.quotationSales" value="${quotation.quotationSales}"  readonly required lay-verify="required">
                    </td>
                </tr>
                <tr>
                    <td >实施报价</td>
                    <td colspan="2">
                        <input type="text" value="${quotation.quotationImplementation}" required lay-verify="required" name="quotation.quotationImplementation" id="quotationImplementation" onchange="value=value.replace(/[^\d\.]/g,'');SumNum();" ><span> *</span>
                    </td>
                </tr>
                <tr>
                    <td>运维服务报价</td>
                    <td colspan="2">
                        <input type="text" value="${quotation.quotationService}" required lay-verify="required" name="quotation.quotationService" id="quotationService" onchange="value=value.replace(/[^\d\.]/g,'');SumNum();" ><span> *</span>
                    </td>
                </tr>
                <tr>
                    <td >专项服务报价</td>
                    <td colspan="2">
                        <input type="text" value="${quotation.quotationSpecialservice}" required lay-verify="required" name="quotation.quotationSpecialservice" id="quotationSpecialservice" onchange="value=value.replace(/[^\d\.]/g,'');SumNum();" ><span> *</span>
                    </td>
                </tr>
                <tr>
                    <td >项目损益预算</td>
                    <td colspan="2">
                        <input type="text" value="${quotation.quotationBudget}" required lay-verify="required" name="quotation.quotationBudget" id="quotationBudget" onchange="value=value.replace(/[^\d\.]/g,'');SumNum();" ><span> *</span>
                        <input type="hidden" value="${quotation.quotationId}" name="quotationId">
                    </td>
                </tr>
                <tr>
                    <td>合计</td>
                    <td colspan="2">
                        <input type="text" id="total" value="${quotation.quotationTotal}" name="quotation.quotationTotal"  required readonly lay-verify="required" ><span> *</span>
                    </td>
                </tr>
            </table>

        </div>
    </form>
</div>
</body>
</html>
