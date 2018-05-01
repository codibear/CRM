<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/10
  Time: 14:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div id="conDiv1">
    <%--<div id="jquery-script-menu"> </div>--%>
    <div class="slider">
        <div class="slider-container">
            <%--轮播图片--%>
            <div class="slider-wrapper">
                <c:forEach var="lunbo" items="">
                    <div class="slide">
                        <img src="${lunbo.picPath}" alt="jQuery Slider with CSS Transitions" class="imgcup">
                    </div>
                </c:forEach>

            <%--第一张轮播图--%>
                <div class="slide">
                    <img src="../assets/img/img1.jpg" alt="jQuery Slider with CSS Transitions" class="imgcup">
                </div>
                <%--第二张轮播图--%>
                <div class="slide">
                    <img src="../assets/img/img2.jpg" alt="jQuery Slider with CSS Transitions" class="imgcup">
                </div>
                <%--第三张轮播图--%>
                <div class="slide">
                    <img src="../assets/img/img3.jpg" alt="jQuery Slider with CSS Transitions" class="imgcup">
                </div>
                <%--第四张轮播图--%>
                <div class="slide">
                    <img src="../assets/img/img4.jpg" alt="jQuery Slider with CSS Transitions" class="imgcup">
                </div>
            </div>
        </div>
    </div>
    <%--设置轮播样式--%>
    <script type="text/javascript">
        (function() {
            Slider.init({
                target: $('.slider'),
                time: 2000
            });
        })();
    </script>
    <div style="text-align:center;clear:both;">
        <%--<script src="/gg_bd_ad_720x90-2.js" type="text/javascript"></script>--%>
        <%--<script src="/follow.js" type="text/javascript"></script>--%>
    </div>
</div>
</body>
</html>
