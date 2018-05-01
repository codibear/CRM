
<%--
  Created by IntelliJ IDEA.
  User: Amily
  Date: 2017/8/5
  Time: 15:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="../css/main.css" />
    <link rel="stylesheet" href="css/ManageUser.css"/>
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
                area: ['1100px', '480px']
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
                content: '<div style="padding: 20px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><img src="<%=request.getContextPath()%>/images/help-user.png"></div>'
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

        //分页
        function getCurrentpage(curr) {

            $.get("${pageContext.request.contextPath}/privilegeManage/userpage.action",{currentPage:curr},function (data) {

                layui.use(['laypage', 'layer'],function () {
                    var laypage = layui.laypage
                            ,layer = layui.layer;
                    layui.jquery(function(){
                    //将秒数转化为日期格式
                    function json2TimeStamp(milliseconds){
                    var datetime = new Date();
                    datetime.setTime(milliseconds);
                    var year=datetime.getFullYear();
                    //月份重0开始，所以要加1，当小于10月时，为了显示2位的月份，所以补0
                    var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
                    var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
                    var hour = datetime.getHours()< 10 ? "0" + datetime.getHours() : datetime.getHours();
                    var minute = datetime.getMinutes()< 10 ? "0" + datetime.getMinutes() : datetime.getMinutes();
                    var second = datetime.getSeconds()< 10 ? "0" + datetime.getSeconds() : datetime.getSeconds();
                    return year + "-" + month + "-" + date;
                    }
                    ch(data.data);
                        function ch(data) {

                            var table = $("#userTable") ;
                            var tr = "<tr>" ;
                            var operate="";
                            var userId="";

                            $(data).each(function(i,obj){
                                userId = obj.userId;
                                operate = "<a class='layui-btn layui-btn-mini news_edit'  onclick='modify(this)' ><i class='layui-icon'>&#xe642;</i>编辑</a>" +
                                        "<a class='layui-btn layui-btn-danger layui-btn-mini'  onclick='del(this)' ><i class='layui-icon'>&#xe640;</i>删除</a>";

                                var birthday=json2TimeStamp(obj.birthday);
                                var userDate=json2TimeStamp(obj.userDate);
                                var td = "<td id=" + obj.userId + ">" + obj.userId + "</td>" +
                                        "<td>" + obj.userNo + "</td>" +
                                        "<td>" + obj.userName + "</td>" +
                                        "<td>" + obj.userSex + "</td>" +
                                        "<td>" + obj.userPhone + "</td>" +
                                        "<td>" + obj.userEmail + "</td>" +
                                        "<td>" + birthday + "</td>" +
                                        "<td>" + userDate + "</td>" +
//                                        "<td class='roselist'>" + ro(obj.roleId)+ "</td>" +
                                        "<td>" + operate + "</td>";
                                tr = tr + td + "</tr>";
                            });
                            $(table).append(tr) ;
                        }

                        laypage({
                        cont: 'demo4'
                        ,pages: data.pageSize
                        ,skip: true,
                        curr: curr || 1,
                        jump: function (obj, first) {//触发分页后的回调
                            if (!first) {//点击跳页触发函数自身，并传递当前页：obj.curr
                                $("#userTable").html("");
                                getCurrentpage(obj.curr);
                            }
                        }
                    });
                    });
                })
            }) ;

        }
        //定位当前页
        $(function () {
            getCurrentpage(1);
        })



        layui.use('layer', function(){
            var layer = layui.layer;
            var $ = layui.jquery;
            $(function(){
                //将秒数转化为日期格式
                function json2TimeStamp(milliseconds){
                    var datetime = new Date();
                    datetime.setTime(milliseconds);
                    var year=datetime.getFullYear();
                    //月份重0开始，所以要加1，当小于10月时，为了显示2位的月份，所以补0
                    var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
                    var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
                    var hour = datetime.getHours()< 10 ? "0" + datetime.getHours() : datetime.getHours();
                    var minute = datetime.getMinutes()< 10 ? "0" + datetime.getMinutes() : datetime.getMinutes();
                    var second = datetime.getSeconds()< 10 ? "0" + datetime.getSeconds() : datetime.getSeconds();
                    return year + "-" + month + "-" + date;
                }
            }) ;

            $('#a').click(function () {
                layer.open({
                    title: '增加用户',
                    type: 2,
                    Boolean: true,
                    area: ['750px', '600px'],
                    content: 'AddUser.jsp',
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
            $('#f').click(function () {
                layer.open({
                    title: '查询用户',
                    type: 2,
                    area: ['1000px', '600px'],
                    content: 'FindUser.jsp',
                    Boolean: true,
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
        }) ;
        function del(a) {
            var layer = layui.layer;
            var $ = layui.jquery;
            var id = $(a).parents("tr").find("td:eq(0)").text();
            var _this = $(a);
            layer.confirm('确定删除此信息？',{icon:3, title:'提示信息'},function(index){
                $.get("${pageContext.request.contextPath}/privilegeManage/userdelete.action",{"user.userId":id}, function (data) {
                    if(data.info=="1"){
                        _this.parents("tr").remove();
                        layer.msg('删除成功');
                    }else{
                        layer.msg('删除失败');
                    }
                });
            });
        };
        function modify(a) {
            var layer = layui.layer;
            var $ = layui.jquery;
            var id = $(a).parents("tr").find("td:eq(0)").text();
            var _this = $(a);
            layer.open({
                title: '修改权限',
                type: 2,
                content: "ModifyUser.jsp?id="+id,
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

    </script>
</head>
<body>
<div class="admin-main">
    <div id="main">
        <span class="title1">用户管理</span>
        <div class="layui-btn-group globalHight">
            <button class="layui-btn" id="a" >增加</button>
            <button class="layui-btn" id="f" >查询</button>
            <button data-method="notice" class="layui-btn" type="button"  onclick="help()">帮助</button>
        </div>

        <table class="layui-table" id="userTable">
            <colgroup>
                <col width="100">
                <col width="150">
                <col width="200">
                <col width="100">
                <col width="150">
                <col width="150">
                <col width="150">
                <col width="120">
                <col width="200">
            </colgroup>
            <tbody>
            <tr>
                <td>编号</td>
                <td>员工编号</td>
                <td>用户姓名</td>
                <td>性别</td>
                <td>手机号</td>
                <td>邮箱</td>
                <td>生日</td>
                <td>入职日期</td>
                <td>操作</td>
            </tr>
            </tbody>
        </table>
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;"></fieldset>
        <div id="demo4"></div>
    </div>
</div>
</body>

</html>
