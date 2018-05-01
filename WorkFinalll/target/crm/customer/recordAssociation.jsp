<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/28
  Time: 11:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>交往记录</title>
    <link rel="stylesheet" href="../plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="../css/main.css" />
    <link rel="stylesheet" href="../customer/css/recordAssociation.css" />
    <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript"  src="../plugins/layui/layui.js" ></script>
    <script>
        $(function () {
            layui.use('layer', function(){
                var layer = layui.layer;
                var index = layer.load(1, {
                    shade: [0.1,'#fff'] ,
                    time: 500//0.1透明度的白色背景
                });
            });
        })
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

        //公用方法
        function ch(data) {
            var tbody = $("#cus_record") ;
            var tr = "<tr>" ;
            $("#cus_record").html("");
            $(data).each(function(i,obj){
                var time=json2TimeStamp(obj.cstConTime);
                var td = "<td id='cstConId" +i +"'>" + time + "</td>" +
                        "<td>" + obj.cstConAddr + "</td>" +
                        "<td>" + obj.cstConTitle + "</td>"+
                        "<td>" + obj.cstConInfo + "</td>"+
                        "<td>" + obj.cstConMeno + "</td>"+
                        "<td> <a style='cursor: pointer' title='编辑' onclick='modify("+obj.cstConId+")'"+" > <i class='layui-icon'>"+"&#xe642;"+"</i></a>"
                        +"&nbsp;&nbsp;&nbsp;&nbsp;"+"<a style='cursor: pointer' title='删除' onclick='s("+obj.cstConId+")'"+"><i class='layui-icon'>"+"&#xe640;"+"</i></a></td>";
                tr = tr + td + "</tr>" ;
            });
            $(tbody).append(tr) ;
        }
        //分页的公用方法
        function fenye(curr,id,paixu) {
            $.get("${pageContext.request.contextPath}/customer/cstConpageList.action",{currentPage:curr,id:${id},paixu:paixu},function (data) {
                ch(data.data);
//                alert(data.pageSize);
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
        //分页公用方法
        function getCurrentpage(curr) {
            var paixu=$("#paixu").val();
                fenye(curr,${id},paixu)

        }
           $(function () {
                 getCurrentpage(1);
        })


        //修改方法
        function modify(i) {
            window.location.href="${pageContext.request.contextPath}/customer/cstConloadById.action?cstConId="+i+"&&id=${customer.id}";
        };
        //删除操作
        function s(i) {
//            alert(i);
            <%--alert(${id});--%>

            $.get("cstCondelete.action",{cstConId:i,id:${id}},function (data) {

                layui.use('layer', function(){
                    var layer = layui.layer;

                    layer.msg('修改成功',{icon: 1});
                });

                window.location.reload();
            })
        }
        //        //帮助按钮弹出框方法
        function  help() {
            //示范一个公告层
            layer.open({
                type: 1
                ,
                title: false //不显示标题栏
                ,
                closeBtn: false
                ,
                area: ['1400px', '500px']
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
                content: '<div style="padding: 20px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><img src="../images/help_recordAssociation.png" ></div>'
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
        function new_re() {
            window.location.href="cstConnews.action?id=${id}";
        }

        function back_b() {
              window.location.href="customerloadById.action?id=${id}";
        }

//排序
        $(function () {
            $("#paixu").change(function () {
                var paixu=$("#paixu").val();
//                alert(paixu);
                $("#cus_record ").html("");
                $("#demo7").html("");
                fenye(1,${id},paixu)
            })

        })

        //导出Excel表格方法
        function exportExcel() {
            $.get("cstConexportExcel.action",{id:${customer.id}},function (data) {
                alert("导出成功");
            })
        }


    </script>
</head>
<body>
<div id="main">
    <div>
        <span id="title1">
		  <a href="custManage.jsp">客户信息管理 ></a>
		  <a href="customerloadById.action?id=${id}">客户信息 ></a>
		  <a href="cstConlist.action?id=${id}">交往记录</a>
		</span>
    </div>

    <div class="layui-btn-group globalHight">
        <a data-method="notice" class="layui-btn" type="button"  onclick="help()">帮助</a>
        <a data-method="notice" class="layui-btn"  href="cstConexportExcel.action?id=${customer.id}">导出</a>
        <button class="layui-btn" type="button" onclick="new_re()"> 新建</button>
        <button class="layui-btn" type="button" onclick="back_b()">返回</button>
    </div>

    <div>
        <table class="layui-table">
            <tr>
                <td>客户编号</td>
                <td>
                    <label>${customer.cusId}</label>
                </td>
                <td>客户名称</td>
                <td>
                    <label>${customer.cusName}</label>
                </td>
            </tr>
        </table>
        <br>
        <table class="layui-table">
        <thead>
                <tr>
                    <td>时间<select id="paixu" ><option  value="1">升序</option><option value="2">降序</option></select></td>
                    <td>地点</td>
                    <td>概要</td>
                    <td>详细信息</td>
                    <td>备注</td>
                    <td>操作</td>
                </tr>
            </thead>
            <tbody id="cus_record">

            </tbody>
        </table>
        <div id="demo7"></div>
    </div>
</div>
</body>
</html>
