<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/11
  Time: 18:52
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ taglib prefix="s" uri="/struts-tags" %>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>自定义设置</title>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/layer.js"></script>
    <script type="text/javascript" src="../plugins/layui/lay/dest/layui.all.js" ></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/CustomSetting.css">
    <script src="../plugins/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
    <%--<script type="text/javascript" src="../js/jquery.form.js"></script>--%>
    <script type="text/javascript" src="../js/layer.js"></script>

    <style type="text/css">
        html,body{
            margin: 0 auto;

        }
        .admin-main{
            width: 100%;
            height: auto;
        }
        #main{
            width: 85%;
            height: 100%;
            margin: 0 auto;
        }
        .title1{
            height: 30px;
            font-weight: 500;
            font-size: 30px;
            color: #1AA094;
        }
        .layui-btn-group{
            float: right;
        }
        #table1{
            margin-top: 41px;
        }
        tr{
            height: 50px;
            background-color: #F8F8F8;
        }
        .td1{
            height: 50px;
        }

    </style>


    <%--帮助按钮作用《《《《还没有修改《《《--%>
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
                area: ['1400px', '420px']
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
                content: '<div style="padding: 20px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><img src="images/setting.png"  style="margin-left: 10%"></div>'
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
        /*进页面首先请求*/
        $(function () {
            $.get("${pageContext.request.contextPath}/logofindWeb.action",function (data) {
                    var vv=data.systemname;
                    var tit=data.title;
                    var copyright=data.copyright;
                    var logo=data.syslogoip;
                    var logotext = "${pageContext.request.contextPath}/update/"+logo;
                    var i = '<img src = "'+logotext+'" width="60px" height="60px" style="float: left">';
                    $("#text-name").val(vv);
                    $("#text-title").val(tit);
                    $("#text-cop").val(copyright);
                    $("#logo").append(i);
                });
            });
    </script>
    <script>
        /*点击提交按钮更新系统名*/
       $(function () {
            $("#but-name").click(function () {
                $("#text-name").attr("disabled",false);
                $("#but2-name").css("display","block");
                $("#but-name").css("display","none");
                /*text失去焦点做非空验证*/
                $("#text-name").blur(function () {
                    var  text_name = $("#text-name").val();
                    if (text_name.trim()==""){
                        $("#sp1").html("系统名不能为空")
                        $("#but2-name").click(false);
                    }else {
                        $("#sp1").html("")
                        $.get("${pageContext.request.contextPath}/logoupdatename.action",{systemname:text_name},function (data) {
                            alert("修改成功")

                        });
                };
            });
        });
        /*点击提交按钮更新title*/
        $(function () {
            $("#but-title").click(function () {
                $("#text-title").attr("disabled",false);
                $("#but2-title").css("display","block");
                $("#but-title").css("display","none");
                /*text失去焦点做非空验证*/
                $("#text-title").blur(function () {
                    var  text_title = $("#text-title").val();
                    if (text_title.trim()==""){
                        $("#sp2").html("title不能为空")
                        $("#but2-title").click(false);
                    }else {
                        $("#sp2").html("")
                        $.get("${pageContext.request.contextPath}/logoupdatetitle.action",{title:text_title},function (data) {
                            alert("修改成功")
                        });
                    };
                });
            });
        })
        /*点击提交按钮更新copyright*/
        $(function () {
            $("#but-cop").click(function () {
                $("#text-cop").attr("disabled",false);
                $("#but2-cop").css("display","block");
                $("#but-cop").css("display","none");
                /*text失去焦点做非空验证*/
                $("#text-cop").blur(function () {
                    var  text_cop = $("#text-cop").val();
                    if (text_cop.trim()==""){
                        $("#sp3").html("copyright不能为空")
                        $("#but2-cop").click(false);
                    }else {
                        $("#sp3").html("")
                        $.get("${pageContext.request.contextPath}/logoupdatecopyright.action",{copyright:text_cop},function (data) {
                            alert("修改成功")
                        });
                    };
                });
            });
        });
        /*提交logo*/
           //验证
           $(function() {
            $("#but-logo").click(function () {

                var  logo=$("#newPic").val();
                if (logo.length==0){
                   // alert("李旻坏蛋")
                    $("#sp4").html("copyright不能为空")
                }else{
                    $("#sp4").html(" ")

                }

            })

               });
           });

    </script>
</head>
<body>
<div class="admin-main">
    <div id="main">
       <span class="title1">
                     自定义设置
            </span>
        <div class="layui-btn-group globalHight">
            <button data-method="notice" class="layui-btn" type="button"  onclick="help()">帮助</button>
        </div>
        <table class="layui-table" id="table1" style="  width: 85%;margin: 0 auto;margin-top: 30px">
            <colgroup>
                <col width="200">
                <col width="500">
                <col width="200">
            </colgroup>
            <tbody>
            <tr>
                <td class="td1">自定义项</td>
                <td class="td1">当前内容</td>
                <td class="td1">操作</td>
            </tr>
            <%--systemname--%>
            <tr>
                <td class="td1">修改系统名称</td>
                <td class="td1"><input type="text" id="text-name" value="" name="systemname" style=" width: 400px;height: 40px"disabled="disabled" ><span id="sp1"></span> </td>
                <td class="td1">
                    <div class="layui-btn-group" style="float: left">
                        <input type="button" value="编辑" class="layui-btn" id="but-name" >
                        <input type="submit" value="提交" class="layui-btn" id="but2-name"  style="display: none">
                    </div>
                </td>
            </tr>
            <%--logo--%>
            <tr>
                <form action="${pageContext.request.contextPath}/logoexecute.action"  method="post" enctype="multipart/form-data">
                <td class="td1">更换系统logo图</td>
                <td class="td1" id="logo">
                    <input type="file" name="file" id="newPic"><span id="sp4"></span>
                </td>
                <td class="td1">
                        <input type="submit" value="提交" class="layui-btn" id="but-logo" >
                </td>
                </form>
            </tr>
            <%--title--%>
            <tr>
                <td class="td1">修改title</td>
                <td class="td1" ><input type="text" id="text-title" value="" name="title"  style=" width: 400px;height: 40px;" disabled="disabled"><span id="sp2"></span> </td>
                <td class="td1">
                    <div class="layui-btn-group" style="float: left">
                        <input type="button" value="编辑" class="layui-btn" id="but-title">
                        <input type="submit" value="提交" class="layui-btn"  id="but2-title"  style="display: none">
                    </div>
                </td>
            </tr>
            <%--修改版权--%>
            <tr>
                <td class="td1">修改copyright</td>
                <td class="td1" ><input type="text" id="text-cop" value="${webSystem.copyright}" name="copyright"  style=" width: 400px;height: 40px;" disabled="disabled"><span id="sp3"></span> </td>
                <td class="td1">
                    <div class="layui-btn-group" style="float: left">
                        <input type="button" value="编辑" class="layui-btn" id="but-cop" >
                        <input type="submit" value="提交" class="layui-btn"  id="but2-cop"  style="display: none" >
                    </div>

                </td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
