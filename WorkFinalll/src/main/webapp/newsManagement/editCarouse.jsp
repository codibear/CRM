<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/8
  Time: 20:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>编辑轮播图</title>
    <link rel="stylesheet" href="../plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="../css/main.css" />
    <link rel="stylesheet" href="css/editCarouse.css" />

    <script src="../plugins/layui/layui.js" charset="utf-8"></script>
</head>
<body>
<div id="main">
    <%--路径--%>
    <div id="nav">
        <span class="title1">
		  <a href="">轮播管理 ></a>
		  <a href="">编辑轮播图</a>
		</span>
    </div>
    <%--控制按钮--%>
    <div class="layui-btn-group globalHight">
        <button class="layui-btn">帮助</button>
        <a href=""><button class="layui-btn">保存</button></a>
        <a href="carouselManagement.jsp"><button class="layui-btn">返回</button></a>
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
                <td>轮播名称</td>
                <td colspan="3">
                    <input type="text">
                </td>
            </tr>
            <tr>
                <td>原图</td>
                <td colspan="3">

                </td>
            </tr>
            <tr>
                <td>更改图片</td>
                <td colspan="3">
                    <div class="site-demo-upbar">
                        <input type="file" name="file" class="layui-upload-file" id="test">
                    </div>
                </td>
            </tr>
        </table>
    </div>
</div>
<script>
    layui.use('upload', function(){
        layui.upload({
            url: '' //上传接口
            ,success: function(res){ //上传成功后的回调
                console.log(res)
            }
        });

        layui.upload({
            url: '/test/upload.json'
            ,elem: '#test' //指定原始元素，默认直接查找class="layui-upload-file"
            ,method: 'get' //上传接口的http类型
            ,success: function(res){
                LAY_demo_upload.src = res.url;
            }
        });
    });
</script>
</body>
</html>
