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
    
    if (request.getParameter("xinzibianhao") != null && !"".equals(request.getParameter("xinzibianhao"))) {
        where += " AND xinzibianhao LIKE '%" + request.getParameter("xinzibianhao") + "%'";
    }
    if (request.getParameter("yuefen_start") != null && !"".equals(request.getParameter("yuefen_start"))) {
        where += " AND yuefen >='" + request.getParameter("yuefen_start") + "' ";
    }
    if (request.getParameter("yuefen_end") != null && !"".equals(request.getParameter("yuefen_end"))) {
        where += " AND yuefen <='" + request.getParameter("yuefen_end") + "' ";
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
    
    List<Map> list = Query.make("xinzixinxi").where(where).order(orderby + " " + sort).page(15);
    
    Map total = Query
        .make("xinzixinxi")
        .field(
            "(sum(shifaxinzi)) sum_shifaxinzi,(avg(shifaxinzi)) avg_shifaxinzi,(min(shifaxinzi)) min_shifaxinzi,(max(shifaxinzi)) max_shifaxinzi"
        )
        .where(where)
        .field(
            "(sum(shifaxinzi)) sum_shifaxinzi,(avg(shifaxinzi)) avg_shifaxinzi,(min(shifaxinzi)) min_shifaxinzi,(max(shifaxinzi)) max_shifaxinzi"
        )
        .find();
    %>


    <div class="panel panel-default">
        <div class="panel-heading">
            <span class="module-name"> 薪资信息 </span>
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
                        薪资编号

                        <input type="text" class="form-control" style="" name="xinzibianhao" value="<%= request.getParameter("xinzibianhao") !=null ? request.getParameter("xinzibianhao") : "" %>" />
                    </div>
                    <div class="form-group">
                        月份

                        <input type="text" class="form-control" name="yuefen_start" readonly="readonly" onfocus="WdatePicker({dateFmt:'yyyy-MM',lang:'zh-cn'})" />-<input
                            type="text"
                            class="form-control"
                            name="yuefen_end"
                            readonly="readonly"
                            onfocus="WdatePicker({dateFmt:'yyyy-MM',lang:'zh-cn'})"
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
                            <th>薪资编号</th>
                            <th>月份</th>
                            <th>工号</th>
                            <th>姓名</th>
                            <th>部门</th>
                            <th>职位</th>
                            <th>基本工资</th>
                            <th>加班工资</th>
                            <th>全勤奖</th>
                            <th>优秀员工</th>
                            <th>社保</th>
                            <th>公积金</th>
                            <th>个人所得税</th>
                            <th>应发薪资</th>
                            <th>实发薪资</th>
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
                            <td><%= map.get("xinzibianhao") %></td>
                            <td><%= map.get("yuefen") %></td>
                            <td><%= map.get("gonghao") %></td>
                            <td><%= map.get("xingming") %></td>
                            <td><% Map mapbumen17 = new CommDAO().find("SELECT bumenmingcheng FROM bumen where id='" + map.get("bumen") + "'"); %>
<%= mapbumen17.get("bumenmingcheng") %></td>
                            <td><% Map mapzhiwei18 = new CommDAO().find("SELECT zhiweimingcheng FROM zhiwei where id='" + map.get("zhiwei") + "'"); %>
<%= mapzhiwei18.get("zhiweimingcheng") %></td>
                            <td><%= map.get("jibengongzi") %></td>
                            <td><%= map.get("jiabangongzi") %></td>
                            <td><%= map.get("quanqinjiang") %></td>
                            <td><%= map.get("youxiuyuangong") %></td>
                            <td><%= map.get("shebao") %></td>
                            <td><%= map.get("gongjijin") %></td>
                            <td><%= map.get("gerensuodeshui") %></td>
                            <td><%= map.get("yingfaxinzi") %></td>
                            <td><%= map.get("shifaxinzi") %></td>
                            <td align="center">
                                <a href="xinzixinxi_detail.jsp?id=<%= map.get("id") %>">详情</a>


                            </td>
                        </tr>
                        <%} %>

                    </tbody>
                </table>
            </div>

            ${page.info}
            <p>实发薪资总和: <%= total.get("sum_shifaxinzi") %> 　　 实发薪资平均值: <%= total.get("avg_shifaxinzi") %> 　　 实发薪资最小值: <%= total.get("min_shifaxinzi") %> 　　 实发薪资最大值: <%= total.get("max_shifaxinzi") %> 　　</p>
        </div>
    </div>
</div>
<%@ include file="foot.jsp" %>

