<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/10
  Time: 14:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新闻模块</title>
    <script type="text/javascript"src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js" charset="UTF-8"></script>
    <script>
        $(function () {

            $.get("${pageContext.request.contextPath}/news/newsfindNews.action",function (data) {

                var li="";
                var table=$("#news");
                $(data).each(function (i,obj) {
                    var li1="<li>";
                    var td="<a class='newsA' href='${pageContext.request.contextPath}/news/newsfindById2.action?newsId="
                            +obj.newsId+"' > <span class='topNews' id='newsP'>"+
                            "["+obj.newsName+"]"+"</span>"
                            + obj.newsTitle+"</a>";
                    li=li+li1+td+"</li>";
                });
                $(table).append(li);
            });
        });
    </script>
</head>
<body>
<div id="conDiv3">
    <div id="newsHead">
        <h2 id="newsKey">今日要点</h2>
    </div>
    <%--新闻内容--%>
    <div id="newsContent" overflow="scroll" style="height: 250px">

            <marquee direction="up" height="200px" onmouseover="this.stop()" onmouseout="this.start()">
                <%--新闻内容--%>
                <ul id="news">
                </ul>
            </marquee>
    </div>

</div>

</body>
</html>
