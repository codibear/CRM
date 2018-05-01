<%--
  Created by IntelliJ IDEA.
  User: Amily
  Date: 2017/8/5
  Time: 15:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>增加权限</title>
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
    </style>
    <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
    <script src="../plugins/layui/layui.js"></script>
    <script>

        layui.use('layer', function(){
            var layer = layui.layer;
            var $ = layui.jquery;

            $("#btnSubmit").click(function () {
                var layui1=$("#layui-input1").val().length;//名称
                var layui2=$("#layui-input2").val().length;//类型
                var layui3=$("#layui-input3").val().length;//地址
                var layui4=$("#layui-input4").val().length;//编号

                if (layui1!=0&&layui2!=0&&layui2!=0&&layui3!=0&&layui4!=0){
                    var index = layer.msg('增加中，请稍候', {icon: 16, time: false, shade: 0.8});
                    setTimeout(function () {
                        $.get("${pageContext.request.contextPath}/privilegeManage/powersave.action", $("form").serialize(),function(data){
                            if(data.info == "1") {
                                layer.msg('增加成功');
                                window.parent.location.reload(); //刷新父页面
                                var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
                                parent.layer.close(index);
                            }else{
                                layer.msg('增加失败');
                            }
                        }) ;
                        layer.close(index);
                    },800) ;
                }
            });
        });


        layui.use('element', function(){
                var element = layui.element();
                var $ = layui.jquery;
                var progresNum;
                $("#layui-input1").focus(function () {
                        progresNum='25%';
                        element.progress('progresdemo',progresNum);
                });
                $("#layui-input2").focus(function () {
                    progresNum='50%';
                    element.progress('progresdemo',progresNum);
                });
                $("#layui-input3").focus(function () {
                    progresNum='75%';
                    element.progress('progresdemo',progresNum);
                });
                $("#layui-input4").focus(function () {
                    progresNum='100%';
                    element.progress('progresdemo',progresNum);
                });
        });

    </script>
</head>
<body>
<div class="admin-main">
    <div id="main">
            <span class="title1">增加权限</span>
        <div class="layui-progress layui-progress-big" lay-filter="progresdemo" lay-showPercent="yes" style="margin-top: 30px">
            <div class="layui-progress-bar layui-bg-green" lay-percent="0%"></div>
        </div>

        <div class="main-center">
            <form class="layui-form">

                <div class="layui-form-item">
                    <label class="layui-form-label">权限名称</label>
                    <div class="layui-input-block">
                        <input type="text" name="power.powerName" required  lay-verify="required" placeholder="请输入权限名称" autocomplete="off" class="layui-input" id="layui-input1">
                    </div>
                </div>

                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">权限类型</label>
                    <div class="layui-input-block">
                        <textarea  name="power.powerType" required lay-verify="required" placeholder="请输入权限类型" autocomplete="off" class="layui-textarea" id="layui-input2"></textarea>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">权限地址</label>
                    <div class="layui-input-block">
                        <input type="text" name="power.powerUrl" required  lay-verify="required" placeholder="请输入权限地址" autocomplete="off" class="layui-input" id="layui-input3">
                    </div>
                </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">权限编码</label>
                        <div class="layui-input-block">
                            <input type="text" name="power.powerCode" required  lay-verify="required" placeholder="请输入权限编码" autocomplete="off" class="layui-input" id="layui-input4">
                        </div>
                    </div>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" type="button"  id="btnSubmit">提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
