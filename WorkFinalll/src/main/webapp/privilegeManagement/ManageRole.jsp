<%--
  Created by IntelliJ IDEA.
  User: Amily
  Date: 2017/8/5
  Time: 15:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>角色管理</title>
    <link rel="stylesheet" href="../plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="../css/main.css" />
    <link rel="stylesheet" href="css/ManageRole.css"/>
    <script src="../plugins/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
    <script>

        function  help() {
            //示范一个公告层
            layer.open({
                type: 1
                ,
                title: false //不显示标题栏
                ,
                closeBtn: false
                ,
                area: ['1200px', '480px']
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
                content: '<div style="padding: 20px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><img src="<%=request.getContextPath()%>/images/help-role.png"></div>'
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

        layui.use('layer', function(){
        var layer = layui.layer;
        var $ = layui.jquery;
        $(function(){
            $.get("${pageContext.request.contextPath}/privilegeManage/rolelistNot.action",function (data) {
                var table = $("#roletable");
                var tr = "<tr>";
                var operate="";
                var roleId="";

        $(data).each(function(i,obj){
            roleId = obj.roleId;
            operate = "<a  class='layui-btn layui-btn-mini news_edit'  onclick='modify(this)' ><i class='layui-icon'>&#xe642;</i>编辑</a>" +
            "<a class='layui-btn layui-btn-danger layui-btn-mini'  onclick='del(this)' ><i class='layui-icon'>&#xe640;</i>删除</a>";
            var td = "<td>" + obj.roleId + "</td>" +
                    "<td>" + obj.roleName + "</td> " +
                    "<td>" + operate + "</td>";
        tr = tr + td + "</tr>" ;
        });
        $(table).append(tr) ;
        }) ;
        }) ;
        }) ;


            function del (a) {
                var layer = layui.layer;
                var $ = layui.jquery;
                var id=$(a).parents("tr").find("td:eq(0)").text();
                var _this = $(a);
                layer.confirm('确定删除此信息？',{icon:3, title:'提示信息'},function(index){
                    $.get("${pageContext.request.contextPath}/privilegeManage/roledelete.action",{"role.roleId":id}, function (data) {
                        if(data.info=="1"){
                            _this.parents("tr").remove();
                            layer.msg('删除成功');
                        }else{
                            layer.msg('删除失败');
                        }
                    });
                    layer.close(index);
                });

            }

        //修改
        function modify(a) {

            var layer = layui.layer;
            var $ = layui.jquery;

            var id = $(a).parents("tr").find("td:eq(0)").text();
            var _this = $(a);
            layer.open({
                title: '修改权限',
                type: 2,
                content: "ModifyRole.jsp?id="+id,
                Boolean: true,
                area: ['750px', '600px'],
                shade: [0.3, '#393D49'],
                success : function(){
                    setTimeout(function(){
                        layui.layer.tips('点击此处返回文章列表', '.layui-layer-setwin .layui-layer-close', {
                            tips: 3
                        });
                    },500)
                }
            });
        }

        layui.use('layer', function() {
            var layer = layui.layer;
            var $ = layui.jquery;
            $('#a').click(function () {
                layer.open({
                    title: '增加角色',
                    type: 2,
                    area: ['750px', '600px'],
                    content: 'AddRole.jsp',
                    shade: [0.3, '#393D49'],
                    success: function () {
                        setTimeout(function () {
                            layui.layer.tips('点击此处返回文章列表', '.layui-layer-setwin .layui-layer-close', {
                                tips: 3
                            });
                        }, 500)
                    }
                });
            });

            $('#f').click(function () {
                layer.open({
                    title: '查询角色',
                    type: 2,
                    area: ['750px', '600px'],
                    content: 'FindRole.jsp',
                    shade: [0.3, '#393D49'],
                    success: function () {
                        setTimeout(function () {
                            layui.layer.tips('点击此处返回文章列表', '.layui-layer-setwin .layui-layer-close', {
                                tips: 3
                            });
                        }, 500)
                    }
                });
            });

        });
    </script>

</head>
<body>
<div class="admin-main">
    <div id="main">
        <span class="title1">角色管理</span>
        <div class="layui-btn-group globalHight">
            <button class="layui-btn" id="a">增加</button>
            <button id="f" class="layui-btn">查询</button>
            <button data-method="notice" class="layui-btn" type="button"  onclick="help()">帮助</button>
        </div>

            <table class="layui-table" id="roletable">
                <colgroup>
                    <col width="200">
                    <col width="500">
                    <col width="200">
                </colgroup>
                <tbody>
                <tr>
                    <td>编号</td>
                    <td>名称</td>
                    <td>操作</td>
                </tr>

                </tbody>
            </table>

    </div>
</div>
</body>
</html>
