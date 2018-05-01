<%--
  Created by IntelliJ IDEA.
  User: Amily
  Date: 2017/8/1
  Time: 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>销售机会管理</title>
    <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="../plugins/layui/layui.js" ></script>
    <script type="text/javascript" src="../plugins/layui/lay/modules/layer.js"></script>
    <script type="text/javascript" src="../plugins/layui/lay/dest/layui.all.js" ></script>
    <link rel="stylesheet" href="../plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="../css/main.css" />
    <link rel="stylesheet" href="css/ManageSaleOpportunity.css">
    <link rel="stylesheet" href="../plugins/layui/css/modules/layer/default/layer.css">
    <link rel="stylesheet" href="css/jquery.autocompleter.css">
    <script src="../js/jquery.autocompleter.js" type="text/javascript"></script>
    <script type="text/javascript">

        $(function () {
            $.get("/CRM/sales/salesroleCheck.action",function (data) {
                if (data==4){
                    $("#demo7").hide();
                }
            });
        });


        //动态参数查询
        $(function(){
            $("#select").click(function(){

                var check1 = false;
                var check2 = false;
                var check3 = false;
                var b1 =  $("#cusname").val();
                var b2 =  $("#tiaomu").val();
                var b3 =  $("#valu").val();
                if(b1.trim()!=""){
                    check1 = true;
                }
                if(b2.trim()!=""){
                    check2 = true;
                }
                if(b3.trim()!=""){
                    check3 = true;
                }
                if((check1||check2||check3)==true) {
                    $("#demo7").hide();

                    $.get("/CRM/sales/salesfind.action",{cusName:b1,outLine:b2, linkName:b3},function (data) {
                    var tr = "<tr>";

                    var operation = "";

                    $(data).each(function (i, obj) {

                        var mydate = new Date(obj.creatTime);

                        var date = mydate.getFullYear() + "-" + (mydate.getMonth() + 1) + "-" + mydate.getDate();

                        operation =
                            "<a href='/CRM/sales/salesfindById.action?salesId="+obj.salesId+"'><i title='编辑' class='layui-icon'>&#xe642;</i></a>" +
                            "<a href='#' onclick='del(this)' ><i title='删除' class='layui-icon'>&#x1006;</i></a>";
                        var td = "<td id=" + obj.salesId + ">" + obj.salesId + "</td>" +
                            "<td>" + obj.cusName + "</td>" +
                            "<td>" + obj.outLine + "</td>" +
                            "<td>" + obj.linkName + "</td>" +
                            "<td>" + obj.linkPhone + "</td>" +
                            "<td>" + date + "</td>" +
                            "<td>" + operation + "</td>";
                        tr = tr + td + "</tr>";
                    });

                    $("#listTable tr:gt(0)").remove();

                    $("#listTable").append(tr);
                        $("#demo7").hide();
                } );
                }else {
                    layer.msg('不能都为空呦', {
                        msg: [1, '#3595CC'],
                        area: ['200px', '48px'], //宽高
                        time: 1000
                    });
                }



            });

        });

        //帮助按钮弹出框方法
        $(function () {
            $("#sh").click(function () {
                //示范一个公告层
                layer.open({
                    type: 1
                    ,title: false //不显示标题栏
                    ,closeBtn: false
                    ,area: ['1200px', '400px']
                    ,shade: 0.8
                    ,resize: true
                    ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
                    ,btn: ['好啦，我知道啦']
                    ,moveType: 0//拖拽模式，0或者1
//                        ,content: '<img src="../images/help_cusManage.png" >'
                    ,content: '<div style="padding: 20px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><img src="../images/salesOpportunity.png" ></div>'
                    ,success: function (layero) {
                        var btn = layero.find('.layui-layer-btn');
                        btn.css('text-align', 'center');
                        btn.find('.layui-layer-btn0').attr({
                            target: '_blank'
                        });
                    }
                });
            })
        });


  //        pinyin4j

        function autoCom() {
            //用来装输入的内容
            var searchKey;

//            alert(searchKey)
            //每次调用的时候清空上次查找的内容
            $("#choice ul ").empty();
            //获得输入的值
            searchKey = $("#cusname").val();

            //当输入的内容不是空值的时候，到后台请求
            if (searchKey) {
                $.get("/CRM/sales/salesfindName.action", {cusName: searchKey}, function (data) {
                    var listLength;
                    var currentList;
                    currentList = -1;
                    var lim = "";
                    var li;

                    //拼接字符串
                    $(data).each(function (i, obj) {
                        li = "<li>" + obj + "</li>";
                        lim = lim + li;
                    });
                    $("#choice ul").append(lim);

                    listLength = $("#choice ul li").length;

                    //如果有拼接的li(有值的话)，div 显示
                    if (listLength > 0) {
                        $("#choice").show();
                    } else {
                        $("#choice").hide();
                    }

                    //当光标移到li上的时候
                    $("#choice ul li").hover(function () {
                        //清除样式，我感觉下面的没什么用
                        $("#choice ul li").removeClass();
                        $(this).add("lihover")

                        currentList = $("#choice ul li").index(this)
                    }, function () {
                        $(this).removeClass("lihover");
                        //上面那些东西基本没用，下面是当点击li的时候触发的事件
                    }).click(function () {
                        var keywordContent;

                        //获得li中的值
                        keywordContent = $(this).text();

                        //把li的值放到input中
                        $("#cusname").val(keywordContent);

                        //隐藏div
                        $("#choice").hide();


                    });
                });

            }
        };


    </script>
</head>
<body>
    <div class="admin-main">
        <div id="main">
            <span class="title1">
            <a href="">销售机会管理</a>
            </span>
            <div class="layui-btn-group">
                <a href="ManageSaleOpportunity.jsp" ><button class="layui-btn">刷新</button></a>
                <a href="${pageContext.request.contextPath}/downloadFile.action"><button class="layui-btn">导出</button></a>
                <button class="layui-btn" id="sh">帮助</button>

                <a href="NewSaleOpportunity.jsp" ><button class="layui-btn">新建</button></a>
                <button class="layui-btn" id="select" lay-submit  lay-filter="formDemo">查询</button>
            </div>

            <form class="layui-form">

            <table class="layui-table" id="table1">
                <colgroup>
                    <col width="160">
                    <col width="206">
                    <col width="160">
                    <col width="206">
                    <col width="160">
                    <col width="206">
                </colgroup>

                <tbody>
                <tr>
                    <%--//这里面只是声明了一下onkeyup的方法，调用方法用--%>
                    <td class="span1" >客户名称</td>
                    <td>
                        <input type="text"  id="cusname" onkeyup="autoCom()" name="cusname"  lay-verify="CustomerName" autocomplete="off" class="layui-input" placeholder="请输入查询条件">
                        <%--用来装ul-li的容器--%>
                        <div id="choice" style="position: absolute;width: 170px;background-color: white;line-height: 30px">
                            <ul>
                            </ul>
                        </div>
                    </td>



                    <td>概要</td>
                    <td>
                        <input type="text" id="tiaomu" name="outline" lay-verify="outline" autocomplete="off" class="layui-input" placeholder="请输入查询条件">
                    </td>

                    <td>联系人</td>
                    <td>
                        <input type="text" id="valu" name="linkman" lay-verify="linkman" autocomplete="off" class="layui-input"  placeholder="请输入查询条件">
                    </td>
                </tr>
                </tbody>
            </table>

            </form>

            <table class="layui-table" id="listTable">
                <tbody>
                <tr>
                    <td>编号</td>
                    <td>客户名称</td>
                    <td>概要</td>
                    <td>联系人</td>
                    <td>联系人电话</td>
                    <td>创建时间</td>
                    <td>操作</td>
                </tr>

                </tbody>
            </table>

            <div id="demo7" >

            </div>

        </div>
    </div>
</body>
<script src="../plugins/layui/layui.js" charset="utf-8"></script>
<script>

    $(function () {
        $.get("${pageContext.request.contextPath}/sales/salespage.action", function (data) {


            layui.use(['laypage', 'layer'], function () {
                var laypage = layui.laypage
                        , layer = layui.layer;

                laypage({
                    cont: 'demo7'

                    , pages: data.pageSize

                     ,skip: true
                    , jump: function (obj, first) {
//得到了当前页，用于向服务端请求对应数据

                        var curr = obj.curr;

                        $.get("${pageContext.request.contextPath}/sales/salespage.action", {currentPageNo: curr}, function (data) {
                            var tr = "<tr>";
                            var status = "";
                            var operation = "";

                            $(data.data).each(function (i, obj) {

                                var mydate = new Date(obj.creatTime);
                                var date = mydate.getFullYear() + "-" + (mydate.getMonth() + 1) + "-" + mydate.getDate();

                                    operation = "<a href='/CRM/sales/salesfindById.action?salesId="+obj.salesId+"'><i title='编辑' class='layui-icon'>&#xe642;</i></a>" +
                                "<a href='#' onclick='del(this)' ><i title='删除' class='layui-icon'>&#x1006;</i></a>";


                                var td = "<td id=" + obj.salesId + ">" + obj.salesId + "</td>" +
                                        "<td>" + obj.cusName + "</td>" +
                                        "<td>" + obj.outLine + "</td>" +
                                        "<td>" + obj.linkName + "</td>" +
                                        "<td>" + obj.linkPhone + "</td>" +
                                        "<td>" + date + "</td>" +

                                        "<td>" + operation + "</td>";
                                tr = tr + td + "</tr>";
                            });
                            $("#listTable tr:gt(0)").remove();
                            $("#listTable").append(tr);
                        })
                    }
                });
            });
        })
    })

            //删除
    function del(a) {

        var id=$(a).parents("tr").find("td:eq(0)").text();

        layer.confirm('是否确认删除？', {
            btn: ['确定','取消'] //按钮
        }, function(){
            $.get("/CRM/sales/salesdelete.action",{salesId:id}, function (data) {

                layer.alert('删除成功', {icon: 6});
            });
            $(a).parents("tr").remove();
        }, function(){
            layer.msg('已经取消');
        });

    }

</script>
</html>
