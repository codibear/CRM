<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/12
  Time: 13:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改用户</title>
    <%String id= request.getParameter("id"); %>

    <link rel="stylesheet" href="../plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="../css/main.css" />
    <link rel="stylesheet" href="css/RoleCode.css">
    <script src="../plugins/layui/layui.js"></script>
    <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
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
    </style>

    <script type="text/javascript">
//        layui.use('layer', function() {
        layui.use(['form', 'layedit', 'laydate','layer'], function() {

            var layer = layui.layer;
            var $ = layui.jquery;

            var layui_input0=$("#layui-input0");
            var layui_input1=$("#layui-input1");
            var layui_input2=$("#layui-input2");
            var layui_input3=$("#layui-input3");
            var layui_input4=$("#layui-input4");
//            var layui_input5=$("#layui-input5");
            var layui_input6=$("#layui-input6");
            var layui_input7=$("#layui-input7");
            var layui_input8=$("#layui-input8");
            var layui_input9=$("#layui-input9");
            var cs_id= <%=id%>;
            $(function(){

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


                $.get("${pageContext.request.contextPath}/privilegeManage/userfindById.action",{"user.userId":cs_id},function(data){

                   var birthday = json2TimeStamp(data.birthday);
                    var userDate = json2TimeStamp(data.userDate);

                    layui_input0.val(data.userId);
                    layui_input1.val(data.userNo);
                    layui_input2.val(data.userName);
                    layui_input3.val(data.userPwd);
                    layui_input4.val(data.userSex);
//                    layui_input5.val(data.userSex);
                    layui_input6.val(data.userPhone);
                    layui_input7.val(data.userEmail);
                    layui_input8.val(birthday);
                    layui_input9.val(userDate);
                });
            });

            $("#btnModify").click(function () {

                var lyinput1=$("#layui-input1").val();//用户编号
                var lyinput11=$("#layui-input1").val().length;
                var lyinput2=$("#layui-input2").val();//用户姓名
                var lyinput3=$("#layui-input3").val().length;//密码
                var lyinput4=$("#layui-input6").val();//手机号
                var lyinput5=$("#layui-input7").val();//邮箱
                var lyinput6=$("#layui-input8").val().length;//生日
                var lyinput7=$("#layui-input9").val().length;//入职日期

                var uno=/^[0-9]*$/;//用户编号
                var uname=/^[\u4e00-\u9fa5]+$/;//用户姓名
                var ph=/^1[3|4|5|7|8]\d{9}$/;//手机号
                var email=/^[a-z0-9._%-]+@([a-z0-9-]+\.)+[a-z]{2,4}$|^1[3|4|5|7|8]\d{9}$/;//邮箱

                if(uno.test(lyinput1)&&lyinput11!=0&&uname.test(lyinput2)&&lyinput3!=0&&ph.test(lyinput4)&&email.test(lyinput5)&&lyinput6!=0&&lyinput7!=0){

                var index = layer.msg('修改中，请稍候', {icon: 16, time: false, shade: 0.8});
                setTimeout(function () {
                    $.get("${pageContext.request.contextPath}/privilegeManage/usermodify.action",$("form").serialize(),function(data){
                        if(data.info == "1") {
                            layer.msg('修改成功');
                            window.parent.location.reload(); //刷新父页面
                            var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
                            parent.layer.close(index);
                        }else{
                            layer.msg('修改失败');
                        }
                    });
                    layer.close(index);
                }, 800);
                }
                else {layer.msg('修改格式有误');}
            });

            var form = layui.form()
//                    , layer = layui.layer
                    , layedit = layui.layedit
                    , laydate = layui.laydate;
            form.verify({
                no1: [/^[0-9]*$/, '请输入数字'],
                username:[/^[\u4e00-\u9fa5]+$/,'请输入汉字'],
                phone: [/^1[3|4|5|7|8]\d{9}$/, '手机必须11位，只能是数字！'],
                email: [/^[a-z0-9._%-]+@([a-z0-9-]+\.)+[a-z]{2,4}$|^1[3|4|5|7|8]\d{9}$/, '邮箱格式不对'],
                no2: [/^[0-9]*$/, '请输入数字']

            });

        });

    </script>
</head>
<body>
<div class="admin-main">
    <div id="main">
        <span class="title1">修改用户</span>
        <div class="main-center">
            <form class="layui-form">

            <div class="layui-form-item" style="margin-top: 20px">
                <label class="layui-form-label" >编号</label>
                <div class="layui-input-block">
                    <input readonly id="layui-input0" type="text" name="user.userId" class="layui-input" style="width: 300px;">
                </div>
            </div>

            <div class="layui-form-item" style="margin-top: 20px">
                <label class="layui-form-label" >员工编号</label>
                <div class="layui-input-block">
                    <input id="layui-input1" type="text" name="user.userNo" class="layui-input" required  lay-verify="no1" style="width: 300px;">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">姓名</label>
                <div class="layui-input-block">
                    <input id="layui-input2" type="text" name="user.userName" class="layui-input" required lay-verify="username" style="width: 300px;">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">密码</label>
                <div class="layui-input-inline">
                    <input id="layui-input3" type="text" name="user.userPwd" class="layui-input" style="width: 300px;">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">性别</label>
                <div class="layui-input-block">
                    <input readonly id="layui-input4" type="text" name="user.userSex" class="layui-input" style="width: 300px;">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">手机号</label>
                <div class="layui-input-block">
                    <input id="layui-input6" type="text" name="user.userPhone" class="layui-input" required  lay-verify="phone" style="width: 300px;">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">邮箱</label>
                <div class="layui-input-block">
                    <input id="layui-input7" type="text" name="user.userEmail" class="layui-input" required  lay-verify="email" style="width: 300px;">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">生日</label>
                <div class="layui-input-inline">
                    <input id="layui-input8" type="text" name="user.birthday" class="layui-input" lay-verify="date" onclick="layui.laydate({elem: this, istime: true, format: 'YYYY-MM-DD'})">
                </div>
            </div>
            <div class="layui-form-item" style="margin-top: 15px;">
                <label class="layui-form-label">入职日期</label>
                <div class="layui-input-inline">
                    <input id="layui-input9" type="text" name="user.userDate" class="layui-input" lay-verify="date" onclick="layui.laydate({elem: this, istime: true, format: 'YYYY-MM-DD'})">
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn"  type="button"  id="btnModify">修改</button>
                </div>
            </div>
        </form>
        </div>
    </div>
</div>

</body>
</html>
