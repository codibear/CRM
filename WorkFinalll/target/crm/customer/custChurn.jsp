<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/27
  Time: 12:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>客户流失管理</title>
	<link rel="stylesheet" href="../plugins/layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="../css/main.css" />
	<link rel="stylesheet" href="../customer/css/custChu.css" />
	<link rel="stylesheet" href="../plugins/layui/css/modules/layer/default/layer.css">
	<script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript"  src="../plugins/layui/layui.js" ></script>
	<script type="text/javascript" src="../js/layer.js"></script>

	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<script type="text/javascript">

  	   //将秒数转化为日期格式
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
       
	   

	   $(function () {
		   $("#query").click(function () {
			   var check1 = false;
			   var check2 = false;
			   var check3 = false;
			   var cusName=trim($("#custName").val());

//			   alert(cusName);
			   var cusManName=trim($("#cusManName").val());

//			   alert(cusManName);
			   var lstStatus=trim($("#lstStatus").val());

//			   alert(lstStatus);
			   if(cusName!=""){
				   check1 = true;
			   }
			   if(cusManName!=""){
				   check2 = true;
			   }
			   if(lstStatus!=""){
				   check3 = true;
			   }
			   if((check1||check2||check3)==true) {
			   }else {
				   layer.msg('不能都为空呦', {
					   msg: [1, '#3595CC'],
					   area: ['200px', '48px'], //宽高
					   time: 1000
				   })
				  khjkh;
			   }
			   $.get("${pageContext.request.contextPath}/customer/cstLostfind.action",
					   {lstCustName:cusName,lstCustManagerName:cusManName,lstStatus:lstStatus},function (data) {

						   var tbody=$("#body");
						   tbody.html("");
						   ch(data);

			   })

		   })

	   })

	   function trim(s){
		   return s.replace(/(^\s*)|(\s*$)/g, "");
	   }

	  function   ch(data) {
			var tbody=$("#body");
			var tr="<tr>"

			$(data).each(function (i,obj) {

				var operation=""
				//上次下单时间
//				var lastOrderDate=json2TimeStamp(obj.lstLastOrderDate);
				//客户流失时间
//				var lstLostDate=json2TimeStamp(obj.lstLostDate);

				if(obj.lstStatus=="确认流失"){
					operation="<a  href='<%=request.getContextPath()%>/customer/cstLostfindById.action?lstId="+obj.lstId+"'>"+"<i class='layui-icon' >&#xe620;</i>"+"</a>"+"&nbsp;&nbsp;&nbsp;&nbsp;"
							+"<i class='layui-icon'>"+ "&#xe628;"+"</i>";

				}else {
					operation="<a  href='<%=request.getContextPath()%>/customer/cstLostfindById.action?lstId="+obj.lstId+"'"+"<i class='layui-icon'>&#xe620;</i>"+"</a>" +
							"&nbsp;&nbsp;&nbsp;&nbsp;"+"<a href='<%=request.getContextPath()%>/customer/cstLostconfirmLoss.action?lstId="+obj.lstId+"'>" +
							"<i class='layui-icon'>"+ "&#xe628;"+"</i></a>";
				}

				var td="<td>"+obj.lstId+"</td>"+
						"<td>"+obj.lstCustName+"</td>"+
						"<td>"+obj.lstCustManagerName+"</td>"+
						"<td>"+obj.lstLastOrderDate+"</td>"+
						"<td>"+obj.lstLostDate+"</td>"+
						"<td>"+obj.lstStatus+"</td>"+
						"<td>"+operation+"</td>";
						<%--"<td>"+"<a  href='<%=request.getContextPath()%>/customer/cstLostfindById.action?lstId="+obj.lstId+"'"+"<i class='layui-icon'>&#xe620;</i>"+"</a>" +--%>
						<%--"&nbsp;&nbsp;&nbsp;&nbsp;"+"<a href='<%=request.getContextPath()%>/customer/cstLostconfirmLoss.action?lstId="+obj.lstId+"'>" +--%>
						<%--"<i class='layui-icon'>"+ "&#xe628;"+"</i></a>"+"</td>";--%>
				tr=tr+td+"</tr>";
			});
			$(tbody).append(tr) ;
		}

		//分页公用方法

		function getCurrentPage(curr) {
			$.get("${pageContext.request.contextPath}/customer/cstLostpageList.action",{currentPage:curr},function (data) {
//				alert(data.data);
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
							if (!first) {//点击跳页触发函数自身，并传递当前页：obj.current
								$("#body").html("");
								getCurrentPage(obj.curr);

							}
						}
					});
				});
			});
		}

		$(function () {
			layui.use('layer', function(){
				var layer = layui.layer;
				var index = layer.load(1, {
					shade: [0.1,'#fff'] ,
					time: 500//0.1透明度的白色背景
				});
			});

			getCurrentPage(1);

		});

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
			   content: '<div style="padding: 20px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><img src="../images/help_custChurn.png" ></div>'
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
    function back() {
		window.location.href="../customer/custChurn.jsp";
	}

	   //导出Excel表格方法
	   function exportExcel() {
		   $.get("cstLostexportExcel.action",function (data) {
			   alert("导出成功");
		   })
	   }

	</script>
</head>

<body>
	<div id="main">
		<h1 ><a href="custChurn.jsp" id="title1"> 客户流失管理</a></h1>
		<div class="layui-btn-group globalHight">
			<a data-method="notice" class="layui-btn" type="button"  onclick="help()">帮助</a>
			<a data-method="notice" class="layui-btn" type="button" href="cstLostexportExcel.action">导出</a>
			<a class="layui-btn" onclick="back()">返回</a>
			<a class="layui-btn" id="query" >查询</a>
		</div>

		<div>
			<table class="layui-table">
				<tr>
					<td>客户</td>
					<td>
						<input type="text" name="lstCustName" id="custName" lay-verify="lstCustName" autocomplete="off" class="layui-input" placeholder="请输入查询条件">
					</td>
					<td>客户经理</td>
					<td>
						<input type="text" name="lstCustManagerName" id="cusManName" autocomplete="off" class="layui-inline" placeholder="请输入查询条件"/>
					</td>
					<td>状态</td>
					<td>
						<select name="lstStatus" id="lstStatus">
							<option>暂缓流失</option>
							<option>确认流失</option>
						</select>

						<%--<input name="lstStatus" id="lstStatus" type="text" placeholder="请输入查询条件"/>--%>

					</td>
				</tr>
			</table>
			<br/>
			<table class="layui-table" id="t">
				<tr id="content">
					<td>编号</td>
					<td>客户</td>
					<td>客户经理</td>
					<td>上次下单时间</td>
					<td>确认流失时间</td>
					<td>状态</td>
					<td>操作</td>
				</tr>
				<tbody id="body"></tbody>

			</table>
			<div id="demo7"></div>
		</div>

	</div>





</body>
</html>
