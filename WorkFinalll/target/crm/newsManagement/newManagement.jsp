<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/8
  Time: 17:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新闻管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/newsManagement/css/newManagement.css" />
    <script type="text/javascript" src="/CRM/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="/CRM/newsManagement/js/newManagement.js"></script>
    <script src="/CRM/plugins/layui/layui.js" charset="utf-8"></script>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-
scale=1, maximum-scale=1">


    <script>
        <%--验证--%>
        $(function(){
            $("#select").click(function(){
                var check1 = false;

                var check2 = false;
                var check3 = false;
                var b1 =  $("#newsNa").val();
                var b2 =  $("#newsAu").val();
                var b3 =  $("#newsDa ").val();

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
        //        删除
        function dele(a) {
            var id=$(a).parents("tr").find("td:eq(0)").text();
            var _this = $(a);
            layer.confirm('确定删除此信息？', {
                btn: ['确定','取消'] //按钮
            }, function(index){
                $.get("${pageContext.request.contextPath}/news/newsdeleteNews.action",{"news.newsId":id}, function (data) {

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


        //分类查询
        $(function(){
            $("#select").click(function(){
                var a = $("#newsNa").val() ;
                var b = $("#newsAu").val() ;
                var c = $("#newsDa").val();
                if(a!=""||b!=""||c!=""){
//传值
                    $.get("${pageContext.request.contextPath}/news/newsfind.action",{newsName:a,newsAuthor:b,newsDate:c},function(data){
                        $("#news_con").html("")
                        var table = $("#news_con") ;
                        var tr = "<tr>" ;
                        $(data).each(function(i,obj){
                            var td =
                                "<td>" + obj.newsName + "</td>" +
                                "<td>" + obj.newsAuthor + "</td>" +
                                "<td>" + obj.newsDate + "</td>" +
                                "<td>" + obj.newsResource + "</td>" +
                                "<td>"+"" +
                                "<a href=\"${pageContext.request.contextPath}/news/newsfindById1.action?newsId="+obj.newsId+"\"><i class=\"layui-icon\" title='修改'>&#xe642;</i></a>\n"+
                                "<a href=\"${pageContext.request.contextPath}/news/newsfindById.action?newsId="+obj.newsId+"\" ><i class=\"layui-icon\" title='查看'>&#xe615;</i></a>\n"+
                                "<a href='#' onclick='dele(this)'><i class=\"layui-icon\" title='删除'>&#xe640;</i></a>\n "
                            "</td>";
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

        //分页

        //ch(data)方法
        function ch(data) {

            var table = $("#news_con") ;
            var tr = "<tr>" ;
            $(data).each(function(i,obj){

                var td =
                        "<td>" + obj.newsId + "</td>" +
                    "<td>" + obj.newsName + "</td>" +
                    "<td>" + obj.newsAuthor + "</td>" +
                    "<td>" + obj.newsDate + "</td>" +
                    "<td>" + obj.newsResource + "</td>" +
                    "<td>"+"" +
                    "<a href=\"${pageContext.request.contextPath}/news/newsfindById1.action?newsId="+obj.newsId+"\"> <i class=\"layui-icon\" title='修改'>&#xe642;</i></a>\n" +
                "    <a href=\"${pageContext.request.contextPath}/news/newsfindById.action?newsId="+obj.newsId+"\" ><i class=\"layui-icon\" title='查看'>&#xe615;</i></a>\n"+
                    "<a href='#' onclick='dele(this)'><i class=\"layui-icon\" title='删除'>&#xe640;</i></a>\n "
                "</td>";
                tr = tr + td + "</tr>" ;
            });
            $(table).append(tr) ;
        }
        function getCurrentpage(curr) {

            $.get("${pageContext.request.contextPath}/news/newspageList.action",{currentPage:curr},function (data) {
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
                                $("#news_con").html("");
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
                    ,content: '<div style="padding: 20px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><img src="../newsManagement/img/news.png" style="margin-left: 90px;width: 85%" ></div>'
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

            $("#helpn").click(function(){
                var othis = $(this), method = othis.data('method');
                active[method] ? active[method].call(this, othis) : '';
            });
        })
    </script>
</head>
<body>
<div id="main">
    <%--路径--%>
    <div id="nav">
        <span class="title1">
		  <a href="">新闻管理 ></a>
		</span>
    </div>
    <%--控制按钮--%>
    <div class="layui-btn-group globalHight">
        <button class="layui-btn" data-method="notice" id="helpn">帮助</button>
        <a href="newNews.jsp"><button class="layui-btn">添加新闻</button></a>
        <button class="layui-btn" id="select">查询</button>
    </div>

    <div>
        <table class="layui-table">
            <tr>
                <td>新闻名称</td>
                <td>
                    <input id="newsNa" name="newsName" type="text"required lay-verify="required" autocomplete="off"/>
                </td>
                <%--<div id="searchList" style="width: 290px; margin-left: 165px;margin-top: 110px;z-index: 999;position: absolute;background-color: #F8F8F8">--%>
                <div id="searchList" style="width: 20%;z-index: 999;position:absolute ;left: 12.5%;background-color: #F8F8F8;top: 160px">

                <ul id="searchList_ul">
                    </ul>
                </div>
                <td>作者</td>
                <td>
                    <input id="newsAu" name="newsAuthor" type="text">

                </td>
                <div id="searchList" style="width: 20%;z-index: 999;position: absolute ;left: 42.5%;background-color: #F8F8F8;top: 160px">
                    <ul id="searchList_ul1">
                </ul>
            </div>
                <td>时间</td>
                <td>
                    <input id="newsDa" name="newsDate" type="text"/>

                </td>
                <div id="searchList" style="width: 20%;z-index: 999;position:absolute; left: 73.5%;background-color: #F8F8F8;top: 160px">
                    <ul id="searchList_ul2">
                </ul>
            </div>
            </tr>
        </table>
        <br/>
        <table class="layui-table">
            <thead>
            <tr>
                <th>编号</th>
                <th>新闻名称</th>
                <th>作者</th>
                <th>发布时间</th>
                <th>来源</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody id="news_con">

            </tbody>
        </table>
        <div id="demo7"></div>
    </div>

</div>
</body>
<script type="text/javascript">
    // 绑定键盘按下并松开事件
    $('#newsNa').bind('keyup', function() {
        $("#searchList_ul").empty();
        var text=$.trim($(this).val());
        if(text!=""){
            $.get("<%=request.getContextPath()%>/news/newsselect.action",{newsName:text},function(data) {
                if($.isEmptyObject(data)){
                }else {
                    $(data).each(function (i, obj) {
                        var tr = "<li>";
                        //   如果有相关的自动提示就显示
                        var td = "<a   title='" + obj + "'href='#'   onclick='fu(this)'>" + obj + "</a>";
                        tr = tr + td + "</li>";
                        $("#searchList_ul").append(tr);
                    })
                }
            })
        }
    });
    //    点击自动提示结果中的某一条，将其内容填充到搜索框中
    function fu(t) {
        var v=$(t).attr("title");
        $("#newsNa").val(v);
        $("#newsName").val($(t).attr("value"))
        $("#searchList_ul").empty();
    }

    // author绑定键盘按下并松开事件
    $('#newsAu').bind('keyup', function() {
        $("#searchList_ul1").empty();
        var text=$.trim($(this).val());
        if(text!=""){
            $.get("<%=request.getContextPath()%>/news/newsselect1.action",{newsAuthor:text},function(data) {
                if($.isEmptyObject(data)){
                }else {
                    $(data).each(function (i, obj) {
                        var tr = "<li>";
                        //   如果有相关的自动提示就显示
                        var td = "<a   title='" + obj + "'href='#'   onclick='fu1(this)'>" + obj + "</a>";
                        tr = tr + td + "</li>";
                        $("#searchList_ul1").append(tr);
                    })
                }
            })
        }
    });
    //    点击自动提示结果中的某一条，将其内容填充到搜索框中
    function fu1(t) {
        var v1=$(t).attr("title");
        $("#newsAu").val(v1);
        $("#newsAuthor").val($(t).attr("value"))
        $("#searchList_ul1").empty();
    }

    // date绑定键盘按下并松开事件
    $('#newsDa').bind('keyup', function() {
        $("#searchList_ul2").empty();
        var text=$.trim($(this).val());
        if(text!=""){
            $.get("<%=request.getContextPath()%>/news/newsselect2.action",{newsDate:text},function(data) {
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
    //    点击自动提示结果中的某一条，将其内容填充到搜索框中
    function fu2(t) {
        var v2=$(t).attr("title");
        $("#newsDa").val(v2);
        $("#newsDate").val($(t).attr("value"))
        $("#searchList_ul2").empty();
    }
</script>
</html>
