<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/8
  Time: 17:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>轮播管理</title>
    <link rel="stylesheet" href="../plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="../css/main.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/newsManagement/css/carouselManagement.css" />
    <link rel="stylesheet" href="../css/layer.css">
    <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
    <script src="../plugins/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="../js/layer.js"></script>

    <script>

        //验证
        $(function(){
            $("#select").click(function(){
                var check1 = false;
                var check2 = false;


                var b1 =  $("#picName").val();
                var b2 =  $("#uploadMan").val();

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

        //查询所有
        $(function () {
            $.get("${pageContext.request.contextPath}/news/lunbolist.action",function(data){
                var table = $("#photo_con") ;
                var tr = "<tr>" ;
                $(data).each(function(i,obj){
                    var td ="<td>" + obj.photoId + "</td>" +
                            "<td>" + obj.picName + "</td>" +
                            "<td>" + obj.uploadMan + "</td>"+
                            "<td>"+"" +
                            "<a href=\"${pageContext.request.contextPath}/news/lunbofindById.action?photoId="+ obj.photoId+"\"> <i class=\"layui-icon\" title='修改'>&#xe642;</i></a>" +
                            "</td>";
                    tr = tr + td + "</tr>" ;
                });
                $(table).append(tr) ;
            }) ;

        });

        //分类查询
        $(function(){
            $("#select").click(function(){
                var a = $("#picName").val() ;
                var b = $("#uploadMan").val() ;
                if(a!=""||b!=""){
//传值
                    //alert("aaa")
                    $.get("${pageContext.request.contextPath}/news/lunbofind.action",{picName:a,uploadMan:b},function(data){
//                        alert(data);
                        $("#photo_con").html("");
                        var table = $("#photo_con") ;
                        var tr = "<tr>" ;
                        $(data).each(function(i,obj){
//                            alert(obj.picName)
                            var td ="<td>" + obj.photoId + "</td>" +
                                    "<td>" + obj.picName + "</td>" +
                                    "<td>" + obj.uploadMan + "</td>"+
                                    "<td>"+"" +
                                    "<a href=\"${pageContext.request.contextPath}/news/lunbofindById.action?photoId="+ obj.photoId+"\"> <i class=\"layui-icon\">&#xe642;</i></a>" +
                                    "</td>";

                            tr = tr + td + "</tr>" ;
                        });
                        $(table).append(tr) ;
                        layer.msg('查询成功', {
                            msg:[1,'#3595CC'],
                            area:['200px','48px'],
                            tips: [1, '#1AA094'],
                            time:2000
                        });

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
                    ,content: '<div style="padding: 20px; line-height: 22px; height: auto; background-color: #393D49; color: #fff; font-weight: 300;"><img src="../newsManagement/img/lunbo.png" style="margin-left: 90px;width: 85%"></div>'
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
<div id="main">
    <h1 ><a href="#" id="title1"> 轮播管理</a></h1>
    <div class="layui-btn-group globalHight">
        <button class="layui-btn"type="button" data-method="notice">帮助</button>
        <%--<a href="updateCarouse.jsp"><button class="layui-btn" id="update" type="button">修改</button></a>--%>
        <button class="layui-btn"type="button" id="select">查询</button>
        <a href="carouselManagement.jsp"><button class="layui-btn" id="update" type="button">返回</button></a>
    </div>

    <div>
        <table class="layui-table">
            <tr>
                <td>名称</td>
                <td>
                    <input type="text" id="picName">
                </td>
                <td>上传人</td>
                <td>
                    <input type="text" id="uploadMan">
                </td>
            </tr>
        </table>
        <br/>
        <table class="layui-table">
            <thead>
                <tr>
                    <th>编号</th>
                    <th>名称</th>

                    <th>上传人</th>
                    <th>操作</th>

                </tr>
            </thead>
            <tbody id="photo_con">

            </tbody>
            <%--<tr>--%>

                <%--<td>美图</td>--%>
                <%--<td>不知道</td>--%>
                <%--<td>2017-08-08</td>--%>
                <%--<td>--%>
                    <%--&nbsp;&nbsp;&nbsp;&nbsp;--%>
                    <%--<a href="editCarouse.jsp" ><i class="layui-icon">&#xe642;</i></a>--%>
                    <%--&nbsp;&nbsp;&nbsp;&nbsp;--%>
                    <%--<a href="selectCarouse.jsp" ><i class="layui-icon">&#xe615;</i></a>--%>
                    <%--&nbsp;&nbsp;&nbsp;&nbsp;--%>
                    <%--<i class="layui-icon">&#xe640;</i>--%>
                <%--</td>--%>
            <%--</tr>--%>

        </table>
        <div id="demo7"></div>
    </div>

</div>
</body>
</html>
