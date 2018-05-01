<%--
  Created by IntelliJ IDEA.
  User: Amily
  Date: 2017/8/5
  Time: 11:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>客户构成</title>
    <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="../js/layer.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/hcharts/js/highcharts.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/hcharts/js/exporting.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/hcharts/js/export-csv.js"></script>

    <link rel="stylesheet" href="../plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="../css/main.css" />
    <link rel="stylesheet" href="../css/layer.css">
    <link rel="stylesheet" href="css/CustomerConstitute.css">


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
                content: '<div style="padding: 20px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><img src="img/constitute1.png" style="margin-left: 12%"><img src="img/constitute2.png" style="margin-top: 10px;margin-left: 13%"></div>'
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
<div class="admin-main">
    <div id="main">
            <span class="title1">
            <a style=" height: 30px;font-weight: 500;font-size: 30px;color: #1AA094;">客户构成分析</a>
            </span>
        <div class="layui-btn-group globalHight">
            <button data-method="notice" class="layui-btn" type="button"  onclick="help()">帮助</button>
            <button id="layui-btn-selete" class="layui-btn">查询</button>

        </div>
        <form id="NewSale" action="" method="post">
            <table class="layui-table"  lay-even="" lay-skin="row">
                <colgroup>
                    <col width="200">
                    <col width="250">
                    <col width="300">
                    <col width="350">
                </colgroup>

                <tbody>
                <tr id="rowOne">
                    <td class="td1">等级</td>
                    <td class="td1" colspan="2">
                        <select id="selectfindByRank" name="rank" class="size" lay-verify="required" style="width: 180px;" >
                            <option value="战略合作伙伴">战略合作伙伴</option>
                            <option value="合作伙伴">合作伙伴</option>
                            <option value="大客户">大客户</option>
                            <option value="重点开发客户">重点开发客户</option>
                            <option value="普通客户">普通客户</option>
                        </select>
                    </td>


                </tr>
                </tbody>
            </table>

        </form>

        <%--没有数据时显示--%>
        <div id="div-show" style="width: 60%;height: 200px ; border: 1px solid #59baa8;margin-top: 100px;margin-left:20%;display: none;border-radius: 25px" >
            <div style="margin-left: 25%;margin-top: 53px"><span style="color: #1AA094;font-size: 35px;font-family: 微软雅黑;">目前没有对应的数据</span></div>
        </div>

        <div id="container" style="min-width:400px;height:400px; "></div>
        <div id="container1" style="min-width:400px;height:400px; margin-top: 30px"></div>
        <div id="container2" style="min-width:400px;height:400px; margin-top: 30px"></div>
        <%--<div id="container3" style="min-width:400px;height:400px"></div>--%>
    </div>
</div>
<script>
    var datas;

    $(function () {
        var  a=$("#s option:selected").text();
        $.get("stafind.action",function (data) {
            datas=data;
            if (data==0){
                $("#container").hide();
                $("#container1").hide();
                $("#container2").hide();
                $("#div-show").show();
            }else{

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
                $('#container').highcharts({
                    chart: {
                        plotBackgroundColor: null,
                        plotBorderWidth: null,
                        plotShadow: false
                    },
                    title: {
                        text: '各等级客户所占的比例'
                    },
                    legend: {
                        enabled: true
                    },
                    tooltip: {
                        headerFormat: ' ',
                        pointFormat: '{point.name}: {point.y:.2f}个     ，  占{point.percentage:.1f}%'
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
                        name: '客户数量',
                        data:
                            eval(datas),
                    }]
                });
            }
        });
    });

</script>

<!--/*按等级查询*/-->

<script>
    var xtext=[];
    var x=[];
    $(function () {
        $("#layui-btn-selete").click(function () {
            $("#container2").hide();
            $("#container1").hide();
            var  a=$("#selectfindByRank").find("option:selected").text();
            $.get("stafindByRank.action",{rank:a},function (data) {
                xtext=data[0];
                x=data[1];
                if (x=="0,0,0"){
                    $("#container").hide();
                    $("#container1").hide();
                    $("#container2").hide();
                    $("#div-show").show();
                }else {
                    $("#container").show();
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

                    $('#container').highcharts({
                        chart: {
                            type: 'column',

                        },
                        title: {
                            text: '不同等级的客户数量',
                        },
                        exporting: {
                            filename: '不同等级客户数量'
                        },

                        xAxis: {
                            text: '等级',
                            categories: xtext//横坐标
                        },
                        yAxis: {
                            title: {
                                text: '客户数量'
                            },
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
                            headerFormat: '<span style="font-size:11px;font-size: large">{series.name}</span><br>',
                            pointFormat: '<span style="color:{point.color};font-size: larger">{point.name}</span>: <b>{point.y:.2f}</b>'
                        },
                        series: [{
                            name: '客户名称',
                            colorByPoint: true,
                            data:
                                eval("[" + x + "]"),//竖坐标
                        }],
                    });
                }
            });
        }) ;
    })
</script>


<!--按满意度查询-->
<script>
    var xtext=[];
    var x=[];
    $(function () {
//        $("#layui-btn-selete").click(function () {
//            alert("welcome");
//            var a = $("#selectBySatisfy").find("option:selected").text();
        $.get("stafindBySatisfy.action",  function (data) {
            xtext = data[0];
            x = data[1];
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

            $('#container1').highcharts({
                chart: {
                    type: 'column'
                },
                exporting: {
                    filename: '不同满意度客户数量'
                },

                title: {
                    text: '不同满意度客户数量'
                },
                xAxis: {
                    categories:xtext,
                    crosshair: true
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: '满意度'
                    }
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
                    headerFormat: '<span style="font-size:10px">满意度：{point.key}</span></br><table>',
                    pointFormat: '<tr style="color:{series.color}">{series.name}: ' +
                    ' <b>{point.y:.1f}</b></br></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    useHTML: true
                },
                series: eval("["+x+"]")
            });
        });
    });
</script>

<!--按信誉度查询-->
<script>
    var xtext=[];
    var x=[];
    $(function () {
//        $("#layui-btn-selete").click(function () {
//            alert("welcome");
//            var a = $("#selectfindByCredit").find("option:selected").text();
        $.get("stafindByCredit.action",function (data) {
            xtext = data[0];
            x = data[1];
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

            $('#container2').highcharts({
                chart: {
                    type: 'column'
                },
                exporting: {
                    filename: '不同信誉度的客户数量'
                },

                title: {
                    text: '不同信誉度的客户数量'
                },
                xAxis: {
                    type: 'category',
                    categories:xtext,
                    text:'等级'
//                        crosshair: true
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: '信誉度'
                    }
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
                    headerFormat: '<span style="font-size:10px">信誉度：{point.key}</span></br><table>',
                    pointFormat: '<tr style="color:{series.color}">{series.name}: ' +
                    ' <b>{point.y:.1f}</b></br></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    useHTML: true
                },
                series: eval("["+x+"]")
            });
        });


    });



</script>


</body>
</html>