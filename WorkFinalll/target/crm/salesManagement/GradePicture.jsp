<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/10
  Time: 23:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="https://code.highcharts.com/highcharts.js"></script>
</head>

<div id="container" style="width: 650px; height: 500px; margin: 0 auto"></div>
<script language="JavaScript">
    $(document).ready(function() {
        var title = {
            text: '业绩表'
        };
        var subtitle = {
            text: 'Source: runoob.com'
        };
        var xAxis = {
            categories: ['一月', '二月', '三月', '四月', '五月', '六月',
                '七月', '八月', '九月', '十月', '十一月', '十二月']
        };
        var yAxis = {
            title: {
                text: '开发客户数 (位)'
            },
            plotLines: [{
                value: 0,
                width: 2,
                color: '#808080'
            }]
        };

        var tooltip = {
            valueSuffix: '位'
        }

        var legend = {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        };

        var series =  [
            {
                name: '张三',
                data: [1, 2, 2, 4, 3, 0, 1,
                    3, 1, 6, 3, 1]
            },
            {
                name: '李四',
                data: [2, 1, 4, 2, 1, 1, 0,
                    1, 0, 3, 6, 1]
            },
            {
                name: '王五',
                data: [1, 3, 2, 1, 2, 3, 1,
                    6, 4, 2, 1, 1]
            },
            {
                name: '赵六',
                data: [3, 4, 2, 1, 1, 2, 1,
                    6, 2, 3, 5, 8]
            }

        ];

        var json = {};

        json.title = title;
        json.subtitle = subtitle;
        json.xAxis = xAxis;
        json.yAxis = yAxis;
        json.tooltip = tooltip;
        json.legend = legend;
        json.series = series;

        $('#container').highcharts(json);
    });
</script>
</head>
<body>

</body>
</html>
