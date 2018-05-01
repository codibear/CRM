<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/14
  Time: 9:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>Title</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $.get("${pageContext.request.contextPath}/news/lunbolist.action",function (data) {
//                var table=$(".carousel-inner")
                var path="";
                var bb=1
                $(data).each(function (i,obj) {

                    var aa="#lunbo"+bb;
                                    bb++;
//                    alert(aa);
                    $(aa).append("<img src='${pageContext.request.contextPath}/assets/img/"+obj.relName+"'class='tutu'/>");
                });
                $("#dododo").append(path);

            });
        })
        </script>
        <style>
            .tutu {width: 100%}
        </style>
    <link href="css/bootstrap.min.css" rel="stylesheet">

  </head>
<body>
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <%--选择按钮--%>
    <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
        <li data-target="#carousel-example-generic" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <%--轮播图--%>
    <div class="carousel-inner" role="listbox" id="dododo" overflow="hidden" style="height: 400px; ">
        <%--轮播图1--%>
        <div class="item active" id="lunbo1">
        </div>
            <%--轮播图2--%>
        <div class="item" id="lunbo2">
        </div>
            <%--轮播图3--%>
        <div class="item"  id="lunbo3">

        </div>
            <%--轮播图4--%>
            <div class="item"  id="lunbo4">

            </div>
        </div>

    <!-- Controls -->
    <%--上一张--%>
    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <%--下一张--%>
    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
</body>
</html>
