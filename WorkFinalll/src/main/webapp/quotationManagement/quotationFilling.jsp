<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/5
  Time: 11:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>报价归档</title>
    <link rel="stylesheet" href="../plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="../css/main.css" />
    <link rel="stylesheet" href="css/serviceFiling.css" />
    <script type="text/javascript" src="../plugins/layui/lay/dest/layui.all.js" ></script>
    <script type="text/javascript" src="../plugins/layui/layui.js" charset="utf-8"></script>
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
        $(function () {
            getCurrentpage(1);
        })
        function ch(data) {
            var tr = "<tr>" ;
            $(data).each(function(i,obj){
                var td="<td>"+obj.quotationId+"</td>"+
                        "<td>"+obj.orderId+"</td>"+
                        "<td>"+obj.quotationSales+"</td>"+
                        "<td>"+obj.quotationImplementation+"</td>"+
                        "<td>"+obj.quotationService+"</td>"+
                        "<td>"+obj.quotationSpecialservice+"</td>"+
                        "<td>"+obj.quotationBudget+"</td>"+
                        "<td>"+obj.quotationTotal+"</td>"+
                        "<td>"+obj.quotationStatus+"</td>"+
                        "<td>"+obj.quotationCreater+"</td>"+
                        "<td>"+"<a href='<%=request.getContextPath()%>/quotation/pagefindById.action?quotationId="+obj.quotationId+" ' class='layui-btn layui-btn-small layui-btn-primary'  title='编辑'>"+
                        "<i class='layui-icon'>&#xe642;</i></a>"+"</td>";
                tr = tr + td + "</tr>";
            });
            $("#tbody1").append(tr) ;
        }
        function getCurrentpage(curr) {
            var quotationStatus=$("select").val();
            $.get("${pageContext.request.contextPath}/quotationPage/quotationPagepage.action",{currentPageNo:curr,quotationStatus:quotationStatus},function (data) {
                ch(data.data);
                layui.use(['laypage', 'layer'],function () {
                    var laypage = layui.laypage
                            ,layer = layui.layer;
                    laypage({
                        cont: 'demo7'
                        ,pages: data.pageSize
                        ,skip: true,
                        curr: curr || 1,
                        //触发分页后的回调
                        jump: function (obj, first) {
                            //点击跳页触发函数自身，并传递当前页：obj.curr
                            if (!first) {
                                $("#tbody1").empty();
                                getCurrentpage(obj.curr);
                            }
                        }
                    });
                })
            }) ;
        }
        function getSelCurrentpage(curr) {
            $("#tbody1").empty();
            var Id=$("#quotationId").val();
            var quotationId=$("#quotationId").val();
            var quotationCreater=$("#quotationCreater").val();
            var quotationStatus=$("select").val();
            $.get("${pageContext.request.contextPath}/quotationPage/quotationPagepage.action",{quotationId:quotationId,quotationCreater:quotationCreater,quotationStatus:quotationStatus,currentPageNo:curr},function(data) {
                ch(data.data);
                layui.use(['laypage', 'layer'],function () {
                    var laypage = layui.laypage
                            ,layer = layui.layer;
                    laypage({
                        cont: 'demo7'
                        ,pages: data.pageSize
                        ,skip: true,
                        curr: curr || 1,
                        //触发分页后的回调
                        jump: function (obj, first) {
                            //点击跳页触发函数自身，并传递当前页：obj.curr
                            if (!first) {
                                $("#tbody1").empty();
                                getSelCurrentpage(obj.curr);
                            }
                        }
                    });
                })
            }) ;
        }
    </script>
</head>
<body>
<div id="main">
    <div>
        <span> 报价管理 ></span>
        <span>报价归档 </span>
    </div>

    <div class="layui-btn-group globalHight">
        <button data-method="notice" class="layui-btn" type="button"  onclick="help()">帮助</button>
        <button id="select" class="layui-btn">查询</button>
        <a href="${pageContext.request.contextPath}/quotaDownload.action"> <button id="export" class="layui-btn">全部信息导出Excel</button></a>

    </div>

    <div>
        <table class="layui-table">
            <tr>
                <td>报价编号</td>
                <td>
                    <input id="quotationId" class="text1" type="text">
                    <div id="searchList1" style="overflow:auto;width:175px;height: 60px; position: absolute;z-index: 2 ;width: 218px">
                        <ul id="searchList_ul1" style="background: white" >
                        </ul>
                    </div>
                </td>
                <td>创建人</td>
                <td>
                    <input id="quotationCreater" class="text1" type="text">
                    <div id="searchList" style="overflow:auto;width:175px;height: 60px; position: absolute;z-index: 2 ;width: 218px">
                        <ul id="searchList_ul" style="background: white" >
                        </ul>
                    </div>
                </td>
                <td>报价状态</td>
                <td>
                    <select style="display: block;width: 100px" name="quotationStatus">
                        <option value="已通过">已通过</option>
                    </select>
                </td>
            </tr>
        </table>
        <table class="layui-table">
            <thead>
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
            </thead>
            <tbody id="tbody1">

            </tbody>
        </table>

    </div>
    <div style="padding-left: 480px;" id="demo7"></div>
</div>
</body>
<script type="text/javascript">
    $(function () {
        $("#select").click(function () {
            getSelCurrentpage(1);
        })
        <%--$("#export").click(function () {--%>
            <%--var status=$("select").val();--%>
            <%--$.get("${pageContext.request.contextPath}/quotation/pageexport.action",{quotationStatus:status},function (data) {--%>
                <%--layer.confirm(data, {--%>
                    <%--icon:6,--%>
                    <%--btn: ['确定'] //按钮--%>
                <%--});--%>
            <%--})--%>·
        <%--})--%>
    })
    $("#quotationId").bind('keyup',function () {
        $("#searchList_ul1").empty();
        var text=$.trim($(this).val());
        if(text!=""){
            $.post("${pageContext.request.contextPath}/quotation/pagesearch2.action",{quotationId:text},function (data) {
                if($.isEmptyObject(data)){
                    layer.confirm('没有此报价单，请确认是否输入错误！！', {
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
        $("#search").val($(t).attr("value"));
        $("#quotationId").val($(t).attr("value"))
        $("#searchList_ul1").empty();
//        document.getElementById("searchList_ul").style.background("red");
    }

    $("#quotationCreater").bind('keyup',function () {
        $("#searchList_ul").empty();
        var text=$.trim($(this).val());
        if(text!=""){
            $.post("${pageContext.request.contextPath}/quotationSel/pagevague.action",{quotationCreater:text},function (data) {
                if($.isEmptyObject(data)){
//                    alert("没有此创建人，请确认是否输入错误！！");
                    layer.confirm('没有此创建人，请确认是否输入错误！', {
                        icon:6,
                        btn: ['确定'] //按钮
                    });
                }else {
                    $(data).each(function (i, obj) {
                        var tr = "<li>";
//                    如果有相关的自动提示就显示
                        var td = "<a   title='" + obj +
                                "'href='#' value='"+obj+"'  onclick='fu(this)'>" + obj + "</a>";
                        tr = tr + td + "</li>";
                        $("#searchList_ul").append(tr);
                    })
                }
            })
        }
    })
    function fu(t) {
        $("#search").val($(t).attr("value"));
        $("#quotationCreater").val($(t).attr("value"))
        $("#searchList_ul").empty();
//        document.getElementById("searchList_ul").style.background("red");
    }
</script>
</html>
