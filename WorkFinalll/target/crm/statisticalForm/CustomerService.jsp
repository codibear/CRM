<%--
  Created by IntelliJ IDEA.
  User: Amily
  Date: 2017/8/5
  Time: 10:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>客户服务分析</title>
    <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="../js/layer.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/hcharts/js/highcharts.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/hcharts/js/exporting.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/hcharts/js/drilldown.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/hcharts/js/export-csv.js"></script>

    <link rel="stylesheet" href="../plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="../css/main.css" />
    <link rel="stylesheet" href="../css/layer.css">
    <link rel="stylesheet" href="css/CustomerService.css">

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
                content: '<div style="padding: 20px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><img src="img/service.png" style="margin-left: 14%"></div>'
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
        var datas;
        $(function () {
            /*查询年份*/
            $.get("stalist2.action", function (data) {
                var sel = $("#selectYear").val();
                var tr = "";
                $(data).each(function (i, obj) {
                    var option = "<option value='" + obj + "'>" + obj + "</option>";
                    tr = tr + option;
                });
                $("#selectYear").append(tr);
            });
            $(function () {
                //页直接面加载
                var a = $("#selectYear option:selected ").val();

                $.get("stalist.action", {tez: a}, function (data) {
                    datas = data;
                    var chart = new Highcharts.Chart('container', {
                        /* $('#container').highcharts({*/
                        chart: {
                            plotBackgroundColor: null,
                            plotBorderWidth: null,
                            plotShadow: false
                        },
                        title: {
                            text: '所有年份服务类型的占比'
                        },
                        tooltip: {
                            headerFormat: '',
                            pointFormat: '{point.name}: <b>{point.y:.2f}</b> 个，占 <b>{point.percentage:.1f}%</b>'
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
                            name: '所有年份服务类型的个数',
                            data: eval(datas),

                        }]
                    }, function () {
                        setTimeout(function () {
                            $('.highcharts-contextbutton').click();
                        }, 200)
                    });


                    //柱形图
                    var chart = new Highcharts.Chart('container1', {

                        /* $('#container').highcharts({*/
                        chart: {
                            type: 'column'
                        },
                        title: {
                            text: '所有年份各服务类型个数'
                        },
                        subtitle: {
                            text: ''
                        },
                        xAxis: {
                            type: 'category'
                        },
                        yAxis: {
                            title: {
                                tickAmount: 8,
                                text: '总数量'
                            }
                        },
                        legend: {
                            enabled: false
                        },
                        plotOptions: {
                            series: {
                                borderWidth: 0,
                                dataLabels: {
                                    enabled: true,
                                    format: '{point.y:.1f}'
                                }
                            }
                        },
                        tooltip: {
                            headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
                            pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}</b>个 <br/>'
                        },
                        series: [{
                            name: '所有年份各服务类型个数',
                            colorByPoint: true,
                            data: datas
                        }],

                    }, function () {
                        setTimeout(function () {
                            $('.highcharts-contextbutton').click();
                        }, 200)
                    });
                });

            });

            $(function () {
                //打印
                Highcharts.setOptions({
                    lang: {
                        printChart: '打印图表',
                        downloadJPEG: '下载 JPEG 文件',
                        downloadPDF: '下载 PDF   文件',
                        downloadPNG: '下载 PNG  文件',
                        downloadSVG: '下载 SVG  文件',
                        downloadCSV: '下载 CSV  文件',
                        downloadXLS: '下载 XLS   文件'
                    },
                });
            });
            /*点击按年份查询*/
            //传数据
            $("#layui-btn-selete").click(function () {

                var a = $("#selectYear option:selected ").text();
                $.get("stalist.action", {tez: a}, function (data) {
                    datas = data;
                    /*饼形图*/
                    var chart = new Highcharts.Chart('container', {
                        /* $('#container').highcharts({*/
                        chart: {
                            plotBackgroundColor: null,
                            plotBorderWidth: null,
                            plotShadow: false
                        },
                        title: {
                            text: a+'年各服务类型的占比'
                        },
                        tooltip: {
                            headerFormat: '',
                            pointFormat: '{point.name}:<b>{point.y:.2f}</b> 个，占  <b>{point.percentage:.1f}%</b>'
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
                            name: '个数',
                            data: eval(datas),

                        }]
                    }, function () {
                        setTimeout(function () {
                            $('.highcharts-contextbutton').click();
                        }, 200)
                    });

                    /*柱形图*/
                    var chart = new Highcharts.Chart('container1', {

                        /* $('#container').highcharts({*/
                        chart: {
                            type: 'column'
                        },
                        title: {
                            text: a+'年各服务服务类型数量'
                        },
                        subtitle: {
                            text: ''
                        },
                        xAxis: {
                            type: 'category'
                        },
                        yAxis: {
                            title: {
                                tickAmount: 8,
                                text: '总数量'
                            }
                        },
                        legend: {
                            enabled: false
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
                        tooltip: {
                            headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
                            pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}</b> 个<br/>'
                        },
                        series: [{
                            name: '服务类型',
                            colorByPoint: true,
                            data: datas
                        }],

                    }, function () {
                        setTimeout(function () {
                            $('.highcharts-contextbutton').click();
                        }, 200)
                    });
                });

            });
        });

    </script>
</head>
<body>
<div class="admin-main">
    <div id="main">
            <span class="title1">
            <a  style=" height: 30px;font-weight: 500;font-size: 30px;color: #1AA094;">客户服务分析</a>

            </span>
        <div class="layui-btn-group globalHight">
            <button data-method="notice" class="layui-btn" type="button"  onclick="help()">帮助</button>
            <button  id="layui-btn-selete"  class="layui-btn">查询</button>

        </div>
        <form id="NewSale" action="" method="post">
            <table class="layui-table" lay-even="" lay-skin="row">
                <colgroup >
                    <col width="200">
                    <col width="250">
                    <col width="300">
                    <col width="350">
                </colgroup>

                <tbody>
                <tr id="rowOne">
                    <td class="td1">年份</td>
                    <td class="td1"  colspan="2">
                        <%-- <span id="span">xxx</span>--%>
                        <select id="selectYear" name="city" class="size" lay-verify="required" style="width: 180px;" >
                            <%--用插件--%>
                            <option  value="所有">全部</option>

                            </option>

                        </select>
                    </td>
                </tr>
                </tbody>
            </table>

        </form>

        <%--饼图--%>
        <div id="container" style="min-width:400px;height:400px;display: block;margin-top: 30px"></div>
        <div id="container1" style="min-width:400px;height:400px;margin-top: 30px"></div>
    </div>
</div>
</body>
</html>
