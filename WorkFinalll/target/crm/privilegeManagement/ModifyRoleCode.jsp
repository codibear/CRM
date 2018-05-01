<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/11
  Time: 19:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改权限</title>

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

        layui.use('layer', function() {
            var layer = layui.layer;
            var $ = layui.jquery;
            var layui_input0=$("#layui-input0");
            var layui_input1=$("#layui-input1");
            var layui_input2=$("#layui-input2");
            var layui_input3=$("#layui-input3");
            var layui_input4=$("#layui-input4");
            var cs_id= <%=id%>;
            $(function(){
                $.get("${pageContext.request.contextPath}/privilegeManage/powerloadById.action",{"power.powerId":cs_id},function(data){
                    layui_input0.val(data.powerId);
                    layui_input1.val(data.powerName);
                    layui_input2.val(data.powerType);
                    layui_input3.val(data.powerUrl);
                    layui_input4.val(data.powerCode);
                });
            });

            $("#btnModify").click(function () {
                var layui1=$("#layui-input1").val().length;
                var layui2=$("#layui-input2").val().length;
                var layui3=$("#layui-input3").val().length;
                var layui4=$("#layui-input4").val().length;

                if(layui1!=0&&layui2!=0&&layui3!=0&&layui4!=0){
                    var index = layer.msg('修改中，请稍候', {icon: 16, time: false, shade: 0.8});
                    setTimeout(function () {
                        $.get("${pageContext.request.contextPath}/privilegeManage/powermodify.action",$("form").serialize(),function(data){

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
            });
        });

    </script>
</head>
<body>
<div class="admin-main">
    <div id="main">
        <span class="title1">修改权限</span>
        <div class="main-center">
            <form class="layui-form">

                <div class="layui-form-item">
                    <label class="layui-form-label">权限编号</label>
                    <div class="layui-input-block">
                        <input type="text" readonly name="power.powerId" required  lay-verify="required" placeholder="请输入权限编号" autocomplete="off" class="layui-input" id="layui-input0">
                    </div>
                </div>


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
                        <button class="layui-btn "  type="button"  id="btnModify">修改</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
