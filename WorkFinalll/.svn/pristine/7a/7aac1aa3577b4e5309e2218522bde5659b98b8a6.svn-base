<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/5
  Time: 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>服务处理</title>
    <link rel="stylesheet" href="/../plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="/../css/main.css" />
    <link rel="stylesheet" href="/css/serviceProcessing.css" />
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
                content: '<div style="padding: 20px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><img src="<%=request.getContextPath()%>/images/报价处理.png" style="width:620px;height:350px"></div>'
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
        function  partpage(t) {
            var v=$(t).attr("title");
//            var a=$(t).attr("id");
//     alert(v);
            var pageSize=$("#pageSize").val();
            var pageNo=parseInt(v);
            $("#pageNo").val(pageNo);
            $.get("${pageContext.request.contextPath}/quotation/pagegetPageNo.action",{currentPageNo:pageNo,pageSize:pageSize},function(data) {
                var tr="<tr>";
                $(data.datas).each(function(i,obj) {
                    var td=  "<td>"+obj.quotationId+"</td>"
                            +"<td>"+obj.orderId+"</td>"
                            +"<td>"+obj.quotationSales+"</td>"
                            +"<td>"+obj.quotationImplementation+"</td>"
                            +"<td>"+obj.quotationService+"</td>"
                            +"<td>"+obj.quotationSpecialservice+"</td>"
                            +"<td>"+obj.quotationBudget+"</td>"
                            +"<td>"+obj.quotationTotal+"</td>"
                            +"<td>"+obj.quotationStatus+"</td>"
                            +"<td>"+obj.quotationCreater+"</td>"
                            +"<td><a href='quotationAuditP.jsp'><i class='layui-icon'>&#xe614;</i></a></td>";
                    tr=tr+td+"</tr>";
                })
                $("#deptTable tr:gt(0)").remove();
                $("#deptTable").append(tr);
            });
            status();
        }
        $(function () {
            $("#before").click(function () {
                var pageSize=$("#pageSize").val();
                var pageNo= parseInt($("#pageNo").val());
                if(pageNo>=2){
                    $("#pageNo").val(pageNo-1);
                }
                $.get("${pageContext.request.contextPath}/quotation/pagebefore.action",{currentPageNo:pageNo,pageSize:pageSize},function(data) {
                    var tr="<tr>";
                    $(data.datas).each(function(i,obj) {
                        var td=  "<td>"+obj.quotationId+"</td>"
                                +"<td>"+obj.orderId+"</td>"
                                +"<td>"+obj.quotationSales+"</td>"
                                +"<td>"+obj.quotationImplementation+"</td>"
                                +"<td>"+obj.quotationService+"</td>"
                                +"<td>"+obj.quotationSpecialservice+"</td>"
                                +"<td>"+obj.quotationBudget+"</td>"
                                +"<td>"+obj.quotationTotal+"</td>"
                                +"<td>"+obj.quotationStatus+"</td>"
                                +"<td>"+obj.quotationCreater+"</td>"
                                + "<td><a href='quotationAuditP.jsp'><i class='layui-icon'>&#xe614;</i></a></td>";
                        tr=tr+td+"</tr>";
                    })
                    $("#deptTable tr:gt(0)").remove();
                    $("#deptTable").append(tr);
                });
                status();
            })
            $("#after").click(function () {
                var pageSize=parseInt($("#pageSize").val());
                var pageNo= parseInt($("#pageNo").val());
                var totalPageNo=parseInt($("#totalNo").val());
                if(pageNo<=totalPageNo-1){
                    $("#pageNo").val(pageNo+1);
                }
                $.get("${pageContext.request.contextPath}/quotation/pageafter.action",{currentPageNo:pageNo,totalPageNo:totalPageNo,pageSize:pageSize},function(data) {
                    var tr="<tr>";
                    $(data.datas).each(function(i,obj) {
                        var td=  "<td>"+obj.quotationId+"</td>"
                                +"<td>"+obj.orderId+"</td>"
                                +"<td>"+obj.quotationSales+"</td>"
                                +"<td>"+obj.quotationImplementation+"</td>"
                                +"<td>"+obj.quotationService+"</td>"
                                +"<td>"+obj.quotationSpecialservice+"</td>"
                                +"<td>"+obj.quotationBudget+"</td>"
                                +"<td>"+obj.quotationTotal+"</td>"
                                +"<td>"+obj.quotationStatus+"</td>"
                                +"<td>"+obj.quotationCreater+"</td>"
                                + "<td><a href='quotationAuditP.jsp'><i class='layui-icon'>&#xe614;</i></a></td>";
                        tr=tr+td+"</tr>";
                    })
                    $("#deptTable tr:gt(0)").remove();
                    $("#deptTable").append(tr);
                });
                status();
            })
            $("#select").click(function () {
                var Id=$("#quotationId").val();
                var quotationId=$("#quotationId").val();
                var quotationCreater=$("#quotationCreater").val();
                var quotationStatus=$("#QuotationStatus").val()
                if(Id==""&&quotationCreater==""){
                    alert("请输入您要查询的内容!");
                }else{
                    $.get("${pageContext.request.contextPath}/quotationSel/pagefindBySome.action",{quotationId:quotationId,quotationCreater:quotationCreater,quotationStatus:quotationStatus},function(data) {
                        var tr="<tr>";
                        $(data).each(function(i,obj) {
                            var td=  "<td>"+obj.quotationId+"</td>"
                                    +"<td>"+obj.orderId+"</td>"
                                    +"<td>"+obj.quotationSales+"</td>"
                                    +"<td>"+obj.quotationImplementation+"</td>"
                                    +"<td>"+obj.quotationService+"</td>"
                                    +"<td>"+obj.quotationSpecialservice+"</td>"
                                    +"<td>"+obj.quotationBudget+"</td>"
                                    +"<td>"+obj.quotationTotal+"</td>"
                                    +"<td>"+obj.quotationStatus+"</td>"
                                    +"<td>"+obj.quotationCreater+"</td>"
                                    + "<td><a href='quotationAuditP.jsp'><i class='layui-icon'>&#xe614;</i></a></td>";
                            tr=tr+td+"</tr>";
                        })
                        $("#deptTable tr:gt(0)").remove();
                        $("#deptTable").append(tr);
                    })
                }
            })
            $("#pageSize").change(function() {
//                获取每页显示条数
                var pageSize=$("#pageSize").val();
                var pageNo=parseInt(document.getElementById("pageNo").value);
//           alert(pageSize);
//          alert(pageNo);
                $.get("${pageContext.request.contextPath}/quotation/pagepartPage.action",{pageSize:pageSize,currentPageNo:1},function (data) {
                    var tr="<tr>";
                    $(data.datas).each(function(i,obj) {
                        var td=  "<td>"+obj.quotationId+"</td>"
                                +"<td>"+obj.orderId+"</td>"
                                +"<td>"+obj.quotationSales+"</td>"
                                +"<td>"+obj.quotationImplementation+"</td>"
                                +"<td>"+obj.quotationService+"</td>"
                                +"<td>"+obj.quotationSpecialservice+"</td>"
                                +"<td>"+obj.quotationBudget+"</td>"
                                +"<td>"+obj.quotationTotal+"</td>"
                                +"<td>"+obj.quotationStatus+"</td>"
                                +"<td>"+obj.quotationCreater+"</td>"
                                + "<td><a href='quotationAuditP.jsp'><i class='layui-icon'>&#xe614;</i></a></td>";
                        tr=tr+td+"</tr>";
                    })
                    $("#deptTable tr:gt(0)").remove();
                    $("#deptTable").append(tr);
                    var totalPageNo=data.totalPageNo;
                    $("#totalNo").val(totalPageNo);
                    $("#totalPageNo").empty();

                    for(var i=1;i<=totalPageNo;i++){
                        $("#totalPageNo").append("<a  id='"+i+"'  title='"+i +"'href='#'   onclick='partpage(this)' style='padding-left: 5px;border: 1px solid gray;text-decoration: none' >"+i+"</a>&nbsp;&nbsp;&nbsp;");
                    }
                    document.getElementById(1).style.backgroundColor="red";
                });
                status();

            });

        })
        function status() {
            var pageNo=parseInt(document.getElementById("pageNo").value);
            document.getElementById(pageNo).style.backgroundColor="red";
            var totalNo=parseInt(document.getElementById("totalNo").value);
            for(var i=1;i<=totalNo;i++){
                if(pageNo!=i){
                    document.getElementById(i).style.backgroundColor="white";
                }
            }
        }
        window.onload=function(){
            var pageNo=parseInt(document.getElementById("pageNo").value);
            var pageSize=parseInt(document.getElementById("pageSize").value);
            $.get("${pageContext.request.contextPath}/quotation/pagegetPage.action",{pageSize:pageSize,currentPageNo:pageNo},function (data) {
                var tr="<tr>";
                $(data.datas).each(function(i,obj) {
                    var td=  "<td>"+obj.quotationId+"</td>"
                            +"<td>"+obj.ClientName+"</td>"
                            +"<td>"+obj.orderId+"</td>"
                            +"<td>"+obj.quotationImplementation+"</td>"
                            +"<td>"+obj.quotationService+"</td>"
                            +"<td>"+obj.quotationSpecialservice+"</td>"
                            +"<td>"+obj.quotationBudget+"</td>"
                            +"<td>"+obj.quotationTotal+"</td>"
                            +"<td>"+obj.quotationStatus+"</td>"
                            +"<td>"+obj.quotationCreater+"</td>"
                            + "<td>"+"<a href='<%=request.getContextPath()%>/quotationPro/proprocess.action?quotationId="+obj.quotationId+" ' class='layui-btn layui-btn-small layui-btn-primary'  title='编辑'>"+
                            "<i class='layui-icon'>&#xe642;</i></a>"+"</td>";
                    tr=tr+td+"</tr>";
                })
                $("#deptTable tr:gt(0)").remove();
                $("#deptTable").append(tr);
                var totalPageNo=data.totalPageNo;
                $("#totalNo").val(totalPageNo);
                $("#totalPageNo").empty();

                for(var i=1;i<=totalPageNo;i++){
                    $("#totalPageNo").append("<a  id='"+i +"'  title='"+i+"'href='#'   onclick='partpage(this)' style='padding-left: 5px;border: 1px solid gray;text-decoration: none' >"+i+"</a>&nbsp;&nbsp;&nbsp;");
                }
                document.getElementById(1).style.backgroundColor="red";
            });

        }



    </script>
</head>
<body>
<div id="main">
    <div>
        <span>
		  <a href="">客户服务管理 ></a>
		  <a href="">服务处理 ></a>
		</span>
    </div>

    <div class="layui-btn-group globalHight">
        <button class="layui-btn">帮助</button>
        <button class="layui-btn">查询</button>
    </div>

    <div>
        <table class="layui-table">
            <tr>
                <td>编号</td>
                <td>
                    <input class="text1" type="text">
                </td>
                <td>概要</td>
                <td>
                    <input class="text1" type="text">
                </td>
                <td>服务类型</td>
                <td>
                    <select>
                        <option value="">咨询</option>
                        <option value="" selected="">全部</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>创建日期</td>
                <td colspan="3">
                    <input class="text2" type="text">
                    <span>--</span>
                    <input class="text2" type="text">
                </td>
                <td>状态</td>
                <td>
                    <select>
                        <option value="">咨询</option>
                        <option value="">新创建</option>
                        <option value="" selected="">已分配</option>
                    </select>
                </td>
            </tr>
        </table>
        <table class="layui-table" id="deptTable">
            <tr>
                <td>编号</td>
                <td>客户</td>
                <td>概要</td>
                <td>服务类型</td>
                <td>创建人</td>
                <td>创建日期</td>
                <td>操作</td>
            </tr>
        </table>

    </div>

</div>
</body>
</html>
