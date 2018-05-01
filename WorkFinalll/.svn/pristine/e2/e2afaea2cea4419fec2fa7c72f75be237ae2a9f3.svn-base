<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/9
  Time: 10:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>增加角色</title>
    <link rel="stylesheet" href="../plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="../css/main.css" />
    <link rel="stylesheet" href="css/ManageUser.css">
    <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
    <link rel="stylesheet" href="../js/ztree/zTreeStyle.css" type="text/css" />
    <script src="../js/ztree/jquery.ztree.all-3.5.js" type="text/javascript"></script>
    <script src="../plugins/layui/layui.js"></script>
    <script>
        $(function () {
            // layer
//            layer.open({
//                type: 1, //page层
//                area: ['500px', '300px'],
//                title: 'zTree-layer结合功能',
//                shade: 0.6, //遮罩透明度
//                moveType: 1, //拖拽风格，0是默认，1是传统拖动
//                shift: 0, //0-6的动画形式，-1不开启
//                content: '<div style="padding:50px;">' + $("#powerTree").html() + '</div>'
//            });

                // 授权树初始化
            var setting = {
                data : {
                    key : {
                        name:"powerName",//显示权限名称
                    },
                    simpleData : {//使用简单json数据构造节点数据
                        enable : true,
                        idKey : "powerId", // id编号命名
                        pIdKey : "pId", // 父id编号命名
                        rootId : 0
                    }
                },
                check : {//使用ztree勾选效果
                    enable : true,
                },
            };

            //发送ajax请求，获取节点数据
                $.ajax({
                    url : '${pageContext.request.contextPath}/privilegeManage/powerlistajax.action',
                    type : 'POST',
                    dataType : 'json',
                    success : function(data) {
                        $.fn.zTree.init($("#treeDemo"), setting, data);
                    },
                    error : function(msg) {
                        alert('树加载异常!');
                    }
                });
        })
            // 保存选中的节点
        function save(){

                var treeObj = $.fn.zTree.getZTreeObj("treeDemo");//获得页面中的ztree对象

                var nodes = treeObj.getCheckedNodes(true);//在提交表单之前将选中的checkbox收集

                var array = new Array();
                for (var i = 0; i < nodes.length; i++) {
                    var id = nodes[i].powerId;//权限id
                    array.push(id);
                }
                var powerIds = array.join(",");//1,2,3,4,5

             var input1 = "<input name='powerIds' class=layui-input2 value="+powerIds+">";
            $("#powerTree").append(input1);
            $(".layui-input2").hide();

        }





//        layui.use('layer', function(){
        layui.use(['form', 'layedit', 'laydate','layer'], function() {

            var layer = layui.layer;
            var $ = layui.jquery;

            $("#btnSubmit").click(function () {
                save();
                var lyinput1=$("#layui-input1").val().length;

                if(lyinput1!=0){

                    var index = layer.msg('增加中，请稍候', {icon: 16, time: false, shade: 0.8});
                    setTimeout(function () {
                        $.get("${pageContext.request.contextPath}/privilegeManage/roleadd.action", $("form").serialize(),function(data){
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
    </script>


</head>
<body>
<div class="admin-main">
    <div id="main">
            <span class="title1">增加角色</span>

        <form class="layui-form" method="post">
            <div class="layui-form-item" style="margin-top: 20px">
                <label class="layui-form-label">名称</label>
                <div class="layui-input-block">
                    <input id="layui-input1" type="text" name="role.roleName" required  lay-verify="required" placeholder="请输入角色名称" autocomplete="off" class="layui-input" style="width: 300px;">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">选择权限</label>
                <div class="layui-input-block" id="powerTree">
                    <ul id="treeDemo" class="ztree"></ul>

                    <%--<input type="checkbox" name="like[write]" title="写作">--%>
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
</body>
</html>
