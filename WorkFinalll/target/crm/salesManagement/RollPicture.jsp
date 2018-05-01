<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/11
  Time: 0:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="https://code.highcharts.com/highcharts.js"></script>
</head>
<body>
<div id="container" style="width: 850px; height: 600px; margin: 0 auto"></div>
<script language="JavaScript">
    $(document).ready(function() {
        var chart = {
            type: 'column'
        };
        var title = {
            text: '业绩表'
        };
        var subtitle = {
//            text: 'Source: runoob.com'
        };
        var xAxis = {
            categories: ['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月'],
            crosshair: true
        };
        var yAxis = {
            min: 0,
            title: {
                text: '客户 (位)'
            }
        };
        var tooltip = {
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
            '<td style="padding:0"><b>{point.y} 位</b></td></tr>',
            footerFormat: '</table>',
            shared: true,
            useHTML: true
        };
        var plotOptions = {
            column: {
                pointPadding: 0.2,
                borderWidth: 0
            }
        };
        var credits = {
            enabled: false
        };

        var series= [{
            name: '张三',
            data: [1, 2, 6, 3, 1, 2, 2, 4, 3, 0, 1, 6]
        }, {
            name: '李四',
            data: [4, 1, 4, 2, 1, 1, 0, 1, 0, 3, 6, 1]
        }, {
            name: '王五',
            data: [1, 3, 2, 1, 2, 3, 1, 6, 4, 2, 1, 1]
        }, {
            name: '赵六',
            data: [3, 4, 2, 1, 1, 2, 1, 6, 2, 3, 5, 8]
        }];

        var json = {};
        json.chart = chart;
        json.title = title;
        json.subtitle = subtitle;
        json.tooltip = tooltip;
        json.xAxis = xAxis;
        json.yAxis = yAxis;
        json.series = series;
        json.plotOptions = plotOptions;
        json.credits = credits;
        $('#container').highcharts(json);

    });
</script>
</body>
</html>
