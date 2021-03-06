<%--
  Created by IntelliJ IDEA.
  User: Amily
  Date: 2017/8/5
  Time: 10:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>客户流失</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="../js/layer.js"></script>
    <script type="text/javascript" src="../plugins/layui/lay/dest/layui.all.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/hcharts/js/highcharts.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/hcharts/js/exporting.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/hcharts/js/export-csv.js"></script>

    <link rel="stylesheet" href="../plugins/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="../css/main.css"/>
    <link rel="stylesheet" href="../css/layer.css">
    <link rel="stylesheet" href="css/CustomerOut.css">


    <script type="text/javascript">
        //帮助按钮弹出框方法
        function help() {
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
                content: '<div style="padding: 20px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><img src="img/out1.png" style="margin-left: 14%"><img src="img/out2.png" style="margin-left: 12%;margin-top: 10px"></div>'
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


    <script>
        $(function () {
            $("#layui-btn-save").click(function () {
                var check1 = false;
                var check2 = false;
                var b1 = $("#customerName").val();
                var b2 = $("#customerManager").val();
                if (b1 != "") {
                    check1 = true;
                }
                if (b2 != "") {
                    check2 = true;
                }

                if ((check1 || check2) == true) {
                    $("#container1").hide();
                    $("#container2").hide();
                    $("#dateTable").show();
                    $.get("stafindByAsk.action", {customerName: b1, customerManager: b2}, function (tabledata) {

                        var thead = $("#dataHead");
                        var tbody = $("#dataBody");
                        var table = $("#dateTable");
                        var tr = "<tr>";

                        $(tabledata).each(function (i, obj) {
                            if (obj.lstId == 0) {
                                $("#container1").hide();
                                $("#container2").hide();
                                $("#dateTable").hide();
                                $("#div-show").show();
                                layer.msg('您输入了错误的信息', {
                                    msg: [1, '#3595CC'],
                                    area: ['200px', '48px'],
                                    tips: [1, '#1AA094'],
                                    time: 2000
                                });
                            } else {
                                $("#container1").hide();
                                $("#container2").hide();
                                $("#dateTable").show();
                                $("#div-show").hide();
                                //拼表格
                                var td = "<td>" + obj.lstId + "</td>" +
                                        "<td>" + obj.lstLostDate + "</td>" +
                                        "<td>" + obj.lstCustName + "</td>" +
                                        "<td>" + obj.lstCustManagerName + "</td>" +
                                        "<td>" + obj.lstReason + "</td>";
                                tr = tr + td + "</tr>";

                            }
                            $.get("stafindLstReason.action", function (data) {
                                if(data=="0"){
                                    $("#container1").hide();
                                    $("#container2").hide();
                                    $("#dateTable").hide();
                                    $("#div-show").show();
                                }else{
                                    $("#back").click(function () {
                                        $("#container1").show();
                                        $("#container2").show();
                                        $("#dateTable").hide();
                                        $("#div-show").hide();
                                    })
                                }
                            });
                        });
                        $(tbody).html(tr);


                    })
                } else {
                    layer.msg('请至少填写一个查询条件', {
                        msg: [1, '#3595CC'],
                        area: ['240px', '48px'],
                        tips: [1, '#1AA094'],
                        time: 2000
                    });
                }
                ;
            });

        });
    </script>
</head>
<body>
<div class="admin-main">
    <div id="main">
            <span class="title1">
            <a style=" height: 30px;font-weight: 500;font-size: 30px;color: #1AA094;">客户流失分析</a>
            </span>


        <div class="layui-btn-group globalHight">
            <button data-method="notice" class="layui-btn" type="button" onclick="help()">帮助</button>
            <button id="layui-btn-save" class="layui-btn" lay-submit lay-filter="formDemo">查询</button>
            <button id="back" class="layui-btn">返回</button>
        </div>
        <form id="NewSale" class="layui-form" action="">
            <table id="table" class="layui-table" lay-even="" lay-skin="row">
                <colgroup>
                    <col width="200">
                    <col width="350">
                    <col width="200">
                    <col width="350">
                </colgroup>

                <tbody>
                <tr id="rowOne">
                    <td class="td1">客户名称</td>
                    <td class="td1">
                        <input type="text" id="customerName" name="customerName" class="layui-input">
                    </td>
                    <td class="td1">客户经理</td>
                    <td class="td1">
                        <input type="text" id="customerManager" name="customerManager" required class="layui-input">
                    </td>
                </tr>
                </tbody>
            </table>

            <table id="dateTable" class="layui-table" style="display: none">
                <thead id="dataHead">
                <tr>
                    <td>编号</td>
                    <td>流失时间</td>
                    <td>客户名称</td>
                    <td>客户经理</td>
                    <td>流失原因</td>
                </tr>
                </thead>
                <tbody id="dataBody"></tbody>
            </table>
        </form>

        <%--没有数据时显示--%>
        <div id="div-show"
             style="width: 60%;height: 200px ; border: 1px solid #59baa8;margin-top: 100px;margin-left:20%;display: none;border-radius: 25px">
            <div style="margin-left: 25%;margin-top: 53px"><span
                    style="color: #1AA094;font-size: 35px;font-family: 微软雅黑;">目前没有对应的数据</span></div>
        </div>

        <%--<div id="container1" style="min-width:400px;height:400px"></div>--%>
        <%--<div id="container2" style="min-width:400px;height:400px"></div>--%>
        <div id="container1" style="margin-top: 30px"></div>
        <div id="container2" style="margin-top: 50px"></div>
    </div>
</div>


<script>
    $(function () {
        var index = layer.load(1, {
            shade: [0.1, '#fff'] //0.1透明度的白色背景
        });
        $.get("stafindLstReason.action", function (data) {
            $(data).each(function (i, obj) {
            });
            if (data == "0") {
                $("#container1").hide();
                $("#container2").hide();
                $("#div-show").show();
            } else {
                $("#container1").show();
                $("#container2").show();
                $("#div-show").hide();
                Highcharts.setOptions({
                    lang: {
                        printChart: '打印图表',
                        downloadJPEG: '下载 JPEG 文件',
                        downloadPDF: '下载 PDF   文件',
                        downloadPNG: '下载 PNG  文件',
                        downloadSVG: '下载 SVG  文件',
                        downloadCSV: '下载 CSV  文件',
                        downloadXLS: '下载 XLS   文件'
                    },
                    navigation: {
                        menuItemStyle: {
                            padding: '6px 14px'
                        }
                    },
                });


                var charts;
                $(document).ready(function () {
                    chart = new Highcharts.Chart({
                        chart: {
                            renderTo: 'container1',
                            plotBackgroundColor: null,
                            plotBorderWidth: null,
                            plotShadow: false
                        },

                        exporting: {
                            filename: '客户流失原因统计'
                        },

                        title: {
                            text: '客户流失原因统计'
                        },
                        tooltip: {
                            headerFormat: '{series.name}<br>',
                            pointFormat: '{point.name}: <b>{point.percentage:.1f}%</b>'
                        },
                        plotOptions: {
                            pie: {
                                allowPointSelect: true,
                                cursor: 'pointer',
                                dataLabels: {
                                    enabled: true,
                                    format: '{point.name}: {point.percentage:.1f} %',
                                },
                                showInLegend: true
                            }
                        },
                        series: [{
                            type: 'pie',
                            name: '客户数量',
                            data: data
                        }]
                    });
                    layer.close(index);
                });
            }
        });
    });

    $(function () {
        var index = layer.load(1, {
            shade: [0.1, '#fff'] //0.1透明度的白色背景
        });
        $.get("stafindYear.action", function (data1) {
            $(data1).each(function (i, obj) {
            });
            $.get("stafindByYear.action", function (data2) {
                $(data2).each(function (i, obj) {
                });

                Highcharts.setOptions({
                    lang: {
                        printChart: '打印图表',
                        downloadJPEG: '下载 JPEG 文件',
                        downloadPDF: '下载 PDF   文件',
                        downloadPNG: '下载 PNG  文件',
                        downloadSVG: '下载 SVG  文件',
                        downloadCSV: '下载 CSV  文件',
                        downloadXLS: '下载 XLS   文件'
                    },
                    navigation: {
                        menuItemStyle: {
                            padding: '6px 14px'
                        }
                    },
                });

                var charts;
                $(document).ready(function () {
                    chart = new Highcharts.Chart('container2',
                            {
                                credits: {
                                    enabled: false,                    // 默认值true
                                },
                                title: {
                                    text: '客户流失原因按年份统计',
                                    x: -20
                                },
                                subtitle: {
//                        text: '数据来源: WorldClimate.com',
                                    x: -20
                                },
                                xAxis: {
                                    categories: eval("[" + data1 + "]")
                                },
                                yAxis: {
                                    title: {
                                        text: '数量'
                                    },
                                    plotLines: [{
                                        value: 0,
                                        width: 1,
                                        color: '#808080',
                                        showInLegend: true
                                    }]
                                },
                                tooltip: {
                                    valueSuffix: '个'
                                },

//                            legend: {
//                                layout: 'vertical',
//                                align: 'right',
//                                verticalAlign: 'middle',
//                                borderWidth: 0
//                            },
                                series: eval("[" + data2 + "]")
                            });
                    layer.close(index);
                });
            });
        });
    });
</script>
</body>
</html>