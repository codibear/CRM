
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/8
  Time: 18:21
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新增新闻</title>
    <link rel="stylesheet" href="../plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="../css/main.css" />
    <link rel="stylesheet" href="css/newNews.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/kindeditor/themes/default/default.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/kindeditor/plugins/code/prettify.css" />
    <script charset="utf-8" src="${pageContext.request.contextPath}/kindeditor/kindeditor-all-min.js"></script>
    <script charset="utf-8" src="${pageContext.request.contextPath}/kindeditor/zh-CN.js"></script>
    <script charset="utf-8" src="${pageContext.request.contextPath}/kindeditor/prettify.js"></script>
    <script type="text/javascript" src="../plugins/layui/lay/dest/layui.all.js" ></script>
    <script src="../plugins/layui/layui.js" charset="utf-8"></script>

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript">

        <%--验证--%>
        $(function(){
            $("#layui-btn").click(function(){
                var check1 = false;
                var check2 = false;
                var check3 = false;
                var check4 = false;
                var check5 = false;
                var b1 =  $("#newsName").val();
                var b2 =  $("#newsTitle ").val();
                var b3 =  $("#newsAuthor").val();
                var b4 =  $("#newsResource ").val();
//                var b5 =  layui.layedit.getContent(editIndex);
                var b5 =  $("#LAY_demo_editor").val();
                if(b1.trim()!=""){
                    check1 = true;
                }
                if(b2.trim()!=""){
                    check2 = true;
                }
                if(b3.trim()!=""){
                    check3 = true;
                }
                if(b4.trim()!=""){
                    check4 = true;
                }
                if(b5.trim()!=""){
                    check5 = true;
                }

                if((check1&&check2&&check3&&check4&&check5)==true) {

//                        var layedit = layui.layedit ;
//                        var param = $("form").serialize() + layedit.getContent(editIndex) ;
                        $.post("${pageContext.request.contextPath}/news/newssaveNews.action",$("form").serialize(),function(data){

                              layer.confirm('保存成功', {
                                icon:6,
                                btn: ['确定'] //按钮
                            })

                        }) ;

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
                    ,content: '<div style="padding: 20px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><img src="../newsManagement/img/news2.png" style="margin-left: 90px;width: 85%" ></div>'
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

            $("#help1").click(function(){
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
		  <a href="">新增新闻</a>
		</span>
    </div>
        <%--控制按钮--%>
    <div class="layui-btn-group globalHight">
        <button id="help1" class="layui-btn" data-method="notice">帮助</button>
        <button type="button"    lay-submit  lay-filter="formDemo" class="layui-btn"id="layui-btn">保存</button>
        <a href="newManagement.jsp"><button class="layui-btn">返回</button></a>
    </div>
    <%--具体内容--%>
    <div>
        <form class="layui-form">
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
                    <input type="text" required id="newsName" lay-verify="required"  name="news.newsName"/>
                </td>
            </tr>
            <tr>
                <td>新闻标题</td>
                <td colspan="3">
                    <input    type="text" id="newsTitle"  required  lay-verify="required" name="news.newsTitle"/>
                </td>
            </tr>
            <tr>
                <td>作者</td>
                <td>
                    <input type="text" id="newsAuthor" name="news.newsAuthor"/>
                </td>
                <td>来源</td>
                <td>
                    <input  type="text" id="newsResource" name="news.newsResource"/>
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
        </form>

    </div>

</div>

<script>
//    var content ;
//    var editIndex ;
//    layui.use(['form', 'layedit', 'laydate'], function(){
//        var form = layui.form()
//                ,layer = layui.layer
//                ,layedit = layui.layedit
//                ,laydate = layui.laydate;
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
