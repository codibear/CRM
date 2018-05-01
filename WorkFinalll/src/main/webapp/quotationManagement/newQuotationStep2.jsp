<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
 
  User: Wang Bin
  Date: 2017/8/9
  Time: 14:01
  
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
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
        $(function () {
            var cars=$("#cur");
            var new_opts;
            $.get("${pageContext.request.contextPath}/customer/customerfindUser.action",function (data) {
//                alert(data);
                $(data).each(function (i,obj) {
                    var new_opt = "<option value='"+obj.userId+"'>"+obj.userName+"</option>";
                    new_opts +=new_opt;
                })
                cars.append(new_opts);
            })
        })
        //        求和
        function SumNum() {
            var total=document.getElementById("orderM").value;
            var i=document.getElementById("orderM").value;
            var i2=document.getElementById("qiM").value;
            var i3=document.getElementById("qsM").value;
            var i4=document.getElementById("qssM").value;
            var i5=document.getElementById("qbM").value;
            total=parseFloat(total);
            i=parseFloat(i);
            i2=parseFloat(i2);
            i3=parseFloat(i3);
            i4=parseFloat(i4);
            i5=parseFloat(i5);
            if(i==null){
                i=0;
            }
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
                $("#qiM").val(0);
                $("#qsM").val(0);
                $("#qssM").val(0);
                $("#qbM").val(0);
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
                content: '<div style="padding: 20px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><img src="<%=request.getContextPath()%>/images/报价创建详情.png" style="width:620px;height:300px"></div>'
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
        <span>
		  <a href="">客户服务管理 ></a>
		  <a href="">报价创建 </a>
		</span>
    </div>
    <form class="layui-form">
        <div class="layui-btn-group globalHight">
            <button data-method="notice" class="layui-btn" type="button"  onclick="help()">帮助</button>
            <a class="layui-btn" id="save" lay-submit>保存</a>
            <a href="<%=request.getContextPath()%>/quotationManagement/newQuotationStep1.jsp" class="layui-btn"  lay-filter="formDemo">返回</a>
        </div>
        <div>
            <table class="layui-table" style="text-align: center">
                <tr >
                    <td>客户名称</td>
                    <td>
                        <input type="text" id="cusName" name="quotation.clientName" value="${order.orderCusName}" readonly style="border:none;text-align: center;background-color: #F8F8F8">
                    </td>
                    <td>送货地址</td>
                    <td id="addr">${order.orderAddr}</td>
                </tr>
                <tr>
                    <td>客户经理</td>
                    <td>
                        <select style="display: block; width: 90px;height: 40px; " id="cur" name="quotation.quotationCreaterNo">
                            <option value="" selected="">请选择</option>
                        </select>
                    </td>
                    <td>状态</td>
                    <td>
                        <input type="text" id="status" name="quotation.quotationStatus" readonly value="未审核">
                    </td>
                </tr>
            </table>
            <table  class="layui-table" style="text-align: center">
                <tr>
                    <td>订单编号</td>
                    <td>产品名称</td>
                    <td>单价（元）</td>
                </tr>
                <c:forEach items="${goodses}" var="goods">
                    <tr>
                        <td><input type="text"  value="${order.orderId}" id="order" readonly  style="border:none;text-align: center;background-color: #F8F8F8"></td>
                        <td><input type="text"value="${goods.goodsName}" readonly name="goodsName" style="border:none;text-align: center;background-color: #F8F8F8"></td>
                        <td id="goodsP">${goods.goodsPrice}</td>
                    </tr>
                </c:forEach>
                <input type="hidden" id="goods" name="quotation.goodsName"/>
                <input type="hidden" name="quotation.orderId" id="orderId"/>
                <tr>
                    <td>产品报价</td>
                    <td colspan="2">
                        <input type="text" id="orderM" name="quotation.quotationSales" value="${order.orderMoney}"  readonly required lay-verify="required">
                    </td>
                </tr>
                <tr>
                    <td >实施报价</td>
                    <td colspan="2">
                        <input type="text" id="qiM" name="quotation.quotationImplementation" onchange="value=value.replace(/[^\d\.]/g,'');SumNum();"  required lay-verify="required"><span> *</span>
                    </td>
                </tr>
                <tr>
                    <td >运维服务报价</td>
                    <td colspan="2">
                        <input type="text" id="qsM" name="quotation.quotationService" onchange="value=value.replace(/[^\d\.]/g,'');SumNum();"  required lay-verify="required"><span> *</span>
                    </td>
                </tr>
                <tr>
                    <td >专项服务报价</td>
                    <td colspan="2">
                        <input type="text" id="qssM" name="quotation.quotationSpecialservice" onchange="value=value.replace(/[^\d\.]/g,'');SumNum();"  required lay-verify="required"><span> *</span>
                    </td>
                </tr>
                <tr>
                    <td >项目损益预算</td>
                    <td colspan="2">
                        <input type="text" id="qbM" name="quotation.quotationBudget" onchange="value=value.replace(/[^\d\.]/g,'');SumNum();"  required lay-verify="required"><span> *</span>
                    </td>
                </tr>
                <tr>
                    <td >合计</td>
                    <td colspan="2">
                        <input type="text" id="total" name="quotation.quotationTotal" required readonly lay-verify="required" ><span> *</span>
                    </td>
                </tr>
            </table>
        </div>

    </form>
</div>
</body>
<script type="text/javascript">
    $(function () {
        $("#save").click(function () {
            var cur=$("#cur").val();
            var orderM=$("#orderM").val();
            var qiM=$("#qiM").val();
            var  qsM=$("#qsM").val();
            var qssM=$("#qssM").val();
            var qbm=$("#qbM").val();
            var order=$("#order").val();
            var goodsName=document.getElementsByName("goodsName");
            var s="";
            for(var i=0;i<goodsName.length;i++){
                s+=goodsName[i].value+" ";
            }
            document.getElementById("goods").value=s;
            document.getElementById("orderId").value=order;
            if(orderM==""||qiM==""||qssM==""||qsM==""||qbm==""){
            }
            if(cur==""){
//                alert("客户经理未选择！")
                layer.confirm('客户经理未选择！', {
                    icon:6,
                    btn: ['确定'] //按钮
                });
            }
            else{
                $.post("<%=request.getContextPath()%>/quotation/pagesave.action",$("form").serialize(),function (data) {
                    layer.confirm(data, {
                        icon:6,
                        btn: ['确定'] //按钮
                    }, function(){
                        location.href="<%=request.getContextPath()%>/quotationManagement/newQuotationStep1.jsp";
                    });
                })
            }
        })
    })
</script>
</html>
