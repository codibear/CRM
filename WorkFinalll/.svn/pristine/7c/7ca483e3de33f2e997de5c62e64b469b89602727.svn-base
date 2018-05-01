<%--
  User: lenghaoran
  Date: 2017/7/27
  Time: 10:07
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>登录</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css" />
    <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
    <script src="../plugins/layui/layui.js"></script>
    <script>
        $(function () {
            var err = document.getElementById("err").value;
            if (err != ""){
                document.getElementById("span1").innerHTML = err;
            }
        });

    </script>
    <%--<script type="text/javascript">--%>
        <%--/*获得版权*/--%>
<%--//        $(function () {--%>
<%--//            $.get("logofindTitle.action",function (data) {--%>
<%--//                var copyright=data.copyright;--%>
<%--//                $("#foot").append(copyright)--%>
<%--//                alert(copyright);--%>
<%--//            })--%>
<%--//        })--%>
    <%--</script>--%>
</head>

<body class="beg-login-bg">
<div class="beg-login-box">
    <header>
        <h1>系统登录</h1>
    </header>
    <div class="beg-login-main">
        <form action="" class="layui-form" method="post" ><input name="__RequestVerificationToken" type="hidden" value="fkfh8D89BFqTdrE2iiSdG_L781RSRtdWOH411poVUWhxzA5MzI8es07g6KPYQh9Log-xf84pIR2RIAEkOokZL3Ee3UKmX0Jc8bW8jOdhqo81" />
            <div class="layui-form-item">
                <label class="beg-login-icon">
                    <i class="layui-icon">&#xe612;</i>
                </label>
                <input type="text" name="username" lay-verify="userName" autocomplete="off" placeholder="这里输入登录名" class="layui-input">
            </div>
            <div class="layui-form-item">
                <label class="beg-login-icon">
                    <i class="layui-icon">&#xe642;</i>
                </label>
                <input type="password" name="password" lay-verify="password" autocomplete="off" placeholder="这里输入密码" class="layui-input">
            </div>
            <div class="layui-form-item">
                <div class="beg-pull-left beg-login-remember">

                    <label>记住帐号？</label>

                    <input type="checkbox" name="rememberMe" value="true" lay-skin="switch" checked title="记住帐号">

                </div>
                <div class="beg-pull-right">
                    <button class="layui-btn layui-btn-primary" lay-submit lay-filter="login">
                        <i class="layui-icon">&#xe650;</i> 登录
                    </button>

                </div>
                <div class="beg-clear" style="padding-top: 20px"><a href="${pageContext.request.contextPath}/privilegeManage/gonews.action" style="float: right;margin-right: 4px">暂不登录>></a></div>
                <input type="hidden" id="err" value="${err}"/>
            </div>
        </form>
    </div>
    <footer>
        <span id="span1" style="color: red; padding-left: 147px"></span>
        <p id="foot"></p>
    </footer>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/plugins/layui/layui.js"></script>
<script>
    layui.use(['layer', 'form'], function() {
        var layer = layui.layer,
                $ = layui.jquery,
                form = layui.form();

//        form.on('submit(login)',function(data){
//
//            location.href='index.jsp';
//            return false;
//        });
    });
</script>
</body>
</html>