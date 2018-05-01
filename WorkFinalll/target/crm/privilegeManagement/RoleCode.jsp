
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
    <title>权限分配</title>
    <link rel="stylesheet" href="../plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="../css/main.css" />
    <link rel="stylesheet" href="css/RoleCode.css">
    <script src="../plugins/layui/layui.js"></script>
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
                area: ['1150px', '480px']
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
                content: '<div style="padding: 20px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><img src="<%=request.getContextPath()%>/images/help-power.png"></div>'
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

        //ch(data)方法
        function ch(data) {
            var table = $("#powerTable") ;
            var tr = "<tr>" ;
            var operate="";

            $(data).each(function(i,obj){
                operate = "<a class='layui-btn layui-btn-mini news_edit'  onclick='modify(this)' ><i class='layui-icon'>&#xe642;</i>编辑</a>" +
                        "<a class='layui-btn layui-btn-danger layui-btn-mini'  onclick='del(this)' ><i class='layui-icon'>&#xe640;</i>删除</a>";
                var td = "<td id="+obj.powerId+">" + obj.powerId + "</td>" +
                        "<td>" + obj.powerName + "</td>" +
                        "<td>" + obj.powerType + "</td>"+
                        "<td>" + obj.powerUrl + "</td>"+
                        "<td>" + obj.powerCode + "</td>"+
                        "<td>" +operate+"</td>";
                tr = tr + td + "</tr>" ;
            });
            $(table).append(tr) ;
        }

        //分页
        function getCurrentpage(curr) {
            $.get("${pageContext.request.contextPath}/privilegeManage/powerpage.action",{currentPage:curr},function (data) {
                ch(data.data);
                layui.use(['laypage', 'layer'],function () {
                    var laypage = layui.laypage
                            ,layer = layui.layer;
                    laypage({
                        cont: 'demo4'
                        ,pages: data.pageSize
                        ,skip: true,
                        curr: curr || 1,
                        jump: function (obj, first) {//触发分页后的回调
                            if (!first) {//点击跳页触发函数自身，并传递当前页：obj.curr
                                $("#powerTable").html("");
                                getCurrentpage(obj.curr);
                            }
                        }
                    });
                })
            }) ;

        }
        //定位当前页
        $(function () {
            getCurrentpage(1);
        })


            //删除
            function del (a) {
                var layer = layui.layer;
                var $ = layui.jquery;
                var id=$(a).parents("tr").find("td:eq(0)").text();
                var _this = $(a);
                layer.confirm('确定删除此信息？',{icon:3, title:'提示信息'},function(index){
                $.get("${pageContext.request.contextPath}/privilegeManage/powerdelete.action",{"power.powerId":id}, function (data) {
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

            //        //修改
            function modify(a) {

                var layer = layui.layer;
                var $ = layui.jquery;

                var id = $(a).parents("tr").find("td:eq(0)").text();
                var _this = $(a);
                    layer.open({
                        title: '修改权限',
                        type: 2,
                        content: "ModifyRoleCode.jsp?id="+id,
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


        layui.use('layer', function(){
            var layer = layui.layer;
            var $ = layui.jquery;

            $('#add-rolecode').click(function () {
               layer.open({
                    title: '增加权限',
                    type: 2,
                    content: 'CreateRoleCode.jsp',
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
            });

            $('#select-rolecode').click(function () {
                layer.open({
                    title: '查询权限',
                    type: 2,
                    content: 'SelectRoleCode.jsp',
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
            });

        });

    </script>
</head>
<body>
<div class="admin-main">
    <div id="main">
        <span class="title1">权限分配</span>
        <div class="layui-btn-group globalHight">
            <button class="layui-btn" id="add-rolecode">增加</button>
            <button class="layui-btn" id="select-rolecode">查询</button>
            <button data-method="notice" class="layui-btn" type="button"  onclick="help()">帮助</button>
        </div>
            <table class="layui-table" id="powerTable">
                <colgroup>
                    <col width="100">
                    <col width="200">
                    <col width="300">
                    <col width="100">
                    <col width="100">
                    <col width="110">
                </colgroup>
                <tbody>
                <tr>
                    <td>权限编号</td>
                    <td>权限名称</td>
                    <td>权限类型</td>
                    <td>权限地址</td>
                    <td>权限编码</td>
                    <td style="width:15%;">操作</td>
                </tr>
                </tbody>
            </table>
        <fieldset class="layui-elem-field layui-field-title" ></fieldset>
        <div id="demo4"></div>
    </div>
</div>
</body>
</html>
