package user.javaweb.demo.entity;

import user.javaweb.demo.entity;

public interface Noguanli{
    //登录时
    public User CheckLogin(String name, String sid, String password);
    //添加成员信息
    public boolean addStudent(User student);
    //更新成员信息
    public boolean updateStudent(String sid,User student);
    //删除成员信息
    public boolean deleteStudent(String sid);
    //查询所有的成员信息
    public List<User> getAllStudent(String sid);
}
