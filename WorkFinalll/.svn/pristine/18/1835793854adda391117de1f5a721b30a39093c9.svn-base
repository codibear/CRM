<%--
  Created by IntelliJ IDEA.
  User: Amily
  Date: 2017/8/5
  Time: 11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>客户贡献分析</title>
    <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="../js/layer.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/hcharts/js/highcharts.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/hcharts/js/exporting.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/hcharts/js/drilldown.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/hcharts/js/export-csv.js"></script>


    <!-- 插件文件 -->
    <%--<script type="text/javascript" src="../resources/js/export-csv.js"></script>--%>


    <link rel="stylesheet" href="../plugins/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="../css/main.css"/>
    <link rel="stylesheet" href="../css/layer.css">
    <link rel="stylesheet" href="css/CustomerContribution.css">


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
                content: '<div style="padding: 20px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><img src="img/contribute.png" style="margin-left: 14%"><img src="img/contribute2.png" style="margin-left: 13%;margin-top: 10px"><img src="img/cotribute3.png" style="margin-top: 10px;margin-left: 13%"></div>'
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



</head>
<body>
<div id="main">
    <%--路径--%>
    <div id="nav" style="margin-top: 15px">
        <span class="title1">
		  <a style=" height: 30px;font-weight: 500;font-size: 30px;color: #1AA094;">客户贡献分析 ></a>
		</span>
    </div>

    <%--//选择按钮--%>
    <div class="layui-btn-group globalHight">
        <button data-method="notice" class="layui-btn" type="button"  onclick="help()">帮助</button>
        <%--<button id="layui-btn-selete" class="layui-btn" lay-submit lay-filter="formDemo"></button>--%>
    </div>
    <form id="NewSale">
        <table class="layui-table">
            <colgroup>
                <col width="200">
                <col width="250">
                <col width="300">
                <col width="350">
            </colgroup>
            <tr>
                <td class="td1" colspan="4"></td>
            </tr>

        </table>
    </form>
        <%--没有数据时显示--%>
        <div id="div-show" style="width: 60%;height: 200px ; border: 1px solid #59baa8;margin-top: 100px;margin-left:20%;display: none;border-radius: 25px" >
           <div style="margin-left: 25%;margin-top: 53px"><span style="color: #1AA094;font-size: 35px;font-family: 微软雅黑;">目前没有对应的数据</span></div>
        </div>

    <%--<div style="width:80%;margin-top:30px;float: left">--%>
        <div id="container" style="min-width:400px;height:400px;margin-top: 30px"></div>
    <%--</div>--%>
    <%--<div style="width:80%;margin-top: 30px;margin-left:10%;float: left">--%>
        <div id="container2" style="min-width:400px;height: 400px;margin-top: 40px"></div>
    <%--</div>--%>
</div>

<script>

    $(function () {
        var data1;
        var data2;
        $.get("stafindCustAndYear.action", function (data) {
            data2 = data;
            $.get("stafindSumMoney.action", function (data) {
                data1 = data;
                if (data1==0){
                    $("#container").hide();
                    $("#container1").hide();
                    $("#div-show").show();
                }else {
                    //柱形图
                    $(document).ready(function () {
                        Highcharts.setOptions({
                            lang: {
                                drillUpText: '<span style="font-size:5px;">返回 {series.name}</span>',
                                printChart: '打印图表',
                                downloadJPEG: '下载 JPEG 文件',
                                downloadPDF: '下载 PDF   文件',
                                downloadPNG: '下载 PNG  文件',
                                downloadSVG: '下载 SVG  文件',
                                downloadCSV: '下载 CSV  文件',
                                downloadXLS: '下载 XLS   文件',
                                downloadXLS: '下载 XLS   文件'
                            },
                            navigation: {
                                menuItemStyle: {
                                    padding: '6px 14px'
                                }
                            },
                            credits: {
                                text: '咖啡之音'
                            }
                        });

                        $('#container2').highcharts({

                            chart: {
                                type: 'column'
                            },
                            title: {
                                text: '不同客户各年份的订单金额'
                            },
                            xAxis: {
                                type: 'category'
                            },
                            yAxis: {
                                title: {
                                    tickAmount: 8,
                                    text: '金额'
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
                                        format: '￥{point.y:.1f}'
                                    }
                                }
                            },
                            tooltip: {
                                headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
                                pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>￥{point.y:.2f}</b> <br/>'
                            },
                            series: [{
                                name: '客户名称',
                                colorByPoint: true,
                                data: data1
                            }],
                            drilldown: {
                                series: data2
                            }
                        });
                    });

//                饼状图
                    $(document).ready(function () {
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
                            credits: {
                                text: '咖啡之音'
                            }
                        });

                        $('#container').highcharts({

                            chart: {
                                renderTo: 'container',
                                plotBackgroundColor: null,
                                plotBorderWidth: null,
                                plotShadow: false
                            },
                            exporting: {
                                filename: '不同客户的总订单金额'
                            },
                            title: {
                                text: '不同客户的总订单金额'
                            },
                            tooltip: {
                                headerFormat: '',
                                pointFormat: '{point.name}: <b>{point.percentage:.1f}%</b>  金额<b>{point.y:.2f}元</b>'
                            },
                            plotOptions: {
                                pie: {
                                    allowPointSelect: true,
                                    cursor: 'pointer',
                                    dataLabels: {
                                        enabled: true,
                                        format: '{point.name}: {point.percentage:.1f} %',
                                        style: {
                                            color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                                        }
                                    },
                                    showInLegend: true
                                }
                            },
                            series: [{
                                type: 'pie',
                                name: '订单总金额',

                                data: data1
                            }],
                        }, function () {
                            setTimeout(function () {
                                $('.highcharts-contextbutton').click();
                            }, 200);
                        });
                        $('#preview').click(function () {
                            alert(chart.getCSV());
                        })
                    });
                }
            });
        });
    });
</script>

</body>
</html>
