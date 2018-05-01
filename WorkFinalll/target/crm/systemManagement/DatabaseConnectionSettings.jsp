<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/14
  Time: 11:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>数据库管理</title>
    <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
    <script src="../js/layer.js"></script>

    <link rel="stylesheet" href="../plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="../css/main.css" />
    <link rel="stylesheet" href="../css/layer.css">
    <link rel="stylesheet" href="css/DatabaseConnectionSettings.css">


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
                area: ['1600px', '500px']
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
                content: '<div style="padding: 20px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><img src="images/CIR7HZO%60H@RFNC~GYO2%7D%60PI.png"></div>'
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



    <script type="text/javascript">
        $(function () {
//            验证数据库连接用户名
            $("#dbUsername").blur(function () {
                var dbUsername =$("#dbUsername").val();
                var reg =/[a-zA-Z0-9]{4,10}/;
                var flag = reg.test(dbUsername);
                if (dbUsername==""){
                    $("#span1").html("数据库连接用户名不能为空");
                }else if (flag==false) {
                    $("#span1").html("数据库连接用户名格式必须是4-10位英文字母和数字");
                }else {
                    $("#span1").html("");
                }
            });
//            验证数据库连接密码
            $("#dbPassword").blur(function () {
                var dbPassword =$("#dbPassword").val();
                var reg =/[a-zA-Z0-9]{4,10}/;
                var flag = reg.test(dbPassword);
                if(dbPassword==""){
                    $("#span2").html("数据库连接密码不能为空");
                } else if (flag==false){
                    $("#span2").html("数据库连接密码格式必须是4-10位英文字母和数字");
                }else {
                    $("#span2").html("");
                }
            });
//            验证数据库名
            $("#dbname").blur(function () {
                var dbname =$("#dbname").val();
                var reg =/[a-zA-Z0-9]{4,10}/;
                var flag = reg.test(dbname);
                if (dbname==""){
                    $("#span3").html("数据库名不能为空");
                }else if(flag==false){
                    $("#span3").html("数据库名格式必须是4-10位英文字母和数字");
                }else {
                    $("#span3").html("");
                }
            });
//            验证IP地址的格式
            $("#IP").blur(function () {
                var IP =$("#IP").val();
                var reg =/^(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9]?[0-9])\.(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9]?[0-9])\.(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9]?[0-9])\.(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9]?[0-9])|localhost$/;
                var flag = reg.test(IP);
                if(flag==false){
                    $("#span4").html("请输入正确的IP地址");
                }else {
                    $("#span4").html("");
                }
            });
        });

        $(function () {
            $("#btn-save").click(function () {
                var dbUsername =$("#dbUsername").val();
                var dbPassword =$("#dbPassword").val();
                var dbname =$("#dbname").val();
                var IP =$("#IP").val();
                var reg =/^(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9]?[0-9])\.(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9]?[0-9])\.(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9]?[0-9])\.(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9]?[0-9])|localhost$/;
                var flag = reg.test(IP);
                if(dbUsername==false){
                    $("#span1").html("数据库连接用户名格式必须是4-10位英文字母和数字");
                    return false;
                }else if(dbPassword==false){
                    $("#span2").html("数据库连接密码格式必须是4-10位英文字母和数字");
                    return false;
                }else if (dbname==false){
                    $("#span3").html("数据库名格式必须是4-10位英文字母和数字");
                    return false;
                }else  if (flag==false){
                    $("#span4").html("请输入正确的IP地址");
                    return false;
                }else {
					 $.get('systemupdateJDBC.action', $("form").serialize(), function(data) {
                    layer.msg(data, {
                        msg: [1, '#3595CC'],
                        area: ['200px', '48px'],
                        tips: [1, '#1AA094'],
                        time: 2000
                    });
                });
                    return true;
                }
            });
        });
    </script>


    <script type="text/javascript">
        $(function () {
            $.get("systemfindJDBC.action",function (data) {
               var dbUsername= data.dbUsername;
               var dbPassword = data.dbPassword;
               var dbname = data.dbname;
               var IP= data.iP;
               $("#dbUsername").val(dbUsername);
               $("#dbPassword").val(dbPassword);
               $("#dbname").val(dbname);
               $("#IP").val(IP);
            })
        });


    </script>



</head>
<body>
<div class="admin-main">
    <div id="main">
        <span class="title1">
                     数据库链接设置
            </span>
        <div class="layui-btn-group globalHight">
            <button data-method="notice" class="layui-btn" type="button"  onclick="help()">帮助</button>
            <button id="btn-save" class="layui-btn">保存</button>
        </div>

        <%--表单--%>
        <table  class="layui-table" id="table1" style="  width: 85%;margin: 0 auto;margin-top: 30px" >
            <form>
            <colgroup>
                <col width="250">
                <col width="450">
                <col width="200">
            </colgroup>
            <tbody>
            <tr>
                <td class="td1">数据库连接用户名</td>
                <td class="td1" colspan="2">
                    <input type="text" id="dbUsername" name="jdbc.dbUsername"><span id="span1"></span>
                </td>
            </tr>
            <tr>
                <td class="td1">数据库连接密码</td>
                <td class="td1" colspan="2">
                    <input type="text" id="dbPassword" name="jdbc.dbPassword" ><span id="span2"></span>
                </td>
            </tr>
            <tr>
                <td class="td1">数据库名</td>
                <td class="td1" colspan="2">
                    <input type="text" id="dbname" name="jdbc.dbname" ><span id="span3"></span>
                </td>
            </tr>
                <td class="td1">IP地址</td>
                <td class="td1" colspan="2">
                    <input type="text" id="IP" name="jdbc.IP" ><span id="span4"></span>
                </td>
            </tr>
            </tbody>
            </form>

            <%--没有数据时显示--%>
            <div id="div-show" style="width: 60%;height: 200px ; border: 1px solid #59baa8;margin-top: 100px;margin-left:20%;display: none;border-radius: 25px" >
                <div style="margin-left: 25%;margin-top: 53px"><span style="color: #1AA094;font-size: 35px;font-family: 微软雅黑;">目前没有对应的数据</span></div>
            </div>

        </table>
    </div>
</div>
</body>
</html>
