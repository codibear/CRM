<%--
  Created by IntelliJ IDEA.
  User: LiuWei
  Date: 2017/8/10
  Time: 18:15
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>新建客户</title>
    <script type="text/javascript" src="../plugins/layui/layui.js" ></script>
    <script type="text/javascript" src="../plugins/layui/lay/dest/layui.all.js" ></script>
    <link rel="stylesheet" href="../plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="../css/main.css" />
    <link rel="stylesheet" href="../customer/css/custInformation.css"/>
    <script src="../js/jquery-1.8.3.min.js"></script>
    <script src="../js/layer.js"></script>
    <script type="text/javascript" >


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
        $(function(){

            $("#custsave").click(function(){

                var mydate = new Date;
                var time = mydate.getFullYear()+"-"+(mydate.getMonth()+1)+"-"+mydate.getDate();
                var cusId=$("#cusId").val();
                var cusName=$("#cusName").val();
                var creatTime=$("#creatTime").val(time);
                var addr=$("#addr").val();
                var zip=$("#zip").val();
                var phone=$("#phone").val();
                var fax=$("#fax").val();
                var website=$("#website").val();
                var chieftain=$("#chieftain").val();
                var bank=$("#bank").val();
                var bankAccount=$("#bankAccount").val();

                var faxx=/^(\d{3,4}-)?\d{7,8}$/;

                var ph=/^1[3|4|5|7|8][0-9]{9}$/;

                var  zipp=/^[\S]{6}$/;

                if (cusId.length !=0 && cusName.length !=0 && creatTime.length !=0 && addr.length !=0 && zipp.test(zip)&& ph.test(phone)/*&& faxx.test(fax)*/ && website.length !=0 && chieftain.length !=0 && bank.length !=0 && bankAccount.length !=0){
                    $.get("${pageContext.request.contextPath}/customer/customersave.action",$("#myform").serialize(),function(data){
                        layer.confirm('保存成功', {
                                    icon:6,
                                    btn: ['确定'] //按钮
                                }, function(){
                                    window.location.href=getRootPath_web()+"/salesManagement/CustDist.jsp";
                                }
                        );
                    });
                }

            });

            //客户等级显示
            $.get("${pageContext.request.contextPath}/customer/customerfindEntry.action",function (data) {
                var type = $("#type") ;
                var tr="";
                $(data).each(function(i,obj){
                    var td = "<option value='"+ obj.entry +"'>" + obj.entry + "</option>"
                    tr = tr + td  ;
                });
                $(type).append(tr) ;
                render();
            }) ;
            //客户经理显示
            $.get("${pageContext.request.contextPath}/customer/customerfindUser.action",function (data) {
                var username = $("#userName") ;
                var tr="";
                $(data).each(function(i,obj){
                    var td = "<option value='"+ obj.userId+"'>" + obj.userName + "</option>"
                    tr = tr + td  ;
                });
                $(username).append(tr) ;
                render();
            }) ;
        });


//编号不能重复
function findId() {
    var cusid = $("#cusId").val();
    if(cusid!=""){
        $.get("/CRM/customer/customerfindcusId.action",{cusId:cusid},function (data) {
            if(data == 1 ){
                layer.confirm('该编号已存在', {
                    icon:5,
                    btn: ['确定']
                });
                $("#cusId").val("");
            }

        });
    }
}

layui.use('form', function(){
    var form = layui.form();
    form.verify({
        username: function(value){
            if(!new RegExp("^[a-zA-Z_\u4e00-\u9fa5\\s·]+$").test(value)){
                return '用户名不能有特殊字符';
            }
            if(/(^\_)|(\__)|(\_+$)/.test(value)){
                return '用户名首尾不能出现下划线\'_\'';
            }
            if(/^\d+\d+\d$/.test(value)){
                return '用户名不能全为数字';
            }
        }, codeZip: [
        /^[\S]{6}$/
        ,'邮政编码必须6为位，且不能出现空格!'
    ],
        fax: [
             /^(\d{3,4}-)?\d{7,8}$/,
             '请输入正确传真'
         ],
        phone: [
            /^1[3|4|5|7|8][0-9]{9}$/,
            '请输入正确手机号'
        ],
        bankroll: [
            /^[\S]{0,10}$/,
            '请输入正确注册资金(10位以内)'
        ],
        cusTurnover: [
            /^[\S]{0,10}$/,
            '请输入正确年营业额(10位以内)'
        ],

    });
    //监听提交
});

    </script>
</head>
<body>
<div id="main">
    <%--路径--%>
    <div id="nav">
        <span class="title1">
		  <a href="">客户信息管理 ></a>
		  <a href="">客户信息 ></a>
		</span>
    </div>
    <form class="layui-form" action="${pageContext.request.contextPath}/customer/customersave.action" id="myform">
        <%--//选择按钮--%>
        <div class="layui-btn-group globalHight">
            <%--<button class="layui-btn">帮助</button>--%>
            <%--<a href="custManage.jsp"><button type="button" class="layui-btn">返回</button></a>--%>
            <button type="button" class="layui-btn" lay-submit  lay-filter="formDemo"  id="custsave">保存</button>
        </div>
        <%--表格--%>

        <div>
            <%--表一+++++++++++++--%>
            <table class="layui-table">
                <colgroup>
                    <col class="tit">
                    <col class="content">
                    <col class="tit">
                    <col class="content">
                </colgroup>
                <tr>
                    <th>客户编号</th>
                    <th>
                        <input type="text" name="customer.cusId" id="cusId" placeholder="请输入编号" required  lay-verify="required" onblur="findId()"/>
                    </th>
                    <th>名称</th>
                    <th>
                        <input type="text" name="customer.cusName" id="cusName" placeholder="请输入公司名称" required  lay-verify="required"/>
                        <span>*</span>
                    </th>
                </tr>
                <tr>
                    <td>地区</td>
                    <td>
                        <select  style="display: block" name="customer.cusRegion" >
                            <option></option>
                            <option value="北京">北京</option>
                            <option value="上海">上海</option>
                            <option value="杭州">杭州</option>
                        </select>
                    </td>
                    <td>客户经理</td>
                    <td>
                        <div>
                            <select id="userName" style="display: block" name="customer.cusManagerId">
                                <option></option>
                            </select>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>客户等级</td>
                    <td class="layui-input-block">
                        <select id="type" style="display: block" name="customer.cusLevel" lay-verify="required" lay-search="">
                            <option></option>
                        </select>
                    </td>
                    <td>创建时间</td>
                    <td class="layui-input-block" >
                        <div class="layui-inline">
                            <input class="layui-input" name="customer.cusCreatTime" id="creatTime" placeholder="自动生成" required  lay-verify="required" readonly>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>客户满意度</td>
                    <td>
                        <select style="display: block" name="customer.cusSatisfy">
                            <option value="1">☆</option>
                            <option value="2">☆☆</option>
                            <option value="3" selected="">☆☆☆</option>
                            <option value="4">☆☆☆☆</option>
                            <option value="5">☆☆☆☆☆</option>
                        </select>
                    </td>
                    <td>客户信用度</td>
                    <td>
                        <select style="display: block" name="customer.cusCredit">
                            <option value="1">☆</option>
                            <option value="2">☆☆</option>
                            <option value="3" selected="">☆☆☆</option>
                            <option value="4">☆☆☆☆</option>
                            <option value="5">☆☆☆☆☆</option>
                        </select>
                    </td>
                </tr>
            </table>
            <%--表二=================--%>
            <table class="layui-table">
                <colgroup>
                    <col class="tit">
                    <col class="content">
                    <col class="tit">
                    <col class="content">
                </colgroup>
                <tr>
                    <td>地址</td>
                    <td>
                        <input type="text" placeholder="请输入地址"  name="customer.cusAddr" id="addr"  required lay-verify="required">
                        <span>*</span>
                    </td>
                    <td>邮政编码</td>
                    <td>
                        <input type="text" placeholder="请输入邮政编码" name="customer.cusZip" id="zip" required lay-verify="codeZip">
                        <span>*</span>
                    </td>
                </tr>
                <tr>
                    <td>电话</td>
                    <td>
                        <input type="text" placeholder="请输入手机号" name="customer.cusTel" id="phone" required lay-verify="phone">
                        <span>*</span>
                    </td>
                    <td>传真</td>
                    <td>
                        <input type="text" placeholder="请输入传真 如：****-****" name="customer.cusFax" id="fax" required lay-verify="fax">
                        <span>*</span>
                    </td>
                </tr>
                <tr>
                    <td>网址</td>
                    <td  colspan="3">
                        <input type="text" name="customer.cusWebsite" id="website" required lay-verify="required|url" placeholder="请输入网址 如：http：//www.baidu.com">
                        <span>*</span>
                    </td>
                </tr>
            </table>
            <%--表三=================--%>
            <table class="layui-table">
                <colgroup>
                    <col class="tit">
                    <col class="content">
                    <col class="tit">
                    <col class="content">
                </colgroup>
                <tr>
                    <td>营业执照注册号</td>
                    <td>
                        <input type="text" name="customer.licenceNo">
                    </td>
                    <td>法人</td>
                    <td>
                        <input type="text"  id="chieftain" name="customer.chieftain" required lay-verify="required">
                        <span>*</span>
                    </td>
                </tr>
                <tr>
                    <td>注册资金（万元）</td>
                    <td>
                        <input type="text" name="customer.bankroll"  lay-verify="bankroll">
                    </td>
                    <td>年营业额</td>
                    <td>
                        <input type="text" name="customer.cusTurnover" lay-verify="cusTurnover">
                    </td>
                </tr>
                <tr>
                    <td>开户银行</td>
                    <td>
                        <input type="text" name="customer.bank" id="bank" placeholder="开户银行" required lay-verify="required">
                        <span>*</span>
                    </td>
                    <td>银行账号</td>
                    <td>
                        <input type="text" name="customer.bankAccount" id="bankAccount" placeholder="银行账号" required lay-verify="required">
                        <span>*</span>
                    </td>
                </tr>
                <tr>
                    <td>地税登记号</td>
                    <td>
                        <input type="text" name="customer.localTaxNo"  lay-verify="localTaxNo" >
                    </td>
                    <td>国税登记号</td>
                    <td>
                        <input type="text" name="customer.nationalTaxNo" required lay-verify="nationalTaxNo">
                    </td>
                </tr>
            </table>
        </div>
    </form>
</div>
</body>
</html>
