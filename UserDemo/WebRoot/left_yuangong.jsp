<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>


<li>
    <a href="javascript:;">
        <i class="iconfont left-nav-li" lay-tips="工作时间">&#xe6a7;</i>
        <cite>工作时间</cite>
        <i class="iconfont nav_right">&#xe697;</i>
    </a>
    <ul class="sub-menu">
        <li>
            <a onclick="xadmin.add_tab('工作时间查询','gongzuoshijian_list_gonghao.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>工作时间查询</cite>
            </a>
        </li>
    </ul>
</li>
<li>
    <a href="javascript:;">
        <i class="iconfont left-nav-li" lay-tips="薪资信息">&#xe6a7;</i>
        <cite>薪资信息</cite>
        <i class="iconfont nav_right">&#xe697;</i>
    </a>
    <ul class="sub-menu">
        <li>
            <a onclick="xadmin.add_tab('薪资信息查询','xinzixinxi_list_gonghao.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>薪资信息查询</cite>
            </a>
        </li>
    </ul>
</li>
<li>
    <a href="javascript:;">
        <i class="iconfont left-nav-li" lay-tips="个人中心">&#xe6a7;</i>
        <cite>个人中心</cite>
        <i class="iconfont nav_right">&#xe697;</i>
    </a>
    <ul class="sub-menu">
        <li>
            <a onclick="xadmin.add_tab('修改个人资料','yuangong_updtself.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>修改个人资料</cite>
            </a>
        </li>
        <li>
            <a onclick="xadmin.add_tab('修改密码','mod.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>修改密码</cite>
            </a>
        </li>
        <li>
            <a onclick="xadmin.add_tab('上传证件照','upload_re.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>上传证件照</cite>
            </a>
        </li>
    </ul>
</li>
