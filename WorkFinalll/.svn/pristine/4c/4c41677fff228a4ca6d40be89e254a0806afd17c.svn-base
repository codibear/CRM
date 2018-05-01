<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/11
  Time: 18:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>日志记录</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <script type="text/javascript" src="../js/jquery-1.8.3.min.js"  charset="UTF-8"></script>

    <link rel="stylesheet" href="../plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="../css/main.css" />
    <link rel="stylesheet" href="css/Logging.css">

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
                area: ['1400px', '550px']
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
                content: '<div style="padding: 20px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><img src="images/logging.png" style="margin-left: 11%"></div>'
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


    <script src="../plugins/layui/layui.js" charset="utf-8"></script>
    <script>
        //公用方法
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
            return year + "-" + month + "-" + date+ "  " +hour+ ":" +minute+ ":" +second ;
        }

        function ch(data) {
            var tbody = $("#tbody") ;
            var tr = "<tr>" ;

                $(data).each(function(i,obj){
                    var t=json2TimeStamp(obj.createtime);
                    var td = "<td id='id" +i +"'>" + obj.userId + "</td>" +
                        "<td>" + obj.userName + "</td>" +
                        "<td>" + t + "</td>"+
                        "<td>" + obj.meothod + "</td>"+
                        "<td> "+obj.iP+"</td>"+
                        "<td> "+obj.msg+"</td>";
                    tr = tr + td + "</tr>" ;
                });
        $(tbody).html(tr) ;
        }
        //分页公用方法
        function getCurrentpage(curr) {
            $.get("syspageList.action",{currentPage:curr},function (data) {
                ch(data.data);
                layui.use(['laypage', 'layer'],function () {
                    var laypage = layui.laypage
                        ,layer = layui.layer;
                    laypage({
                        cont: 'demo7'
                        ,pages: data.pageSize
                        ,skip: true,
                        curr: curr || 1,
                        jump: function (obj, first) {//触发分页后的回调
                            if (!first) {//点击跳页触发函数自身，并传递当前页：obj.curr
                                $("#cus_content").html("");
                                getCurrentpage(obj.curr);
                            }
                        }
                    });
                })
            }) ;

        }
        $(function () {
            getCurrentpage(1);
        })
    </script>



</head>
<body>
<div class="admin-main">
    <div id="main">
        <span class="title1">
                     日志记录
            </span>
        <div class="layui-btn-group globalHight">
            <button data-method="notice" class="layui-btn" type="button"  onclick="help()">帮助</button>
            <a href="${pageContext.request.contextPath}/downloadExcel.action"><button id="layui-btn-selete" class="layui-btn">导出Excel表</button></a>
        </div>

        <%--日志表格--%>
        <table class="layui-table" id="table"  style="  width: 85%;margin: 0 auto;margin-top: 30px">
         <thead>
         <tr>
             <td class="td1">用户编号</td>
             <td  class="td1">用户姓名</td>
             <td  class="td1">操作时间</td>
             <td  class="td1">访问的方法</td>
             <td  class="td1">IP地址</td>
             <td  class="td1">备注</td>
         </tr>
         </thead>
            <tbody id="tbody"></tbody>

            <%--<c:forEach var="log" items="${logs}">--%>
                <%--<tr>--%>
                    <%--<td>${log.userId}</td>--%>
                    <%--<td>${log.userName}</td>--%>
                    <%--<td>${log.createtime}</td>--%>
                    <%--<td>${log.meothod}</td>--%>
                    <%--<td>${log.IP}</td>--%>
                    <%--<td>${log.msg}</td>--%>
                <%--</tr>--%>
            <%--</c:forEach>--%>
        </table>
        <%--分页--%>
        <div style="margin-left: 20%;margin-top: 20px" id="demo7"></div>
    </div>
</div>
</body>



</html>
