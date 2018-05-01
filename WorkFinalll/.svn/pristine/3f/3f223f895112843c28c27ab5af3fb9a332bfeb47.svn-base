<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/9
  Time: 10:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查询角色</title>
        <link rel="stylesheet" href="../plugins/layui/css/layui.css" media="all" />
        <link rel="stylesheet" href="../css/main.css" />
        <link rel="stylesheet" href="css/RoleCode.css">
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
            top: 68px;
            right: 50px;
            width: 200px;
            height: 40px;
            line-height: 40px;
            font-size: 20px;
            color: red;
        }
        .show-error2{
            display: none;
            position: absolute;
            top: 120px;
            right: 50px;
            width: 200px;
            height: 40px;
            line-height: 40px;
            font-size: 20px;
            color: red;
        }
        </style>
    <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
    <script src="../plugins/layui/layui.js"></script>
    <script type="text/javascript">

        layui.use('layer', function() {
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
                if(!isNaN(input1)&&input1!="") {
                    var index = layer.msg('查询中，请稍候', {icon: 16, time: false, shade: 0.8});
                    setTimeout(function () {
                        $.get("${pageContext.request.contextPath}/privilegeManage/roleloadById.action",{"role.roleId":input1},function(data){
                            var table = $("#selectTable") ;
                            var tr = "<tr>" ;
                            var td = "<td>" + data.roleId + "</td>" +
                                    "<td>" + data.roleName + "</td>" ;
                            tr = tr + td + "</tr>" ;
                            $(table).append(tr) ;
                        });
                        layer.close(index);
                    }, 800);
                } else{
                    layer.msg('请正确输入角色编号！');
                }
            });

        });

    </script>
</head>
<body>
<div class="admin-main">
    <div id="main">
        <span class="title1">查询角色</span>
        <div class="main-center">
            <div class="layui-form-item">
                <label class="layui-form-label">角色编号</label>
                <div class="layui-input-block">
                    <input type="text" name="role.roleId" required  lay-verify="required" placeholder="请输入角色编号" autocomplete="off" class="layui-input" id="layui-input1">
                </div>
                <span class="show-error1" id="show-error1"></span>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" type="button"  id="select-btn">查询</button>
                </div>
            </div>
            <table id="selectTable" class="layui-table">
                <colgroup>
                    <col width="10%">
                    <col width="20%">
                </colgroup>
                <tbody>
                <tr>
                    <td>角色编号</td>
                    <td>角色名称</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
