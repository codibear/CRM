<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/8
  Time: 18:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查看新闻</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/newsManagement/css/selectNews.css" />

    <script src="${pageContext.request.contextPath}/plugins/layui/layui.js" charset="utf-8"></script>


</head>
<body>
<div id="main">
    <%--路径--%>
    <div id="nav">
        <span class="title1">
		  <a href="">新闻管理 ></a>
		  <a href="">新闻详情</a>
		</span>
    </div>
    <%--控制按钮--%>
    <div class="layui-btn-group globalHight">
        <%--<button class="layui-btn" data-method="notice">帮助</button>--%>
        <a href="${pageContext.request.contextPath}/newsManagement/newManagement.jsp"><button class="layui-btn">返回</button></a>
    </div>
    <%--具体内容--%>
    <div>
        <table class="layui-table">
            <colgroup>
                <col width="250" style="background-color: #1E9FFF">
                <col width="450">
                <col width="250" style="background-color: #1E9FFF">
                <col width="450">
            </colgroup>
            <tr>
                <td>新闻名称</td>
                <td colspan="3">
                    <label>${newsName}</label>
                </td>
            </tr>
            <tr>
                <td>新闻标题</td>
                <td colspan="3">
                    <label>${newsTitle}</label>
                </td>
            </tr>
            <tr>
                <td>作者</td>
                <td>
                    <label>${newsAuthor}</label>
                </td>
                <td>来源</td>
                <td>
                    <label>${newsResource}</label>
                </td>
            </tr>
            <tr>
                <td colspan="4">新闻内容</td>
            </tr>
            <tr>
                <td colspan="4">
                    <label>
                        ${newsContain}
                    </label>
                </td>
            </tr>

        </table>

    </div>
</div>
</body>
</html>
