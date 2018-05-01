<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/5
  Time: 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>服务处理</title>
    <script type="text/javascript" src="<%=request.getContextPath()%>/plugins/layui/layui.js" ></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/plugins/layui/lay/dest/layui.all.js" ></script>
    <link rel="stylesheet" href="../plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="../css/main.css" />
    <link rel="stylesheet" href="css/serviceProcessing.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript">
        //        //帮助按钮弹出框方法
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
                content: '<div style="padding: 20px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><img src="<%=request.getContextPath()%>/images/报价审核.png" style="width:620px;height:350px"></div>'
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
                            + "<td>"+"<a href='<%=request.getContextPath()%>/quotationPro/proprocess.action?quotationId="+obj.quotationId+" ' class='layui-btn layui-btn-small layui-btn-primary'  title='编辑'>"+
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
                                + "<td>"+"<a href='<%=request.getContextPath()%>/quotationPro/proprocess.action?quotationId="+obj.quotationId+" ' class='layui-btn layui-btn-small layui-btn-primary'  title='编辑'>"+
                                "<i class='layui-icon'>&#xe642;</i></a>"+"</td>";
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
                                + "<td>"+"<a href='<%=request.getContextPath()%>/quotationPro/proprocess.action?quotationId="+obj.quotationId+" ' class='layui-btn layui-btn-small layui-btn-primary'  title='编辑'>"+
                                "<i class='layui-icon'>&#xe642;</i></a>"+"</td>";
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
                    var pageNo=parseInt(document.getElementById("pageNo").value);
                    var pageSize=parseInt(document.getElementById("pageSize").value);
                    $.get("${pageContext.request.contextPath}/quotation/pagegetPage.action",{pageSize:pageSize,currentPageNo:pageNo},function (data) {
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
                            $("#totalPageNo").append("<a  id='"+i +"'  title='"+i+"'href='#'   onclick='partpage(this)' style=' border: 1px solid #E2E2E2;text-decoration: none;color: black;background: white;text-align: center;display: block;float: left; width: 40px;height: 30px;padding-top: 10px'  >"+i+"</a>&nbsp;&nbsp;&nbsp;");
                        }
                        document.getElementById(1).style.backgroundColor="#009688";
                        document.getElementById(1).style.color="white";
                        document.getElementById("mypage").style.display="block";
                    });
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
                                + "<td>"+"<a href='<%=request.getContextPath()%>/quotationPro/proprocess.action?quotationId="+obj.quotationId+" ' class='layui-btn layui-btn-small layui-btn-primary'  title='编辑'>"+
                                "<i class='layui-icon'>&#xe642;</i></a>"+"</td>";
                        tr=tr+td+"</tr>";
                    })
                    $("#deptTable tr:gt(0)").remove();
                    $("#deptTable").append(tr);
                    document.getElementById("mypage").style.display="none";

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
                        $("#totalPageNo").append("<a  id='"+i +"'  title='"+i+"'href='#'   onclick='partpage(this)' style=' border: 1px solid #E2E2E2;text-decoration: none;color: black;background: white;text-align: center;display: block;float: left; width: 40px;height: 30px;padding-top: 10px'  >"+i+"</a>&nbsp;&nbsp;&nbsp;");
                    }
                    document.getElementById(1).style.backgroundColor="#009688";
                    document.getElementById(1).style.color="white";
                });
                status();

            });
            // 绑定键盘按下并松开事件
            $("#quotationCreater").bind('keyup', function() {
                $("#searchList_ul").empty();
                var text=$.trim($(this).val());
                if(text!=""){
                    $.post("<%=request.getContextPath()%>/quotationSel/pagevague.action",{quotationCreater:text},function(data) {
                        if($.isEmptyObject(data)){
                        }else{
                            $(data).each(function (i, obj) {
                                var tr = "<li>";
                                //如果有相关的自动提示就显示
                                var td = "<a   title='" + obj +
                                        "'href='#' value='"+obj+"'onclick='fu(this)'>" + obj + "</a>";
                                tr = tr + td + "</li>";
                                $("#searchList_ul").append(tr);
//                            document.getElementById("searchList_ul").style.background("red");
                            })
                        }

                    })
                }
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
            $.get("${pageContext.request.contextPath}/quotation/pagegetPage.action",{pageSize:pageSize,currentPageNo:pageNo},function (data) {
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
                    $("#totalPageNo").append("<a  id='"+i +"'  title='"+i+"'href='#'   onclick='partpage(this)' style=' border: 1px solid #E2E2E2;text-decoration: none;color: black;background: white;text-align: center;display: block;float: left; width: 40px;height: 30px;padding-top: 10px'  >"+i+"</a>&nbsp;&nbsp;&nbsp;");
                }
                document.getElementById(1).style.backgroundColor="#009688";
                document.getElementById(1).style.color="white";
            });

        }
        //    点击自动提示结果中的某一条，将其内容填充到搜索框中
        function fu(t) {
//            alert($(t).attr("value"))
            $("#quotationCreater").val($(t).attr("value"))
            $("#searchList_ul").empty();
//            document.getElementById("searchList_ul").style.background("red");
        }

    </script>
</head>
<body>
<div id="main">
    <div>
        <span>
		  <a href="">报价管理 ></a>
		  <a href="">报价审核 ></a>
		</span>
    </div>

    <div class="layui-btn-group globalHight">
        <button data-method="notice" class="layui-btn" type="button"  onclick="help()">帮助</button>
        <button class="layui-btn" id="select">查询</button>
    </div>

    <div>
        <table class="layui-table">
            <tr>
                <td>报价编号</td>
                <td>
                    <input class="text1"  type="text" id="quotationId">
                    <div id="searchList1" style="overflow:auto;width:175px;height: 60px; position: absolute;z-index: 2 ;width: 218px">
                        <ul id="searchList_ul1" style="background: white" >
                        </ul>
                    </div>
                </td>
                <td>创建人</td>
                <td>
                    <input class="text1" type="text" id="quotationCreater">
                    <%--自动提示--%>
                    <div id="searchList" style="overflow:auto;width:175px;height: 60px; position: absolute;z-index: 2 ;width: 215px">
                        <ul id="searchList_ul" style="background: white" >
                        </ul>
                    </div>
                </td>
                <td>报价状态</td>
                <td>
                    <select style="display: block;width: 100px" id="quotationStatus">
                        <option value="未审核">未审核</option>
                    </select>
                </td>
            </tr>
        </table>
        <table class="layui-table" id="deptTable">
            <tr>
                <td>报价单编号</td>
                <td>订单编号</td>
                <td>产品报价</td>
                <td>实施报价</td>
                <td>服务报价</td>
                <td>专项服务报价</td>
                <td>项目损益运算</td>
                <td>报价总价</td>
                <td>报价状态</td>
                <td>报价创建人</td>
                <td>报价处理</td>
            </tr>
        </table>
        <div style="margin-top: 30px" id="mypage">

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
                    layer.confirm('没有此报价单，请确认是否输入错误！', {
                        icon:6,
                        btn: ['确定'] //按钮
                    });
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

