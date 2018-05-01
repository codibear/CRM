<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/8
  Time: 17:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/newsPage/css/newsson1.css"/>

</head>
<body>
<div id="admin-main">
    <%--全部--%>
        <div id="main">
            <%--头部--%>
            <div id="header"  >
                <div id="hdiv1">
                    <ul id="hul2">
                        <li ><a   href="${pageContext.request.contextPath}/privilegeManage/login.action">登录</a></li>
                        <li ><a   href="${pageContext.request.contextPath}/newsPage/indexs.jsp">返回</a></li>
                    </ul>
                </div>
            </div>
                <%--内容部分--%>
            <div id="cont">
                <br/><br/><br/>
                <%--标题--%>
                <div id="title">
                    <span>${newsTitle}</span><br/>
                </div>

                <%--时间、来源--%>
                <div id="">
                </div>
                <span style="font-size: 20px;float: right">${newsDate} &nbsp;&nbsp;${newsResource}&nbsp;&nbsp;&nbsp;作者：${newsAuthor} </span>
                <hr/>

                <%--正文内容部分--%>
                <div id="">
                    ${newsContain}
                    </div>
                </div>

                <%--尾部--%>
                <div id="footer">
                    <a href="#">冀ICP备16050468号&nbsp;|&nbsp;</a>
                    <a href="#">冀B2-20170039&nbsp;|&nbsp;</a>
                    <a href="#">营业执照</a><br />
                    <p>Copyright &copy;by中软小组 CRM 2007-2017，All Rights Reserved</p>
                </div>
        </div>
</div>
</body>
</html>
