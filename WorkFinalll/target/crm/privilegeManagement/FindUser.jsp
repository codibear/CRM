<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/8
  Time: 19:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查询用户</title>
    <link rel="stylesheet" href="../plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="../css/main.css" />
    <link rel="stylesheet" href="css/ManageUser.css">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <style type="text/css">
        .layui-form-label{
            font-size: 20px;
            color: black;
            font-weight: 320;
        }
        .layui-input{
            width: 300px;

        }
        .layui-textarea{
            width: 300px;
        }
        .main-center{
            margin-top: 30px;
        }
        .show-error1{
            display: none;
            position: absolute;
            top: 75px;
            right: 310px;
            width: 200px;
            height: 40px;
            line-height: 40px;
            font-size: 20px;
            color: red;
        }
    </style>



    <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
    <script src="../plugins/layui/layui.js"></script>

    <script>
        layui.use(['form', 'layedit', 'laydate','layer'], function() {
            var layer = layui.layer;
            var $ = layui.jquery;

            $('#layui-input1').blur(function () {
                var input1=$('#layui-input1').val();

                var show_error1 = $('#show-error1');

                if(!isNaN(input1)&&input1!=""){
                }else{
                    show_error1.css("display","block");
                    show_error1.text("请输入整数进行查询！");
                    $('#layui-input1').focus(function () {
                        var show_error1 = $('#show-error1');
                        show_error1.css("display","none");
                    });
                }
            });
            $('#select-btn').click(function () {
                var input1=$('#layui-input1').val();

                function json2TimeStamp(milliseconds) {
                    var datetime = new Date();
                    datetime.setTime(milliseconds);
                    var year = datetime.getFullYear();
                    //月份重0开始，所以要加1，当小于10月时，为了显示2位的月份，所以补0
                    var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
                    var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
                    var hour = datetime.getHours() < 10 ? "0" + datetime.getHours() : datetime.getHours();
                    var minute = datetime.getMinutes() < 10 ? "0" + datetime.getMinutes() : datetime.getMinutes();
                    var second = datetime.getSeconds() < 10 ? "0" + datetime.getSeconds() : datetime.getSeconds();
                    return year + "-" + month + "-" + date;
                }


                if(!isNaN(input1)&&input1!="") {
                    var index = layer.msg('查询中，请稍候', {icon: 16, time: false, shade: 0.8});
                    setTimeout(function () {

                        $.get("${pageContext.request.contextPath}/privilegeManage/userfindById.action",{"user.userId":input1},function(data){
                            var table = $("#userTable") ;
                            var tr = "<tr>" ;

                            var birthday = json2TimeStamp(data.birthday);
                            var userDate=json2TimeStamp(data.userDate);
                            var td = "<td>" + data.userId + "</td>" +
                            "<td>" + data.userNo + "</td>" +
                            "<td>" + data.userName + "</td>" +
                            "<td>" + data.userSex + "</td>" +
                            "<td>" + data.userPhone + "</td>" +
                            "<td>" + data.userEmail + "</td>" +
                            "<td>" + birthday + "</td>" +
                            "<td>" + userDate + "</td>" ;
                            tr = tr + td + "</tr>" ;
                            $(table).append(tr) ;
                        });
                        layer.close(index);
                    }, 800);
                } else{
                    layer.msg('请正确输入权限编号！');
                }
            });

        });
    </script>
</head>
<body>
<div class="admin-main">
    <div id="main">
            <span class="title1">查询用户</span>

            <div class="layui-form-item" style="margin-top: 20px">
                <label class="layui-form-label">编号</label>
                <div class="layui-input-block">
                    <input type="text" id="layui-input1" name="user.userId" required  lay-verify="no1" placeholder="请输入员工编号" autocomplete="off" class="layui-input" style="width: 300px;">
                </div>
                <span class="show-error1" id="show-error1"></span>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button id="select-btn" type="button" class="layui-btn" lay-submit lay-filter="formDemo">查询</button>
                </div>
            </div>

            <table id="userTable" class="layui-table">
                <colgroup>
                    <col width="10%">
                    <col width="10%">
                    <col width="10%">
                    <col width="10%">
                    <col width="15%">
                    <col width="15%">
                    <col width="15%">
                    <col width="15%">
                </colgroup>
                <tbody>
                <tr>
                    <td>编号</td>
                    <td>员工编号</td>
                    <td>用户姓名</td>
                    <td>性别</td>
                    <td>手机号</td>
                    <td>邮箱</td>
                    <td>生日</td>
                    <td>入职日期</td>
                </tr>
                </tbody>
            </table>

    </div>
</div>
</body>
</html>
