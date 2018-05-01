<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/8
  Time: 19:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>编辑新闻</title>
    <%
    String id = request.getParameter("newsId");
    %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" />
    <script type="text/javascript" src="../plugins/layui/lay/dest/layui.all.js" ></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/newsManagement/css/editNews.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/kindeditor/themes/default/default.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/kindeditor/plugins/code/prettify.css" />
    <script charset="utf-8" src="${pageContext.request.contextPath}/kindeditor/kindeditor-all-min.js"></script>
    <script charset="utf-8" src="${pageContext.request.contextPath}/kindeditor/zh-CN.js"></script>
    <link rel="stylesheet" href="../plugins/layui/css/layui.css" media="all" />
    <script charset="utf-8" src="${pageContext.request.contextPath}/kindeditor/prettify.js"></script>

    <script src="../plugins/layui/layui.js" charset="utf-8"></script>

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript">
        $(function(){

            $("#layui-btn").click(function() {
//                var layedit = layui.layedit ;
//                var param = $("form").serialize() + layedit.getContent(editIndex) ;

                $.post("${pageContext.request.contextPath}/news/newsupdateNews.action",$("form").serialize(),function(data){

                    layer.confirm('修改成功', {
                        icon:6,
                        btn: ['确定'] //按钮
                    })

                }) ;

            }) ;
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
                    ,content: '<div style="padding: 20px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><img src="../newsManagement/img/news3.png" style="margin-left: 90px;width: 85%" ></div>'
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
    <%--路径--%>
    <div id="nav">
        <span class="title1">
		  <a href="">新闻管理 ></a>
		  <a href="">编辑新闻</a>
		</span>
    </div>
        <form  class="layui-form" >

        <%--控制按钮--%>
    <div class="layui-btn-group globalHight">
        <button class="layui-btn"type="button" data-method="notice">帮助</button>
        <button class="layui-btn" id="layui-btn" type="button" >保存</button>
        <a href="../newsManagement/newManagement.jsp"><button type="button" class="layui-btn"value="返回">返回</button></a>
    </div>
        <%--具体内容--%>
    <div id="layui-table">
        <table  class="layui-table">
            <colgroup>
                <col width="250" style="background-color: #1E9FFF">
                <col width="450">
                <col width="250" style="background-color: #1E9FFF">
                <col width="450">
            </colgroup>
            <tr>

                <td>新闻名称</td>
                <td colspan="3">
                    <input type="hidden" name="news.newsId" value="${news.newsId}"/>
                    <input type="text"name="news.newsName"value="${news.newsName}"/>
                </td>
            </tr>
            <tr>
                <td>新闻标题</td>
                <td colspan="3" >
                    <input type="text"name="news.newsTitle" value="${news.newsTitle}"/>
                </td>
            </tr>
            <tr>
                <td>作者</td>
                <td>
                    <input type="text" name="news.newsAuthor"value="${news.newsAuthor}"/>
                </td>
                <td>来源</td>
                <td>
                    <input type="text" name="news.newsResource" value="${news.newsResource}"/>
                </td>
            </tr>
            <tr>
                <td colspan="4">新闻内容</td>
            </tr>
            <tr>

                <td colspan="4">
                    <div class="layui-input-block">

                        <textarea name="news.newsContain" lay-verify="content" id="LAY_demo_editor"style=" width:100%;height:800px;">${newsContain}</textarea>

                    </div>
                </td>

            </tr>
        </table>
    </div>
        </form>
</div>

<script>
//    var content ;
//    var editIndex ;
//    layui.use(['form', 'layedit', 'laydate'], function(){
//        var form = layui.form()
//            ,layer = layui.layer
//            ,layedit = layui.layedit
//            ,laydate = layui.laydate;
//
//        //创建一个编辑器
//        editIndex = layedit.build('LAY_demo_editor');
//
//    });


    //  编辑器
    KindEditor.ready(function(K) {
        var editor1 = K.create('textarea[name="news.newsContain"]', {
            cssPath : '<%=request.getContextPath()%>/kindeditor/plugins/code/prettify.css',
            uploadJson : '<%=request.getContextPath()%>/kindeditor/jsp/upload_json.jsp',
            fileManagerJson : '<%=request.getContextPath()%>/kindeditor/jsp/file_manager_json.jsp',
            allowFileManager : true,
            afterCreate : function() {
                var self = this;
                K.ctrl(document, 13, function() {
                    self.sync();
                    K('form[name=myform]')[0].submit();
                });
                K.ctrl(self.edit.doc, 13, function() {
                    self.sync();
                    K('form[name=myform]')[0].submit();
                });
            },
            afterBlur: function(){this.sync();}
        });
        prettyPrint();
    });

</script>

</body>

</html>
