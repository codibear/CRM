<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/5
  Time: 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>服务反馈</title>

    <link rel="stylesheet" href="../plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="../css/main.css" />
    <link rel="stylesheet" href="../serviceManagement/css/serviceFeedback.css" />
    <script type="text/javascript" src="../plugins/layui/lay/dest/layui.all.js" ></script>
    <script type="text/javascript" src="../plugins/layui/layui.js" charset="utf-8"></script>
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
            var quotationStatus=$("#quotationStatus").val();
            var quotationId=$("#quotationId").val();
            var userId=${user.userId};
            var v=$(t).attr("title");
//            var a=$(t).attr("id");
//     alert(v);
            var pageSize=$("#pageSize").val();
            var pageNo=parseInt(v);
            $("#pageNo").val(pageNo);
            $.get("${pageContext.request.contextPath}/quotationProcess/pagegetPageNo.action",{currentPageNo:pageNo,pageSize:pageSize,quotationStatus:quotationStatus,quotationId:quotationId,quotationCreaterNo:userId},function(data) {
                var tr="<tr>";
                $(data.datas).each(function(i,obj) {
                    var td=  "<td>"+obj.quotationId+"</td>"
                            +"<td>"+obj.clientName+"</td>"
                            +"<td>"+obj.orderId+"</td>"
                            +"<td>"+obj.goodsName+"</td>"
                            +"<td>"+obj.quotationCreater+"</td>"
                            +"<td>"+obj.quotationStatus+"</td>"
                            + "<td>"+"<a href='<%=request.getContextPath()%>/quotationProcess/pageprocess.action?quotationId="+obj.quotationId+"&orderId="+obj.orderId+" ' class='layui-btn layui-btn-small layui-btn-primary'  title='编辑'>"+
                            "<i class='layui-icon'>&#xe642;</i></a>"+"</td>";
                    tr=tr+td+"</tr>";
                })
                $("#deptTable tr:gt(0)").remove();
                $("#deptTable").append(tr);
            });
            status();
        }
        $(function () {

            $("#before").click(function () {
                var quotationStatus=$("#quotationStatus").val();
                var quotationId=$("#quotationId").val();
                var pageSize=$("#pageSize").val();
                var pageNo= parseInt($("#pageNo").val());
                var quotationCreaterNo=${user.userId};
                if(pageNo>=2){
                    $("#pageNo").val(pageNo-1);
                }
                $.get("${pageContext.request.contextPath}/quotationProcess/pagebefore.action",{currentPageNo:pageNo,pageSize:pageSize,quotationStatus:quotationStatus,quotationId:quotationId,quotationCreaterNo:quotationCreaterNo},function(data) {
                    var tr="<tr>";
                    $(data.datas).each(function(i,obj) {
                        var td=  "<td>"+obj.quotationId+"</td>"
                                +"<td>"+obj.clientName+"</td>"
                                +"<td>"+obj.orderId+"</td>"
                                +"<td>"+obj.goodsName+"</td>"
                                +"<td>"+obj.quotationCreater+"</td>"
                                +"<td>"+obj.quotationStatus+"</td>"
                                + "<td>"+"<a href='<%=request.getContextPath()%>/quotationProcess/pageprocess.action?quotationId="+obj.quotationId+"&orderId="+obj.orderId+" ' class='layui-btn layui-btn-small layui-btn-primary'  title='编辑'>"+
                                "<i class='layui-icon'>&#xe642;</i></a>"+"</td>";
                        tr=tr+td+"</tr>";
                    })
                    $("#deptTable tr:gt(0)").remove();
                    $("#deptTable").append(tr);
                });
                status();
            })
            $("#after").click(function () {
                var quotationStatus=$("#quotationStatus").val();
                var quotationId=$("#quotationId").val();
                var pageSize=parseInt($("#pageSize").val());
                var pageNo= parseInt($("#pageNo").val());
                var totalPageNo=parseInt($("#totalNo").val());
                var quotationCreaterNo=${user.userId};
                if(pageNo<=totalPageNo-1){
                    $("#pageNo").val(pageNo+1);
                }
                $.get("${pageContext.request.contextPath}/quotationProcess/pageafter.action",{currentPageNo:pageNo,totalPageNo:totalPageNo,pageSize:pageSize,quotationStatus:quotationStatus,quotationId:quotationId,quotationCreaterNo:quotationCreaterNo},function(data) {
                    var tr="<tr>";
                    $(data.datas).each(function(i,obj) {
                        var td=  "<td>"+obj.quotationId+"</td>"
                                +"<td>"+obj.clientName+"</td>"
                                +"<td>"+obj.orderId+"</td>"
                                +"<td>"+obj.goodsName+"</td>"
                                +"<td>"+obj.quotationCreater+"</td>"
                                +"<td>"+obj.quotationStatus+"</td>"
                                + "<td>"+"<a href='<%=request.getContextPath()%>/quotationProcess/pageprocess.action?quotationId="+obj.quotationId+"&orderId="+obj.orderId+" ' class='layui-btn layui-btn-small layui-btn-primary'  title='编辑'>"+
                                "<i class='layui-icon'>&#xe642;</i></a>"+"</td>";
                        tr=tr+td+"</tr>";
                    })
                    $("#deptTable tr:gt(0)").remove();
                    $("#deptTable").append(tr);
                });
                status();
            })
            $("#select").click(function () {
                var quotationStatus=$("#quotationStatus").val();
                var quotationId=$("#quotationId").val();
//                获取每页显示条数
                var pageSize=$("#pageSize").val();
                var pageNo=parseInt(document.getElementById("pageNo").value);
                var quotationCreaterNo=${user.userId};
//           alert(pageSize);
//          alert(pageNo);
                $.get("${pageContext.request.contextPath}/quotationProcess/pagepartPage.action",{pageSize:pageSize,currentPageNo:1,quotationStatus:quotationStatus,quotationId:quotationId,quotationCreaterNo:quotationCreaterNo},function (data) {
                    var tr="<tr>";
                    $(data.datas).each(function(i,obj) {
                        var td=  "<td>"+obj.quotationId+"</td>"
                                +"<td>"+obj.clientName+"</td>"
                                +"<td>"+obj.orderId+"</td>"
                                +"<td>"+obj.goodsName+"</td>"
                                +"<td>"+obj.quotationCreater+"</td>"
                                +"<td>"+obj.quotationStatus+"</td>"
                                + "<td>"+"<a href='<%=request.getContextPath()%>/quotationProcess/pageprocess.action?quotationId="+obj.quotationId+"&orderId="+obj.orderId+" ' class='layui-btn layui-btn-small layui-btn-primary'  title='编辑'>"+
                                "<i class='layui-icon'>&#xe642;</i></a>"+"</td>";
                        tr=tr+td+"</tr>";
                    })
                    $("#deptTable tr:gt(0)").remove();
                    $("#deptTable").append(tr);
                    var totalPageNo=data.totalPageNo;
                    $("#totalNo").val(totalPageNo);
                    $("#totalPageNo").empty();

                    for(var i=1;i<=totalPageNo;i++){
                        $("#totalPageNo").append("<a  id='"+i +"'  title='"+i+"'href='#'   onclick='partpage(this)' style=' border: 1px solid #E2E2E2;text-decoration: none;color: black;background: white;text-align: center;display: block;float: left; width: 40px;height: 30px;padding-top: 10px'  >"+i+"</a>&nbsp;&nbsp;&nbsp;");
                    }
                    document.getElementById(1).style.backgroundColor="#009688";
                    document.getElementById(1).style.color="white";
                });
                status();
            })
            $("#pageSize").change(function() {
                var quotationStatus=$("#quotationStatus").val();
                var quotationId=$("#quotationId").val();
//                获取每页显示条数
                var pageSize=$("#pageSize").val();
                var pageNo=parseInt(document.getElementById("pageNo").value);
                var quotationCreaterNo=${user.userId};
//           alert(pageSize);
//          alert(pageNo);
                $.get("${pageContext.request.contextPath}/quotationProcess/pagepartPage.action",{pageSize:pageSize,currentPageNo:1,quotationStatus:quotationStatus,quotationId:quotationId,quotationCreaterNo:quotationCreaterNo},function (data) {
                    var tr="<tr>";
                    $(data.datas).each(function(i,obj) {
                        var td=  "<td>"+obj.quotationId+"</td>"
                                +"<td>"+obj.clientName+"</td>"
                                +"<td>"+obj.orderId+"</td>"
                                +"<td>"+obj.goodsName+"</td>"
                                +"<td>"+obj.quotationCreater+"</td>"
                                +"<td>"+obj.quotationStatus+"</td>"
                                + "<td>"+"<a href='<%=request.getContextPath()%>/quotationProcess/pageprocess.action?quotationId="+obj.quotationId+"&orderId="+obj.orderId+" ' class='layui-btn layui-btn-small layui-btn-primary'  title='编辑'>"+
                                "<i class='layui-icon'>&#xe642;</i></a>"+"</td>";
                        tr=tr+td+"</tr>";
                    })
                    $("#deptTable tr:gt(0)").remove();
                    $("#deptTable").append(tr);
                    var totalPageNo=data.totalPageNo;
                    $("#totalNo").val(totalPageNo);
                    $("#totalPageNo").empty();

                    for(var i=1;i<=totalPageNo;i++){
                        $("#totalPageNo").append("<a  id='"+i +"'  title='"+i+"'href='#'   onclick='partpage(this)' style=' border: 1px solid #E2E2E2;text-decoration: none;color: black;background: white;text-align: center;display: block;float: left; width: 40px;height: 30px;padding-top: 10px'  >"+i+"</a>&nbsp;&nbsp;&nbsp;");
                    }
                    document.getElementById(1).style.backgroundColor="#009688";
                    document.getElementById(1).style.color="white";
                });
                status();

            });

        })
        function status() {
            var pageNo=parseInt(document.getElementById("pageNo").value);
            document.getElementById(pageNo).style.backgroundColor="#009688";
            document.getElementById(pageNo).style.color="white";
            var totalNo=parseInt(document.getElementById("totalNo").value);
            for(var i=1;i<=totalNo;i++){
                if(pageNo!=i){
                    document.getElementById(i).style.backgroundColor="white";
                    document.getElementById(i).style.color="black";
                }
            }
        }
        window.onload=function(){
            var pageNo=parseInt(document.getElementById("pageNo").value);
            var pageSize=parseInt(document.getElementById("pageSize").value);
            var quotationStatus="全部";
            var quotationCreaterNo=${user.userId};
            $.get("${pageContext.request.contextPath}/quotationProcess/pagegetPage.action",{pageSize:pageSize,currentPageNo:pageNo,quotationCreaterNo:quotationCreaterNo,quotationStatus:quotationStatus},function (data) {
                var tr="<tr>";
                $(data.datas).each(function(i,obj) {
                    var td=  "<td>"+obj.quotationId+"</td>"
                            +"<td>"+obj.clientName+"</td>"
                            +"<td>"+obj.orderId+"</td>"
                            +"<td>"+obj.goodsName+"</td>"
                            +"<td>"+obj.quotationCreater+"</td>"
                            +"<td>"+obj.quotationStatus+"</td>"
                            + "<td>"+"<a href='<%=request.getContextPath()%>/quotationProcess/pageprocess.action?quotationId="+obj.quotationId+"&orderId="+obj.orderId+" ' class='layui-btn layui-btn-small layui-btn-primary'  title='编辑'>"+
                            "<i class='layui-icon'>&#xe642;</i></a>"+"</td>";
                    tr=tr+td+"</tr>";
                })
                $("#deptTable tr:gt(0)").remove();
                $("#deptTable").append(tr);
                var totalPageNo=data.totalPageNo;
                $("#totalNo").val(totalPageNo);
                $("#totalPageNo").empty();

                for(var i=1;i<=totalPageNo;i++){
                    $("#totalPageNo").append("<a  id='"+i +"'  title='"+i+"'href='#'   onclick='partpage(this)' style=' border: 1px solid #E2E2E2;text-decoration: none;color: black;background: white;text-align: center;display: block;float: left; width: 40px;height: 30px;padding-top: 10px'  >"+i+"</a>&nbsp;&nbsp;&nbsp;");
                }
                document.getElementById(1).style.backgroundColor="#009688";
                document.getElementById(1).style.color="white";


            });
            $.get("${pageContext.request.contextPath}/quotationProcess/pagegetAllQuotationStruts.action",function (data) {
                $("#quotationStatus").empty();
                $("#quotationStatus").append(" <option value='全部' selected>全部</option>");
                $(data).each(function(i,obj) {
                    $("#quotationStatus").append("<option value='"+obj.quotationStatus+"'>"+obj.quotationStatus+"</option>"

                    )
                })


            });

        }



    </script>
</head>
<body>
<div id="main">
    <div>
        <span>
		  <a href="">客户服务管理 ></a>
		  <a href="">服务反馈 ></a>
		</span>
    </div>

    <div class="layui-btn-group globalHight">
        <button data-method="notice" class="layui-btn" type="button"  onclick="help()">帮助</button>
        <button class="layui-btn" id="select">查询</button>
    </div>

    <div>
        <table class="layui-table" >
            <tr>
                <td>编号</td>
                <td>
                    <input class="text1"  type="text" id="quotationId">
                    <div id="searchList1" style="overflow:auto;width:175px;height: 60px; position: absolute;z-index: 2 ;width: 218px">
                        <ul id="searchList_ul1" style="background: white" >
                        </ul>
                    </div>
                </td>
                <td>状态</td>
                <td>
                    <select id="quotationStatus">
                    </select>
                </td>
            </tr>
        </table>
        <table class="layui-table" id="deptTable">
            <tr>
                <td>报价单编号</td>
                <td>客户名称</td>
                <td>订单编号</td>
                <td>商品名称</td>
                <td>创建人</td>
                <td>状态</td>
                <td>操作</td>
            </tr>
        </table>

<div style="margin-top: 30px">

    <input type="hidden" value="1" id="pageNo"/>
    <a href="#" id="before" style="border: 1px solid #E2E2E2;text-decoration: none;color: black;background: white;text-align: center;display: block;float: left; width: 68px;height: 30px;padding-top: 10px">上一页</a>
<span id="totalPageNo">

</span>
        <a href="#" id="after" style="border: 1px solid #E2E2E2;text-decoration: none;color: black;background: white;text-align: center;display: block;float: left; width: 68px;height: 30px;padding-top: 10px">下一页</a>
        <span style="float: left;padding-top: 10px">共</span><input type="text"  id="totalNo" readonly style="width: 40px;height:40px;float: left;text-align: center"><span style="float: left;padding-top: 10px">页</span>
        <span style="float: left;padding-top: 10px" >每页显示记录数</span><select id="pageSize" style="width: 60px; height: 40px;float: left">
        <option value="3" >3</option>
        <option value="4">4</option>
        <option value="6">6</option>
        <option value="8">8</option>
    </select>
    </div>
    </div>

</div>
</body>
<script type="text/javascript">
    $("#quotationId").bind('keyup',function () {
        $("#searchList_ul1").empty();
        var text=$.trim($(this).val());
        if(text!=""){
            $.post("${pageContext.request.contextPath}/quotation/pagesearch2.action",{quotationId:text},function (data) {
                if($.isEmptyObject(data)){
                    alert("没有此报价单，请确认是否输入错误！！");
                }else {
                    $(data).each(function (i, obj) {
                        var tr = "<li>";
//                    如果有相关的自动提示就显示
                        var td = "<a   title='" + obj.quotationId +
                                "'href='#' value='"+obj.quotationId+"'  onclick='funn(this)'>" + obj.quotationId + "</a>";
                        tr = tr + td + "</li>";
                        $("#searchList_ul1").append(tr);
                    })
                }
            })
        }
    })
    function funn(t) {
        alert($(t).attr("value"));
        $("#search").val($(t).attr("value"));
        $("#quotationId").val($(t).attr("value"))
        $("#searchList_ul1").empty();
//        document.getElementById("searchList_ul").style.background("red");
    }
</script>
</html>
