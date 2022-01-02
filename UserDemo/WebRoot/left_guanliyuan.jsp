<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>


<li>
    <a href="javascript:;">
        <i class="iconfont left-nav-li" lay-tips="账号管理">&#xe6a7;</i>
        <cite>账号管理</cite>
        <i class="iconfont nav_right">&#xe697;</i>
    </a>
    <ul class="sub-menu">
        <li>
            <a onclick="xadmin.add_tab('管理员账号管理','admins_list.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>管理员账号管理</cite>
            </a>
        </li>
        <li>
            <a onclick="xadmin.add_tab('管理员账号添加','admins_add.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>管理员账号添加</cite>
            </a>
        </li>
        <li>
            <a onclick="xadmin.add_tab('密码修改','mod.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>密码修改</cite>
            </a>
        </li>
    </ul>
</li>
<li>
    <a href="javascript:;">
        <i class="iconfont left-nav-li" lay-tips="部门管理">&#xe6a7;</i>
        <cite>部门管理</cite>
        <i class="iconfont nav_right">&#xe697;</i>
    </a>
    <ul class="sub-menu">
        <li>
            <a onclick="xadmin.add_tab('部门添加','bumen_add.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>部门添加</cite>
            </a>
        </li>
        <li>
            <a onclick="xadmin.add_tab('部门查询','bumen_list.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>部门查询</cite>
            </a>
        </li>
    </ul>
</li>
<li>
    <a href="javascript:;">
        <i class="iconfont left-nav-li" lay-tips="职位管理">&#xe6a7;</i>
        <cite>职位管理</cite>
        <i class="iconfont nav_right">&#xe697;</i>
    </a>
    <ul class="sub-menu">
        <li>
            <a onclick="xadmin.add_tab('职位添加','zhiwei_add.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>职位添加</cite>
            </a>
        </li>
        <li>
            <a onclick="xadmin.add_tab('职位查询','zhiwei_list.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>职位查询</cite>
            </a>
        </li>
    </ul>
</li>
<li>
    <a href="javascript:;">
        <i class="iconfont left-nav-li" lay-tips="员工管理">&#xe6a7;</i>
        <cite>员工管理</cite>
        <i class="iconfont nav_right">&#xe697;</i>
    </a>
    <ul class="sub-menu">
        <li>
            <a onclick="xadmin.add_tab('员工添加','yuangong_add.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>员工添加</cite>
            </a>
        </li>
        <li>
            <a onclick="xadmin.add_tab('员工查询','yuangong_list.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>员工查询</cite>
            </a>
        </li>
    </ul>
</li>
<li>
    <a href="javascript:;">
        <i class="iconfont left-nav-li" lay-tips="工作时间管理">&#xe6a7;</i>
        <cite>工作时间管理</cite>
        <i class="iconfont nav_right">&#xe697;</i>
    </a>
    <ul class="sub-menu">
        <li>
            <a onclick="xadmin.add_tab('工作时间添加','gongzuoshijian_add.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>工作时间添加</cite>
            </a>
        </li>
        <li>
            <a onclick="xadmin.add_tab('工作时间查询','gongzuoshijian_list.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>工作时间查询</cite>
            </a>
        </li>
    </ul>
</li>
<li>
    <a href="javascript:;">
        <i class="iconfont left-nav-li" lay-tips="薪资信息管理">&#xe6a7;</i>
        <cite>薪资信息管理</cite>
        <i class="iconfont nav_right">&#xe697;</i>
    </a>
    <ul class="sub-menu">
        <li>
            <a onclick="xadmin.add_tab('薪资信息添加','xinzixinxi_add.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>薪资信息添加</cite>
            </a>
        </li>
        <li>
            <a onclick="xadmin.add_tab('薪资信息查询','xinzixinxi_list.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>薪资信息查询</cite>
            </a>
        </li>
    </ul>
</li>
