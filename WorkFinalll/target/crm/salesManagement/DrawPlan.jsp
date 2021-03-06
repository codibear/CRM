<%--
  Created by IntelliJ IDEA.
  User: Amily
  Date: 2017/8/1
  Time: 20:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>制定计划</title>
    <script src="../plugins/layui/layui.js" ></script>
    <script type="text/javascript" src="../plugins/layui/lay/dest/layui.all.js" ></script>
    <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
    <link rel="stylesheet" href="../plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="../css/main.css" />
    <link rel="stylesheet" href="/CRM/salesManagement/css/DrawPlan.css">

    <script type="text/javascript">
        $(function () {
            $.get("/CRM/plan/planfindBySalesId.action",function (data) {
                var table = $("#planTable");
                var tr = "<tr>";
                $(data).each(function (i,obj) {
                    var mydate = new Date(obj.planTime);
                    var date = mydate.getFullYear() + "-" + (mydate.getMonth() + 1) + "-" + mydate.getDate();
                    var td = "<td style='display: none'>"+ obj.planId +"</td>"+
                            "<td colspan='2'>" + date +
                                "</td>" +
                            "<td colspan='2'>" +
                                "<input type='text' id='"+obj.planId+"'  name='plan.planPro' class='layui-input' value='" + obj.planPro + "'/>"+
                               " </td>"+"<td colspan='2'>"+"<button type='button' class='layui-btn doplanwidth' onclick='modify("+obj.planId+")'>保存</button>"+
                    "<button type='button' class='layui-btn' onclick='del("+ obj.planId +")'>删除</button></td>" ;
                    tr = tr + td + "</tr>"
                });
                table.append(tr);
            });

            //新增
            $("#btnSave").click(function () {

                var planTime = $("#planTime").val();
                var planPro = $("#planPro").val();

                if (planTime.length !=0 && planPro.length !=0){

                    $.get("/CRM/plan/plansave.action",$("#NewSale").serialize(),function(data){
                        layer.confirm('保存成功', {
                                    icon:6,
                                    btn: ['确定'] //按钮
                                }, function(){

                                    location.reload();

                                }
                        );
                    });
                }
            });
        });
        //修改
        function modify(x) {
            var planPro = b(x);

            $.get("/CRM/plan/planupdate.action",{planId:x,planPro:planPro},function (data) {

                layer.msg('修改成功',{icon:6})
            });
        }

        function b(a){
            var va = document.getElementById(a).value;
            return va;
        }


        //删除
        function del(a) {
            $.get("/CRM/plan/plandelete.action",{planId:a}, function (data) {

                layer.confirm('删除成功', {
                            icon:6,
                            btn: ['确定'] //按钮
                        }, function(){

                            $(a).parents("tr").remove();

                            location.reload();
                        }
                );
//                $(a).parents("tr").remove();
            });
        };
    </script>
</head>
<body>
<div class="admin-main">
    <div id="main">
            <span class="title1">
            <a href="">客户开发计划 ></a>
            <a href="">制定计划</a>
            </span>
        <div class="layui-btn-group">
            <button class="layui-btn">帮助</button>
            <a href="/CRM/plan/plandoPlanFind.action?salesId=${sales.salesId}"><button type="button" class="layui-btn">执行计划</button></a>
            <a href="/CRM/salesManagement/CustDist.jsp"><button type="button" class="layui-btn">返回</button></a>
        </div>

        <table class="layui-table" lay-even="" lay-skin="row">
                <colgroup>
                    <col width="200">
                    <col width="350">
                    <col width="200">
                    <col width="350">
                </colgroup>

                <tbody>
                <tr id="rowOne">
                    <td class="td1">编号</td>
                    <td class="td1">
                        ${sales.salesId}
                    </td>
                    <td class="td1">机会来源</td>
                    <td class="td1">
                        ${sales.oppSource}
                    </td>
                </tr>
                <tr>
                    <td class="td1">客户名称</td>
                    <td class="td1">
                        ${sales.cusName}
                    </td>
                    <td class="td1">成功机率(%)</td>
                    <td class="td1">
                        ${sales.succRate}
                    </td>
                </tr>
                <tr>
                    <td class="td1">概要</td>
                    <td colspan="3" class="td1">
                        ${sales.outLine}
                    </td>
                </tr>
                <tr>
                    <td class="td1">联系人</td>
                    <td class="td1">
                        ${sales.linkName}
                    </td>
                    <td class="td1">联系人电话</td>
                    <td class="td1">
                        ${sales.linkPhone}
                    </td>
                </tr>
                <tr>
                    <td class="td1">机会描述</td>
                    <td colspan="3" class="td1">
                        ${sales.oppDesc}
                    </td>
                </tr>
                <tr>
                    <td class="td1">创建人</td>
                    <td class="td1">
                        ${sales.creatMan}
                    </td>
                    <td class="td1">创建时间</td>
                    <td class="td1">
                        ${sales.creatTime}
                    </td>
                </tr>
                <tr style="margin-top: 10px">
                    <td class="td2">指派给</td>
                    <td class="td1">
                        ${sales.giveMan}
                    </td>
                    <td class="td2">指派时间</td>
                    <td class="td1">
                        ${sales.giveTime}
                    </td>
                </tr>
                </tbody>
            </table>
        <table class="layui-table" id="planTable">
                <colgroup>
                    <col width="150">
                    <col width="200">
                    <col width="150">
                    <col width="400">
                </colgroup>
                <tbody>
                <tr>
                    <td colspan="2">日期</td>
                    <td colspan="2">计划项</td>
                    <td>操作</td>
                </tr>
                </tbody>
            </table>

            <table class="layui-table">
                <form id="NewSale" action="" method="post" class="layui-form">
                <tr>
                    <td colspan="4">
                       <button type="button" class="layui-btn"  lay-submit  lay-filter="formDemo" id="btnSave">保存</button>
                    </td>
                </tr>
                <tr>
                    <td>日期</td>
                    <td>
                        <input type="hidden" name="plan.salesId" value="${sales.salesId}" id="salesId"/>
                        <input type="date" name="plan.planTime" id="planTime" autocomplete="off" class="layui-input" required lay-verify="required">
                        <span class="tab3">*</span>
                    </td>
                    <td>计划项</td>
                    <td>
                        <input type="text"  id="planPro" name="plan.planPro" autocomplete="off" class="layui-input" required  lay-verify="required">
                        <span class="tab3">*</span>
                    </td>
                </tr>
                </form>
            </table>
    </div>
</div>
</body>
</html>
