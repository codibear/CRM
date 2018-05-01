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
    <title>修改角色</title>
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

            var cs_id= <%=id%>;
            $(function(){
                $.get("${pageContext.request.contextPath}/privilegeManage/roleloadById.action",{"role.roleId":cs_id},function(data){
                    layui_input0.val(data.roleId);
                    layui_input1.val(data.roleName);

                });
            });

            $("#btnModify").click(function () {
                var lay1=$("#layui-input1").val().length;
                if(lay1!=0){
                    var index = layer.msg('修改中，请稍候', {icon: 16, time: false, shade: 0.8});
                    setTimeout(function () {
                        $.get("${pageContext.request.contextPath}/privilegeManage/rolemodify.action",$("form").serialize(),function(data){

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
        <span class="title1">修改角色</span>
        <div class="main-center">
            <form class="layui-form">

                <div class="layui-form-item">
                    <label class="layui-form-label">角色编号</label>
                    <div class="layui-input-block">
                        <input readonly type="text" name="role.roleId" required  lay-verify="required" placeholder="请输入角色编号" autocomplete="off" class="layui-input" id="layui-input0">
                    </div>
                </div>


                <div class="layui-form-item">
                    <label class="layui-form-label">角色名称</label>
                    <div class="layui-input-block">
                        <input type="text" name="role.roleName" required  lay-verify="required" placeholder="请输入角色名称" autocomplete="off" class="layui-input" id="layui-input1">
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
