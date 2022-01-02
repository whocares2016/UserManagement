<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>
 <%@ include file="head.jsp" %>

<script src="js/jquery.validate.js"></script>
<script>
    window.searchSelectUrl = "ajax.jsp?a=selectUpdate";
    window.selectUpdateUrl = "ajax.jsp?a=table";
</script>
<script src="js/selectUpdate.js"></script>
<script src="js/datepicker/WdatePicker.js"></script>

<div style="padding: 10px" class="admin-content">
    <% if (request.getSession().getAttribute("username") == null || "".equals(request.getSession().getAttribute("username"))) { %>

    <script>
        alert("对不起,请您先登陆!");
        location.href = "login.jsp";
    </script>
    <%return;
    } %> <%
     String updtself = "0"; // 设置更新
     HashMap mmm = new CommDAO().getmap(request.getParameter("id"), "gongzuoshijian");
     %>


    <div class="container">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="panel panel-default">
            <div class="panel-heading">编辑工作时间:</div>
            <div class="panel-body">
                <form action="gongzuoshijian.jsp?a=update" method="post" name="form1" id="form1">
                    <!-- form 标签开始 -->

                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">员工</label>
                            <div class="col-sm-10">
                                <div class="form-inline">
                                    <select
                                        class="form-control"
                                        data-fields="gonghao,xingming,bumen,zhiwei"
                                        data-value="<%= Info.html(mmm.get("yuangong")) %>"
                                        id="yuangong"
                                        name="yuangong"
                                        onchange="getAjaxData('yuangong',this,this.value)"
                                    >
                                        <option value="">请选择员工</option>
                                    </select>

                                    <select style="display: none" class="form-control class_bumen_search20" data-value="" id="bumen_search" name="bumen_search">
                                        <option value="">请选择</option>
                                        <% List<Map> select = new CommDAO().select("SELECT * FROM bumen ORDER BY id desc"); %>
 <% for (Map m : select) { %>

                                        <option value="<%= m.get("id") %>"><%= m.get("bumenmingcheng") %></option>
                                        <%} %>

                                    </select>
                                    <select style="display: none" class="form-control class_zhiwei_search21" data-value="" id="zhiwei_search" name="zhiwei_search">
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
                                    value="<%= mmm.get("gonghao") %>"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">姓名</label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control select-update"
                                    placeholder="输入姓名"
                                    style="width: 150px"
                                    id="xingming"
                                    name="xingming"
                                    value="<%= Info.html(mmm.get("xingming")) %>"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">部门</label>
                            <div class="col-sm-10">
                                <select class="form-control select-update" data-value="<%= Info.html(mmm.get("bumen")) %>" id="bumen" name="bumen" style="width: 250px">
                                    <% select = new CommDAO().select("SELECT * FROM bumen ORDER BY id desc"); %>
 <% for (Map m : select) { %>

                                    <option value="<%= m.get("id") %>"><%= m.get("bumenmingcheng") %></option>
                                    <%} %>

                                </select>
                                <script>
                                    $(".class_bumen22 select-update").val($(".class_bumen22 select-update").attr("data-value"));
                                </script>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">职位</label>
                            <div class="col-sm-10">
                                <select class="form-control select-update" data-value="<%= Info.html(mmm.get("zhiwei")) %>" id="zhiwei" name="zhiwei" style="width: 250px">
                                    <% select = new CommDAO().select("SELECT * FROM zhiwei ORDER BY id desc"); %>
 <% for (Map m : select) { %>

                                    <option value="<%= m.get("id") %>"><%= m.get("zhiweimingcheng") %></option>
                                    <%} %>

                                </select>
                                <script>
                                    $(".class_zhiwei23 select-update").val($(".class_zhiwei23 select-update").attr("data-value"));
                                </script>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">工作日期<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',lang:'zh-cn'})"
                                    style="width: 120px"
                                    data-rule-required="true"
                                    data-msg-required="请填写工作日期"
                                    id="gongzuoriqi"
                                    name="gongzuoriqi"
                                    readonly="readonly"
                                    value="<%= Info.html(mmm.get("gongzuoriqi")) %>"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">开始时段<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    onfocus="WdatePicker({dateFmt:'HH:mm',lang:'zh-cn'})"
                                    style="width: 120px"
                                    data-rule-required="true"
                                    data-msg-required="请填写开始时段"
                                    id="kaishishiduan"
                                    name="kaishishiduan"
                                    readonly="readonly"
                                    value="<%= Info.html(mmm.get("kaishishiduan")) %>"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">结束时段<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    onfocus="WdatePicker({dateFmt:'HH:mm',lang:'zh-cn'})"
                                    style="width: 120px"
                                    data-rule-required="true"
                                    data-msg-required="请填写结束时段"
                                    id="jieshushiduan"
                                    name="jieshushiduan"
                                    readonly="readonly"
                                    value="<%= Info.html(mmm.get("jieshushiduan")) %>"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">工作备注</label>
                            <div class="col-sm-10">
                                <textarea style="width: 80%; height: 120px" class="form-control" placeholder="输入工作备注" id="gongzuobeizhu" name="gongzuobeizhu">
<%= Info.html(mmm.get("gongzuobeizhu")) %></textarea
                                >
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">添加人</label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="输入添加人"
                                    style="width: 150px"
                                    readonly="readonly"
                                    id="tianjiaren"
                                    name="tianjiaren"
                                    value="<%= mmm.get("tianjiaren") %>"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs"> </label>
                            <div class="col-sm-10">
                                <input name="id" value="<%= mmm.get("id") %>" type="hidden" />
                                <input name="referer" value="<%=request.getHeader("referer") %>" type="hidden" />
                                <input name="updtself" value="<%= updtself %>" type="hidden" />

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

