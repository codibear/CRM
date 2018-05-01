<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/11
  Time: 18:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>数据库管理</title>
    <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="../plugins/layui/layui.js" ></script>
    <script type="text/javascript" src="../plugins/layui/lay/dest/layui.all.js" ></script>
    <script src="${pageContext.request.contextPath}/plugins/hcharts/js/highcharts.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/hcharts/js/exporting.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/layui/lay/modules/element.js" charset="utf-8"></script>



    <link rel="stylesheet" href="../plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="../css/main.css" />
    <link rel="stylesheet" href="../css/layer.css">

    <link rel="stylesheet" href="css/DatabaseManagement.css">


    <script type="text/javascript">
        //帮助按钮弹出框方法
        function  help() {
            //示范一个公告层
            layer.open({
                type: 1
                ,
                title: false //不显示标题栏
                ,
                closeBtn: false
                ,
                area: ['1400px', '400px']
                ,
                shade: 0.8
                ,
                resize: true
                ,
                id: 'LAY_layuipro' //设定一个id，防止重复弹出
                ,
                btn: ['好啦，我知道啦']
                ,
                moveType: 0//拖拽模式，0或者1
//                        ,content: '<img src="../images/help_cusManage.png" >'
                ,
                content: '<div style="padding: 20px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><img src="images/manager.png" style="margin-left: 14%"></div>'
                ,
                success: function (layero) {
                    var btn = layero.find('.layui-layer-btn');
                    btn.css('text-align', 'center');
                    btn.find('.layui-layer-btn0').attr({
                        target: '_blank'
                    });
                }
            });
        }
    </script>



<%--验证是否选择要上传的文件--%>
    <script>
        $(function () {
            var iclose;
            layui.use('element', function a(){
                var $ = layui.jquery
                        ,element = layui.element(); //Tab的切换功能，切换事件监听等，需要依赖element模块

                var active = {//触发事件
                    loading: function(othis){
                        var DISABLED = 'layui-btn-disabled';
                        if(othis.hasClass(DISABLED)) return;

                        var n = 0, timer = setInterval(function(){
                            n = n + Math.random()*10|0;
                            if(n>100){
                                n = 100;
                                barclose=n;
                                layer.close(iclose);
                                $('#progressBar').hide();
                               $.get("systemsendTib.action",function (msg1) {
                                    layer.msg(msg1, {
                                        msg: [1, '#3595CC'],
                                        area: ['230px', '48px'],
                                        tips: [1, '#1AA094'],
                                        time: 2000
                                    });
                                   $('#fileUpload').val("");
                               });
                                clearInterval(timer);
                                othis.removeClass(DISABLED);
                            }
                            layui.element().progress('demo', n+'%');
                        }, 300+Math.random()*1000);

                        othis.addClass(DISABLED);
                    }
                };


                $("#site-demo-active").click(function(){

                    var file=$("#fileUpload");
                    var filePath=$("#fileUpload").val();

                    if($.trim(file.val())==''){
                        layer.msg('请选择文件', {
                            msg: [1, '#3595CC'],
                            area: ['200px', '48px'],
                            tips: [1, '#1AA094'],
                            time: 2000
                        });
                        return false;
                    }else if(filePath.indexOf("sql")==-1){
                        layer.msg('上传文件类型为.sql', {
                            msg: [1, '#3595CC'],
                            area: ['230px', '48px'],
                            tips: [1, '#1AA094'],
                            time: 2000
                        });
                        return false;
                    }else{
                        document.forms[0].submit();
                        var othis = $(this), type = $(this).data('type');
                        active[type] ? active[type].call(this, othis) : '';
                        iclose=layer.open({
                            type: 1,
                            title: false,
                            closeBtn: 0,
                            area: '800px',
                            skin: 'layui-layer-nobg', //没有背景色
                            shadeClose: false,
                            content: $('#progressBar')
                        });
                    }
                });
            });
        });
    </script>


    <style type="text/css">
        .DBimg-line{
            height: 150px;
        }
        .DBinput {
            height: 55px;
        }
        h2{
            font-family: "Microsoft YaHei UI";
            color: #1AA094;
            font-size: large;
        }
    </style>
</head>
<body>
<div class="admin-main">
    <div id="main">
        <span class="title1">
                     数据库操作
            </span>
        <div class="layui-btn-group globalHight">
            <button data-method="notice" class="layui-btn" type="button"  onclick="help()">帮助</button>
        </div>
        <%--systemimportDatabase.action--%>

        <div id="DBTable" style="margin-top: 20px; width: 100%;">
            <form id="goBar" action="systemimportDatabase.action" method="post" enctype="multipart/form-data" target="id_iframe">
                <%--<table style="margin-top: 70px;" border="1px solid #000000" >--%>
                <table style="margin-top: 70px; width: 95%;">
                    <tr>
                        <td colspan="2">
                            <h2>备份数据库(自动备份)</h2>
                        </td>
                        <td colspan="2">
                            <h2>恢复数据库</h2>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 15%;" class="DBimg-line">
                            <img src="images/DBbackup.png" style="width: 100px; height: 100px; margin-left: auto;">
                        </td>
                        <td style="width:30%;"><span style="font-family: 'Microsoft YaHei UI'; color: #AEB9C0">*(数据库每周六凌晨两点自动备份一次)</span></td>
                        <td style="width: 15%;"  class="DBimg-line">
                            <img src="images/DBrestore.png" style="width: 100px; height: 100px;">
                        </td>
                        <td style="width: 35%;">
                            <table style="margin-left: 10px">
                                <tr class="DBinput">
                                    <td>
                                        <input type="file" name="file" id="fileUpload" style="margin-left: 10px;"/>
                                    </td>
                                </tr>
                                <tr class="DBinput">
                                    <td>
                                        <input type="button" class="layui-btn site-demo-active" id="site-demo-active" data-type="loading" value="提交文件" style="margin-left: 12px;"/>
                                        <iframe id="id_iframe" name="id_iframe" style="display:none;"></iframe>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </form>

            <%--没有数据时显示--%>
            <div id="div-show" style="width: 60%;height: 200px ; border: 1px solid #59baa8;margin-top: 100px;margin-left:20%;display: none;border-radius: 25px" >
                <div style="margin-left: 25%;margin-top: 53px"><span style="color: #1AA094;font-size: 35px;font-family: 微软雅黑;">目前没有对应的数据</span></div>
            </div>

        </div>
    </div>
    <div>

    </div>
</div>


<%--进度条--%>
<div id="progressBar" style="display: none">
    <div class="layui-progress layui-progress-big" lay-showpercent="true" lay-filter="demo" style="margin: 25px auto ;width: 95%;">
        <div class="layui-progress-bar layui-bg-blue" lay-percent="0%"></div>
    </div>
    <div style="margin-left: 48%"><span style="font-family: 'Microsoft YaHei UI';font-size: 17px;color:#FFFFFF">加载中...</span></div>
</div>
</body>
</html>
