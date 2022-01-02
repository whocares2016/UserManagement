<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>
 <%@ include file="head.jsp" %>

<script src="js/datepicker/WdatePicker.js"></script>

<div style="padding: 10px" class="admin-content">
    <%
    String orderby = util.Request.get("order", "id"); // 获取搜索框中的排序字段、默认为发布时间
    String sort = util.Request.get("sort", "desc"); // 获取搜索框中的排序类型、默认为倒序
    
    String where = " 1=1 "; // 防止sql 搜索条件为： where and a=b 这样的错误
    where += " AND gonghao='" + request.getSession().getAttribute("username") + "' "; //  设置gonghao为当前登录用户
    
    // 以下是检测搜索框中是否填写了或者选择了什么，则写入sql 语句中
    
    if (request.getParameter("gonghao") != null && !"".equals(request.getParameter("gonghao"))) {
        where += " AND gonghao LIKE '%" + request.getParameter("gonghao") + "%'";
    }
    
    if (request.getParameter("xingming") != null && !"".equals(request.getParameter("xingming"))) {
        where += " AND xingming LIKE '%" + request.getParameter("xingming") + "%'";
    }
    
    if (request.getParameter("bumen") != null && !"".equals(request.getParameter("bumen"))) {
        where += " AND bumen ='" + request.getParameter("bumen") + "'";
    }
    
    if (request.getParameter("zhiwei") != null && !"".equals(request.getParameter("zhiwei"))) {
        where += " AND zhiwei ='" + request.getParameter("zhiwei") + "'";
    }
    
    if (request.getParameter("gonghao") != null && !"".equals(request.getParameter("gonghao"))) {
        where += " AND gonghao LIKE '%" + request.getParameter("gonghao") + "%'";
    }
    if (request.getParameter("xingming") != null && !"".equals(request.getParameter("xingming"))) {
        where += " AND xingming LIKE '%" + request.getParameter("xingming") + "%'";
    }
    if (request.getParameter("bumen") != null && !"".equals(request.getParameter("bumen"))) {
        where += " AND bumen ='" + request.getParameter("bumen") + "'";
    }
    if (request.getParameter("zhiwei") != null && !"".equals(request.getParameter("zhiwei"))) {
        where += " AND zhiwei ='" + request.getParameter("zhiwei") + "'";
    }
    if (request.getParameter("gongzuoriqi_start") != null && !"".equals(request.getParameter("gongzuoriqi_start"))) {
        where += " AND gongzuoriqi >='" + request.getParameter("gongzuoriqi_start") + "' ";
    }
    if (request.getParameter("gongzuoriqi_end") != null && !"".equals(request.getParameter("gongzuoriqi_end"))) {
        where += " AND gongzuoriqi <='" + request.getParameter("gongzuoriqi_end") + "' ";
    }
    List<Map> list = Query.make("gongzuoshijian").where(where).order(orderby + " " + sort).page(15);
    %>


    <div class="panel panel-default">
        <div class="panel-heading">
            <span class="module-name"> 工作时间 </span>
            <span>列表</span>
        </div>
        <div class="panel-body">
            <div class="pa10 bg-warning">
                <form class="form-inline" id="formSearch" action="?">
                    <!-- form 标签开始 -->

                    <div class="form-group">
                        <i class="glyphicon glyphicon-search"></i>
                    </div>


                    <div class="form-group">
                        工作日期

                        <input type="text" class="form-control" name="gongzuoriqi_start" readonly="readonly" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',lang:'zh-cn'})" />-<input
                            type="text"
                            class="form-control"
                            name="gongzuoriqi_end"
                            readonly="readonly"
                            onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',lang:'zh-cn'})"
                        />
                    </div>

                    <button type="submit" class="btn btn-default">搜索</button>

                    <!--form标签结束-->
                </form>
            </div>

            <div class="list-table">
                <table width="100%" border="1" class="table table-list table-bordered table-hover">
                    <thead>
                        <tr align="center">
                            <th width="60" data-field="item">序号</th>
                            <th>工号</th>
                            <th>姓名</th>
                            <th>部门</th>
                            <th>职位</th>
                            <th>工作日期</th>
                            <th>开始时段</th>
                            <th>结束时段</th>
                            <th>工作备注</th>
                            <th>添加人</th>
                            <th width="120" data-field="handler">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        int i = 0;
                        for (Map map : list) {
                            i++;
                        %>

                        <tr id="<%= map.get("id") %>" pid="">
                            <td width="30" align="center">
                                <label> <%= i %> </label>
                            </td>
                            <td><%= map.get("gonghao") %></td>
                            <td><%= map.get("xingming") %></td>
                            <td><% Map mapbumen9 = new CommDAO().find("SELECT bumenmingcheng FROM bumen where id='" + map.get("bumen") + "'"); %>
<%= mapbumen9.get("bumenmingcheng") %></td>
                            <td><% Map mapzhiwei10 = new CommDAO().find("SELECT zhiweimingcheng FROM zhiwei where id='" + map.get("zhiwei") + "'"); %>
<%= mapzhiwei10.get("zhiweimingcheng") %></td>
                            <td><%= map.get("gongzuoriqi") %></td>
                            <td><%= map.get("kaishishiduan") %></td>
                            <td><%= map.get("jieshushiduan") %></td>
                            <td><%= map.get("gongzuobeizhu") %></td>
                            <td><%= map.get("tianjiaren") %></td>
                            <td align="center">
                                <a href="gongzuoshijian_detail.jsp?id=<%= map.get("id") %>">详情</a>


                            </td>
                        </tr>
                        <%} %>

                    </tbody>
                </table>
            </div>

            ${page.info}
        </div>
    </div>
</div>
<%@ include file="foot.jsp" %>

