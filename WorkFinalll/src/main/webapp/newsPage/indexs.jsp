<%--
  Created by IntelliJ IDEA.
  User: Amily
  Date: 2017/8/8
  Time: 11:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页</title>
    <link rel="stylesheet" href="css/indexs.css">
    <link rel="stylesheet" type="text/css" href="../indexTime/easyui.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/indexTime/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/indexTime/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/indexTime/js/jquery.fullcalendar.js"></script>

    <script type="text/javascript" src="${pageContext.request.contextPath}/newsPage/js/jquery-1.11.3.min.js" ></script>


</head>
<body>
    <div id="admin-main">
        <div id="main">
            <%--头部 --%>
            <div id="header">
                <%--左侧标题logo--%>
                <div id="logo">CRM</div>

                    <%--右侧内容--%>
                <div id="headerRight">
                    <%--导航--%>
                    <div id="navs">
                        <ul>
                            <a href="${pageContext.request.contextPath}/privilegeManage/login.action"><li>登录</li></a>
                        </ul>
                    </div>
                </div>
            </div>
                <%--轮播--%>
                <div id="conDiv1">

                        <jsp:include page="lunbo.jsp" />
                </div>
                <%--内容部分--%>
            <div id="cont">
                    <%--日历--%>
                    <div id="conDiv2" class="easyui-layout">
                        <div region="center">
                            <div class="easyui-fullCalendar" fit="true"></div>
                        </div>
                    </div>

                    <%--新闻--%>
                    <jsp:include page="newsM.jsp"/>
                </div>

            <%--底部--%>
            <div id="conDiv4">
                <a href="#">冀ICP备16050468号&nbsp;|&nbsp;</a>
                <a href="#">冀B2-20170039&nbsp;|&nbsp;</a>
                <a href="#">营业执照</a><br />
                <p>Copyright &copy;by中软小组 CRM 2007-2017，All Rights Reserved</p>
            </div>
        </div>
    </div>

</body>
</html>
