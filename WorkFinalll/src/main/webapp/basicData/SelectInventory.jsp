<%--
  Created by IntelliJ IDEA.
  User: Amily
  Date: 2017/8/5
  Time: 14:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>库存查询</title>
    <link rel="stylesheet" href="../plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="../css/main.css" />
    <link rel="stylesheet" href="../basicData/css/SelectInventory.css">
    <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
    <script src="../plugins/layui/layui.js" charset="utf-8"></script>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <script>
        //验证
        $(function(){
            $("#select").click(function(){
                var check1 = false;
                var check2 = false;

                var b1 =  $("#goodsNa").val();
                var b2 =  $("#wareHou").val();

                if(b1.trim()!=""){
                    check1 = true;
                }
                if(b2.trim()!=""){
                    check2 = true;
                }
                if((check1||check2)==true) {
                }else{
                    layer.msg('请填写内容', {
                        msg:[1,'#3595CC'],
                        area:['200px','48px'],
                        tips: [1, '#1AA094'],
                        time:2000
                    });
                }
            });

        });
//
        //ch(data)方法
        function ch(data) {
            var table = $("#stock_con") ;
            var tr = "<tr>" ;
            $(data).each(function(i,obj){
                var td = "<td>" + obj.stockId + "</td>" +
                        "<td>" + obj.goodsName + "</td>" +
                        "<td>" + obj.wareHouse + "</td>" +
                        "<td>" + obj.goodsLocal + "</td>" +
                        "<td>" + obj.totalNum + "</td>" +
                        "<td>" + obj.stockDesc + "</td>" ;
                tr = tr + td + "</tr>" ;
            });
            $(table).append(tr) ;
        }




        //分页
        function getCurrentpage(curr) {
            $.get("${pageContext.request.contextPath}/basicData/stockpageList.action",{currentPage:curr},function (data) {
                ch(data.data);
                layui.use(['laypage', 'layer'],function () {
                    var laypage = layui.laypage
                            ,layer = layui.layer;
                    laypage({
                        cont: 'demo7'
                        ,pages: data.pageSize
                        ,skip: true,
                        curr: curr || 1,
                        jump: function (obj, first) {//触发分页后的回调
                            if (!first) {//点击跳页触发函数自身，并传递当前页：obj.curr
                                $("#stock_con").html("");
                                getCurrentpage(obj.curr);
                            }
                        }
                    });
                })
            }) ;

        }
        //定位当前页
        $(function () {
            getCurrentpage(1);
        })
        //分类查询
        $(function(){
            $("#select").click(function(){
                var a = $("#goodsNa").val() ;
                var b = $("#wareHou").val() ;
                if(a!=""||b!=""){
//传值
                    $.get("${pageContext.request.contextPath}/basicData/stockfind.action",{goodsName:a,wareHouse:b},function(data){
                        $("#stock_con").html("")
                        var table = $("#stock_con") ;
                        var tr = "<tr>" ;
                        $(data).each(function(i,obj){
                            var td = "<td>" + obj.stockId + "</td>" +
                                    "<td>" + obj.goodsName + "</td>" +
                                    "<td>" + obj.wareHouse + "</td>" +
                                    "<td>" + obj.goodsLocal + "</td>" +
                                    "<td>" + obj.totalNum + "</td>" +
                                    "<td>" + obj.stockDesc + "</td>";
                            tr = tr + td + "</tr>" ;
                        });
                        layer.msg('查询成功', {
                            msg:[1,'#3595CC'],
                            area:['200px','48px'],
                            tips: [1, '#1AA094'],
                            time:2000
                        });
                        $(table).append(tr) ;
                    }) ;
                }


            });

        }) ;


    </script>

    <script>
        //帮助按钮弹出框方法
        //触发事件
        var active = {
            notice: function(){
                //示范一个公告层
                layer.open({
                    type: 1
                    ,title: false //不显示标题栏
                    ,closeBtn: false
                    ,area: ['1400px', '400px']
                    ,shade: 0.8
                    ,resize:true
                    ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
                    ,btn: [ '好啦，我知道啦']
                    ,moveType: 0//拖拽模式，0或者1
//                        ,content: '<img src="../images/help_cusManage.png" >'
                    ,content: '<div style="padding: 20px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><img src="../basicData/img/stock.png" style="margin-left: 90px;width: 85%" ></div>'
                    ,success: function(layero){
                        var btn = layero.find('.layui-layer-btn');
                        btn.css('text-align', 'center');
                        btn.find('.layui-layer-btn0').attr({
                            target: '_blank'
                        });
                    }
                });
            }
        };
        $(function () {

            $(".layui-btn").click(function(){
                var othis = $(this), method = othis.data('method');
                active[method] ? active[method].call(this, othis) : '';
            });
        })
    </script>

    <script type="text/javascript">
        // 绑定键盘按下并松开事件
        $(function () {
            $('#goodsNa').bind('keyup', function() {
                $("#searchList_ul1").empty();
                var text=$.trim($(this).val());
                if(text!=""){

                    $.get("<%=request.getContextPath()%>/basicData/stockselect.action",{goodsName:text},function(data) {

                        if($.isEmptyObject(data)){
                        }else {
                            $(data).each(function (i, obj) {
                                var tr = "<li>";
                                //   如果有相关的自动提示就显示
                                var td = "<a   title='" + obj + "'href='#'   onclick='fu(this)'>" + obj + "</a>";
                                tr = tr + td + "</li>";
                                $("#searchList_ul1").append(tr);
                            })
                        }
                    })
                }
            });
        })
        //    点击自动提示结果中的某一条，将其内容填充到搜索框中
        function fu(t) {
            var v=$(t).attr("title");
            $("#goodsNa").val(v);
            $("#goodsName").val($(t).attr("value"))
            $("#searchList_ul1").empty();
        }

        // 仓库绑定键盘按下并松开事件
        $(function () {
            $('#wareHou').bind('keyup', function() {
                $("#searchList_ul2").empty();
                var text=$.trim($(this).val());
                if(text!=""){
                    $.get("<%=request.getContextPath()%>/basicData/stockfindWare.action",{wareHouse:text},function(data) {

                        if($.isEmptyObject(data)){
                        }else {
                            $(data).each(function (i, obj) {
                                var tr = "<li>";
                                //   如果有相关的自动提示就显示
                                var td = "<a   title='" + obj + "'href='#'   onclick='fu2(this)'>" + obj + "</a>";
                                tr = tr + td + "</li>";
                                $("#searchList_ul2").append(tr);
                            })
                        }
                    })
                }
            });
        })
        //    点击自动提示结果中的某一条，将其内容填充到搜索框中
        function fu2(t) {
            var v2=$(t).attr("title");
            $("#wareHou").val(v2);
            $("#wareHouse").val($(t).attr("value"))
            $("#searchList_ul2").empty();
        }

    </script>

</head>
<body>
<div class="admin-main">
    <div id="main">
            <span class="title1">
            <a href="">库存查询</a>
            </span>
        <div class="layui-btn-group globalHight">
            <button class="layui-btn" data-method="notice">帮助</button>
            <button id="select" class="layui-btn">查询</button>
            <a href="SelectInventory.jsp"><button class="layui-btn" id="update" type="button">返回</button></a>
        </div>
        <form id="NewSale" action="" method="post">
            <table class="layui-table">
                <colgroup>
                    <col width="150">
                    <col width="230">
                    <col width="120">
                    <col width="250">
                    <col width="130">
                    <col width="220">
                </colgroup>

                <tbody >
                <tr>
                    <td>产品</td>
                    <td>
                        <input id="goodsNa" type="text" name="goodsName" lay-verify="Number" autocomplete="off" class="layui-input"/>

                    </td>
                    <div id="searchList1" style="width: 200px;margin-left:165px;margin-top: 70px;z-index: 999;position: absolute;background-color: #F8F8F8">
                        <ul id="searchList_ul1">
                        </ul>
                    </div>
                    <td>仓库</td>
                    <td>
                        <input id="wareHou" type="text" name="wareHouse" lay-verify="Number" autocomplete="off" class="layui-input">

                    </td>
                    <div id="searchList2" style="width: 200px;margin-left:515px;margin-top: 70px;z-index: 999;position: absolute;background-color: #F8F8F8">
                        <ul id="searchList_ul2">
                        </ul>
                    </div>
                    <td>

                    </td>
                    <td>

                    </td>
                </tr>
                </tbody>
            </table>
            <table class="layui-table">
                <colgroup>
                    <col width="100">
                    <col width="300">
                    <col width="150">
                    <col width="250">
                    <col width="200">
                    <col width="100">

                </colgroup>
                <thead>
                <tr>
                    <th>序号</th>
                    <th>产品</th>
                    <th>仓库</th>
                    <th>货位</th>
                    <th>件数</th>
                    <th>备注</th>
                </tr>
                </thead>
                <tbody id="stock_con">

                </tbody>
            </table>
        </form>
        <div id="demo7"></div>
    </div>

</div>
</body>
</html>
