<%--
  Created by IntelliJ IDEA.
  User: Amily
  Date: 2017/8/1
  Time: 19:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>指派销售机会</title>
    <link rel="stylesheet" href="../plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="../css/main.css" />
    <link rel="stylesheet" href="../salesManagement/css/AssignSaleOpportunity.css">
    <script src="../plugins/layui/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="../plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="../css/main.css" />
    <link rel="stylesheet" href="../css/custInformation.css"/>
    <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" >
        layui.use('form',function(){});

        function getRootPath_web() {
            //获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
            var curWwwPath = window.document.location.href;
            //获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
            var pathName = window.document.location.pathname;
            var pos = curWwwPath.indexOf(pathName);
            //获取主机地址，如： http://localhost:8083
            var localhostPaht = curWwwPath.substring(0, pos);
            //获取带"/"的项目名，如：/uimcardprj
            var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
            return (localhostPaht + projectName);
        }

        //指派
             $(function () {

                 $("#add").click(function () {
                     var giveMan = $("#selectMan").val();
                     var giveTime = $("#givertime").val();

                     $.get("/CRM/sales/salessave.action", $("#myform").serialize(), function (data) {
                         layer.confirm('保存成功', {
                             icon:6,
                                     btn: ['确定'] //按钮
                                 }, function(){
                                     window.location.href=getRootPath_web()+"/salesManagement/ManageSaleOpportunity.jsp";
                                 }
                         );
                     });


                 })
             })





    </script>
</head>
<body>
<div class="admin-main">
    <div id="main">
        <span class="title1">
        <a href="">销售机会管理 ></a>
        <a href="">指派销售机会</a>
        </span>
        <form class="layui-form" id="myform">

            <div class="layui-btn-group">
                <button type="button" class="layui-btn">  <a href="/CRM/salesManagement/ManageSaleOpportunity.jsp" >返回</a></button>
            <button type="button" class="layui-btn" id="add">保存</button>
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
                        <input type="text" readonly="readonly" name="sales.salesId" lay-verify="OpperSource" autocomplete="off" class="layui-input" value="${sales.salesId}"/>
                    </td>
                    <td class="td1">机会来源</td>
                    <td class="td1">
                        <input type="text" readonly="readonly" name="sales.oppSource" id="oppSource" lay-verify="OpperSource" autocomplete="off" class="layui-input" value="${sales.oppSource}"/>
                    </td>
                </tr>
                <tr>
                    <td class="td1">客户名称</td>
                    <td class="td1">
                        <input type="text" readonly="readonly" name="sales.cusName" id="cusName" lay-verify="CustomerName" autocomplete="off" class="layui-input" required  lay-verify="required" value="${sales.cusName}"/>
                    </td>
                    <td class="td1">成功机率</td>
                    <td class="td1">
                        <input type="text" readonly="readonly" name="sales.succRate" id="succRate" lay-verify="successProbalility" autocomplete="off" class="layui-input" required  lay-verify="required" value="${sales.succRate}"/>
                    </td>
                </tr>
                <tr>
                    <td class="td1">概要</td>
                    <td colspan="3" class="td1">
                        <input type="text" readonly="readonly" name="sales.outLine" lay-verify="outline" autocomplete="off" class="layui-input" required  lay-verify="required" value="${sales.outLine}"/>
                    </td>

                </tr>
                <tr>
                    <td class="td1">联系人</td>
                    <td class="td1">
                        <input type="text" readonly="readonly" name="sales.linkName" lay-verify="linkman" autocomplete="off" class="layui-input" value="${sales.linkName}"/>
                    </td>
                    <td class="td1">联系人电话</td>
                    <td class="td1">
                        <input type="text" readonly="readonly" name="sales.linkPhone" lay-verify="linkmanTel" autocomplete="off" class="layui-input" value="${sales.linkPhone}"/>
                    </td>
                </tr>
                <tr>
                    <td class="td1">机会描述</td>
                    <td colspan="3" class="td1">
                        <textarea name="sales.oppDesc" readonly="readonly"  class="layui-textarea" >${sales.oppDesc}</textarea>
                    </td>

                </tr>
                <tr>
                    <td class="td1">创建人</td>
                    <td class="td1">
                        <input type="text" readonly="readonly" name="sales.creatMan" lay-verify="createMan" autocomplete="off" class="layui-input" required  lay-verify="required" value="${sales.creatMan}"/>
                    </td>
                    <td class="td1">创建时间</td>
                    <td class="td1">
                        <input class="layui-input" readonly="readonly" name="sales.creatTime" onclick="layui.laydate({elem: this, istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" required  lay-verify="required" value="${sales.creatTime}"/>
                    </td>
                </tr>
                </tbody>
            </table>
            <table class="layui-table" lay-even="" lay-skin="row">
                <colgroup>
                    <col width="200">
                    <col width="350">
                    <col width="200">
                    <col width="350">
                </colgroup>
                <tbody>
                <tr style="margin-top: 10px">
                    <td class="td1">指派给</td>
                    <td class="td1">
                        <select name="sales.giveMan"  id="selectMan"   required  lay-verify="required"/>
                            <option value="">请选择..</option>
                            <option value="张三">张三</option>
                            <option value="李四">李四</option>
                            <option value="王五">王五</option>
                            <option value="赵六">赵六</option>
                            <option value="钱七">钱七</option>
                        </select>
                        <span class="tab2">*</span>
                    </td>
                    <td class="td1">指派时间</td>
                    <td class="td1">
                        <div class="layui-inline">
                            <input class="layui-input" id="givertime" name="sales.giveTime" placeholder="自定义日期格式" onclick="layui.laydate({elem: this, istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" required  lay-verify="required"/>
                        </div>
                        <span class="tab2">*</span>
                    </td>
                </tr>

                </tbody>
            </table>
        </form>

    </div>
</div>
</body>
<script>
    layui.use('laydate', function(){
    });
</script>
</html>
