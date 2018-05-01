<%--
  Created by IntelliJ IDEA.
  User: Amily
  Date: 2017/8/5
  Time: 13:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>数据字典管理</title>
    <link rel="stylesheet" href="../plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="../css/main.css" />
    <link rel="stylesheet" href="css/ManageDatas.css">
    <link rel="stylesheet" href="../css/layer.css">
    <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="../plugins/layui/layui.js"></script>
    <script type="text/javascript" src="../plugins/layui/lay/dest/layui.all.js" ></script>
    <script type="text/javascript" src="../js/layer.js"></script>

    <%--非空验证--%>
    <script>
        $(function(){
            $("#select").click(function(){
                var check1 = false;
                var check2 = false;
                var b1 =  $("#type").val();
                var b2 =  $("#tiaomu").val();
                if(b1!=""){
                    check1 = true;
                }
                if(b2!=""){
                    check2 = true;
                }


                if((check1||check2)==true) {
                }else{
                    layer.msg('请选择类别！', {
                        icon: 5,
                        skin: 'layer-ext-moon'
                    })

                }
                if(check1==true){

                }
            });
        });
    </script>

    <script>
        //            加载form模块
        function render() {
            layui.use('form',function () {
                var form=layui.form();
                form.render(); //更新全部

            });

        }

//        类型读取
        function type() {
            $.get("${pageContext.request.contextPath}/basicData/DataDictionaryfindType.action",function (data) {
                var type = $("#type") ;
                var tr="";
                $(data).each(function(i,obj){
                    var td = "<option>" + obj + "</option>"
                    tr = tr + td  ;
                });
                $(type).append(tr) ;
                render();
            }) ;
        }

//控制读取
        $(function () {
            var a =  $("#type").val();
            var b = $("#tiaomu").val();
            if(a="${dataDictionary.type}"&&b==""&&a!="查询所有"){
                getTypeCurrentpage(1);

            }else if(b!=""){
                getEntryCurrentpage(1);

            }else {
                getCurrentpage(1);
            }
            $("#select").click(function(){
                var a =  $("#type").val();
                var b = $("#tiaomu").val();
                if(a!=""&&a!="2"&&b==""){
                    getTypeCurrentpage(1);
                }else if(a!=""&&b!=""){
                    getEntryCurrentpage(1);
                }else if(a==""||a=="2"){
                    getCurrentpage(1);
                }
                if(a!=""){
                    layer.msg('查询成功！', {
                        icon: 6,
                        skin: 'layer-ext-moon'
                    })
                }

            })
            type();
            $("#super").mouseover(function(){
                var a =  $("#type").val();
                var b = $("#tiaomu").val();
                if(a!=""&&b==""){
                    entry();
                    render();
                }
            });

//重置条目框
            $("#click").click(function () {
                var b = $("#tiaomu").val();
                if(b!=""){
                    entry();
                    render();
                }
            })

        })
        function entry() {
                var a =  $("#type").val();
                $.get("${pageContext.request.contextPath}/basicData/DataDictionaryfindEntry.action",{type:a},function (data) {
                    var entry = $("#tiaomu") ;
                    var tr="";
                    $("#tiaomu").html("<option value=\"\">直接选择或搜索选择</option>")
                    if(data!=""){

                        $(data).each(function(i,obj){
                            var td = "<option>" + obj.entry + "</option>"
                            tr = tr + td  ;
                        });
                    }else {
                    }
                    $(entry).append(tr) ;
                    render();
                }) ;
        }
//        删除
        function dele(a) {
            var id=$(a).parents("tr").find("td:eq(0)").text();
            var _this = $(a);
            layer.confirm('确定删除此信息？', {
                btn: ['确定','取消'] //按钮
            }, function(index){
                $.get("${pageContext.request.contextPath}/basicData/DataDictionarydelete.action",{"dataDictionary.number":id}, function (data) {
                    if(data!=null){
                        _this.parents("tr").remove();
                        layer.msg('删除成功！', {
                            icon: 6,
                            skin: 'layer-ext-moon'
                        })
                    }else{
                        layer.msg('删除失败！', {
                            icon: 5,
                            skin: 'layer-ext-moon'
                        })
                    }
                });
                layer.close(index);
            });
        }


        //ch(data)方法
        function ch(data) {
            var table = $("#tbody") ;
            $("#tbody").html("")
            var tr = "<tr>" ;
            $(data).each(function(i,obj){
              if(obj.yon!="否"){
                var td = "<td>" + obj.number + "</td>" +
                    "<td>" + obj.type + "</td>" +
                    "<td>" + obj.entry + "</td>" +
                    "<td>" + obj.value + "</td>" +
                    "<td>" + obj.yon + "</td>"+
                    "<td>"+

                    "<a href=${pageContext.request.contextPath}/basicData/DataDictionarymodify.action?number="+obj.number+"> <i class=\"layui-icon\" title='修改'>&#xe642;</i></a>\n" +
                    "<a href='#' onclick='dele(this)'><i class=\"layui-icon\" title='删除'>&#x1006;</i></a>"+
                    "</td>";
//            class="delete" href=/basicData/DataDictionarydelete.action?number=
                tr = tr + td + "</tr>" ;
              }else {
                  var td = "<td>" + obj.number + "</td>" +
                      "<td>" + obj.type + "</td>" +
                      "<td>" + obj.entry + "</td>" +
                      "<td>" + obj.value + "</td>" +
                      "<td>" + obj.yon + "</td>"+
                      "<td>"+
                      "<a href='#' onclick='dele(this)'><i class=\"layui-icon\" title='删除'>&#x1006;</i></a>"+
                      "</td>";
//            class="delete" href=/basicData/DataDictionarydelete.action?number=
                  tr = tr + td + "</tr>" ;
              }
            });
            $(table).append(tr) ;
        }



        //分页
        function getCurrentpage(curr) {
            var index = layer.load(1, {
                shade: [0.1,'#fff'] //0.1透明度的白色背景
            });
            $.get("${pageContext.request.contextPath}/basicData/DataDictionarypageList.action",{currentPage:curr},function (data) {
                ch(data.data);
                layer.close(index);
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
                                $("#tbody").html("");
                                getCurrentpage(obj.curr);
                            }
                        }
                    });
                })
            }) ;

        }
        //按类别查询后分页
        function getTypeCurrentpage(curr) {
                var a =  $("#type").val();
                if(a!=""){
            var index = layer.load(1, {
                shade: [0.1,'#fff'] //0.1透明度的白色背景
            });
            $.get("${pageContext.request.contextPath}/basicData/DataDictionarypage.action",{currentPage:curr,type:a},function (data) {
                ch(data.data);
                layer.close(index);

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
                                $("#tbody").html("");
                                getTypeCurrentpage(obj.curr);
                            }
                        }
                    });
                })
            }) ;

        }
        }
        //按类别和条目查询后分页
        function getEntryCurrentpage(curr) {
                var a =  $("#type").val();
                var b=$("#tiaomu").val();
                if(b!=""){
                    var index = layer.load(1, {
                        shade: [0.1,'#fff'] //0.1透明度的白色背景
                    });
                    $.get("${pageContext.request.contextPath}/basicData/DataDictionarypage.action",{currentPage:curr,type:a,entry:b},function (data) {
                        ch(data.data);
                        layer.close(index);
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
                                        $("#tbody").html("");
                                        getEntryCurrentpage(obj.curr);
                                    }
                                }
                            });
                        })
                    }) ;

                }
        }

        //定位当前页
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
                    ,content: '<div style="padding: 20px; line-height: 22px; height: auto; background-color: #393D49; color: #fff; font-weight: 300;"><img src="../basicData/img/Data.png" style="margin-left: 90px;width: 85%"></div>'
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

</head>
<body>
<div class="admin-main">
    <div id="main">
            <span class="title1">
            <a  href=""onclick="del(this)">数据字典管理</a>

            </span>
        <div class="layui-btn-group globalHight">
            <button  data-method="notice" class="layui-btn" id="help">帮助</button>
            <a href="../basicData/NewDatas.jsp"><button class="layui-btn">新建</button></a>
            <button id="select" class="layui-btn">查询</button>
        </div>
        <form class="layui-form" id="NewSale" action="" method="post">
            <table class="layui-table">
                <colgroup>
                    <col width="150">
                    <col width="230">
                    <col width="120">
                    <col width="250">
                    <col width="130">
                    <col width="220">
                </colgroup>

                <tbody>
                <tr>
                    <td>类别</td>
                    <td>
                        <div id="click" class="layui-inline">
                            <div class="layui-input-inline">
                                <select id="type" name="modules" lay-verify="required" lay-search="">
                                    <option id="box" value="">直接选择或搜索选择</option>
                                    <option id="box" value="2">查询所有</option>
                                    <%--<option value="1">layer</option>--%>
                                </select>
                            </div>
                        </div>
                    </td>
                    <td >条目</td>
                    <td>
                        <div id="clickk" class="layui-inline">
                            <div class="layui-input-inline">
                                <select  id="tiaomu" name="modules" lay-verify="required" lay-search="">
                                    <option style="width: 600px"value="">请先选择类别！</option>
                                    <%--<option value="1">layer</option>--%>
                                </select>
                            </div>
                        </div>
                    </td>

                </tr>
                </tbody>
            </table>
            <table class="layui-table">
                <colgroup>
                    <col width="150">
                    <col width="300">
                    <col width="300">
                    <col width="100">
                    <col width="150">
                    <col width="100">
                </colgroup>
                <thead>
                <tr>
                    <th>编号</th>
                    <th>类别</th>
                    <th>条目</th>
                    <th>值</th>
                    <th>是否可编辑</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody id="tbody">
                </tbody>
            </table>
        </form>
        <div id="demo7"></div>
    </div>
<div id="super" style="width: 50px;height: 800px;position:absolute;left: 800px;top: 10px;">

</div>
</div>
</body>
</html>
