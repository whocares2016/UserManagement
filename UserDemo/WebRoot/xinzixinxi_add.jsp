<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>
 <%@ include file="head.jsp" %>

<script src="js/jquery.validate.js"></script>
<script src="js/datepicker/WdatePicker.js"></script>
<script>
    window.searchSelectUrl = "ajax.jsp?a=selectUpdate";
    window.selectUpdateUrl = "ajax.jsp?a=table";
</script>
<script src="js/selectUpdate.js"></script>

<div style="padding: 10px" class="admin-content">
    <% if (request.getSession().getAttribute("username") == null || "".equals(request.getSession().getAttribute("username"))) { %>

    <script>
        alert("对不起,请您先登陆!");
        location.href = "login.jsp";
    </script>
    <%return;
    } %>

    <div class="container">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="panel panel-default">
            <div class="panel-heading">添加薪资信息:</div>
            <div class="panel-body">
                <form action="xinzixinxi.jsp?a=insert" method="post" name="form1" id="form1">
                    <!-- form 标签开始 -->

                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">薪资编号</label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="输入薪资编号"
                                    style="width: 150px"
                                    readonly="readonly"
                                    id="xinzibianhao"
                                    name="xinzibianhao"
                                    value="<%= Info.getID() %>"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">月份<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    onfocus="WdatePicker({dateFmt:'yyyy-MM',lang:'zh-cn'})"
                                    style="width: 120px"
                                    data-rule-required="true"
                                    data-msg-required="请填写月份"
                                    id="yuefen"
                                    name="yuefen"
                                    readonly="readonly"
                                    value=""
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">员工</label>
                            <div class="col-sm-10">
                                <div class="form-inline">
                                    <select
                                        class="form-control"
                                        data-fields="gonghao,xingming,bumen,zhiwei"
                                        id="yuangong"
                                        name="yuangong"
                                        onchange="getAjaxData('yuangong',this,this.value)"
                                    >
                                        <option value="">请选择员工</option>
                                    </select>

                                    <select style="display: none" class="form-control class_bumen_search28" data-value="" id="bumen_search" name="bumen_search">
                                        <option value="">请选择</option>
                                        <% List<Map> select = new CommDAO().select("SELECT * FROM bumen ORDER BY id desc"); %>
 <% for (Map m : select) { %>

                                        <option value="<%= m.get("id") %>"><%= m.get("bumenmingcheng") %></option>
                                        <%} %>

                                    </select>
                                    <select style="display: none" class="form-control class_zhiwei_search29" data-value="" id="zhiwei_search" name="zhiwei_search">
                                        <option value="">请选择</option>
                                        <% select = new CommDAO().select("SELECT * FROM zhiwei ORDER BY id desc"); %>
 <% for (Map m : select) { %>

                                        <option value="<%= m.get("id") %>"><%= m.get("zhiweimingcheng") %></option>
                                        <%} %>

                                    </select>

                                    <script>
                                        function yuangong_select_update() {
                                            var keyword = $("#yuangong_keyword").val();
                                            var where = {};
                                            if ($("#bumen_search").val() != "") where.bumen = $("#bumen_search").val();
                                            if ($("#zhiwei_search").val() != "") where.zhiwei = $("#zhiwei_search").val();
                                            searchSelect("yuangong", "yuangong", keyword, where, "gonghao,xingming,bumen,zhiwei".split(","), "".split(","));
                                        }
                                        yuangong_select_update();
                                    </script>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">工号</label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control select-update"
                                    placeholder="输入工号"
                                    style="width: 150px"
                                    readonly="readonly"
                                    id="gonghao"
                                    name="gonghao"
                                    value="<%= request.getSession().getAttribute("username") !=null ? request.getSession().getAttribute("username") : "" %>"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">姓名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control select-update" placeholder="输入姓名" style="width: 150px" id="xingming" name="xingming" value="" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">部门</label>
                            <div class="col-sm-10">
                                <select class="form-control select-update" data-value="" id="bumen" name="bumen" style="width: 250px">
                                    <% select = new CommDAO().select("SELECT * FROM bumen ORDER BY id desc"); %>
 <% for (Map m : select) { %>

                                    <option value="<%= m.get("id") %>"><%= m.get("bumenmingcheng") %></option>
                                    <%} %>

                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">职位</label>
                            <div class="col-sm-10">
                                <select class="form-control select-update" data-value="" id="zhiwei" name="zhiwei" style="width: 250px">
                                    <% select = new CommDAO().select("SELECT * FROM zhiwei ORDER BY id desc"); %>
 <% for (Map m : select) { %>

                                    <option value="<%= m.get("id") %>"><%= m.get("zhiweimingcheng") %></option>
                                    <%} %>

                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">基本工资<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <input
                                    type="number"
                                    class="form-control"
                                    placeholder="输入基本工资"
                                    style="width: 150px"
                                    step="0.01"
                                    data-rule-required="true"
                                    data-msg-required="请填写基本工资"
                                    number="true"
                                    data-msg-number="输入一个有效数字"
                                    id="jibengongzi"
                                    name="jibengongzi"
                                    value=""
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">加班工资<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <input
                                    type="number"
                                    class="form-control"
                                    placeholder="输入加班工资"
                                    style="width: 150px"
                                    step="0.01"
                                    data-rule-required="true"
                                    data-msg-required="请填写加班工资"
                                    number="true"
                                    data-msg-number="输入一个有效数字"
                                    id="jiabangongzi"
                                    name="jiabangongzi"
                                    value=""
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">全勤奖<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <input
                                    type="number"
                                    class="form-control"
                                    placeholder="输入全勤奖"
                                    style="width: 150px"
                                    step="0.01"
                                    data-rule-required="true"
                                    data-msg-required="请填写全勤奖"
                                    number="true"
                                    data-msg-number="输入一个有效数字"
                                    id="quanqinjiang"
                                    name="quanqinjiang"
                                    value=""
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">优秀员工<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <input
                                    type="number"
                                    class="form-control"
                                    placeholder="输入优秀员工"
                                    style="width: 150px"
                                    step="0.01"
                                    data-rule-required="true"
                                    data-msg-required="请填写优秀员工"
                                    number="true"
                                    data-msg-number="输入一个有效数字"
                                    id="youxiuyuangong"
                                    name="youxiuyuangong"
                                    value=""
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">社保<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <input
                                    type="number"
                                    class="form-control"
                                    placeholder="输入社保"
                                    style="width: 150px"
                                    step="0.01"
                                    data-rule-required="true"
                                    data-msg-required="请填写社保"
                                    number="true"
                                    data-msg-number="输入一个有效数字"
                                    id="shebao"
                                    name="shebao"
                                    value=""
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">公积金<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <input
                                    type="number"
                                    class="form-control"
                                    placeholder="输入公积金"
                                    style="width: 150px"
                                    step="0.01"
                                    data-rule-required="true"
                                    data-msg-required="请填写公积金"
                                    number="true"
                                    data-msg-number="输入一个有效数字"
                                    id="gongjijin"
                                    name="gongjijin"
                                    value=""
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">个人所得税<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <input
                                    type="number"
                                    class="form-control"
                                    placeholder="输入个人所得税"
                                    style="width: 150px"
                                    step="0.01"
                                    data-rule-required="true"
                                    data-msg-required="请填写个人所得税"
                                    number="true"
                                    data-msg-number="输入一个有效数字"
                                    id="gerensuodeshui"
                                    name="gerensuodeshui"
                                    value=""
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs"> </label>
                            <div class="col-sm-10">
                                <button type="submit" class="btn btn-primary" name="Submit">提交</button>
                                <button type="reset" class="btn btn-default" name="Submit2">重置</button>
                            </div>
                        </div>
                    </div>

                    <!--form标签结束-->
                </form>
            </div>
        </div>

        <!-- container定宽，并剧中结束 -->
    </div>

    <script>
        $(function () {
            $("#form1").validate();
        });
    </script>
</div>
<%@ include file="foot.jsp" %>

