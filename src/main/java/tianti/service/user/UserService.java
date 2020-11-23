package tianti.service.user;

import tianti.domain.user.User;

import java.util.List;

public interface UserService {

    //查询所有用户
    public List<User> findAll();

    //注册账户
    public void saveUser(User user);

    //根据学号 / 职工号 查询用户
    public User findUserBystudent_workedid(String student_workedid);

    //根据手机号 查询用户
    public User findUserBymobilephone(String mobilephone);

    //根据邮箱 查询用户
    public User findUserByemail(String email);

    //根据学号/职工号 修改密码
    public void changePasswordBystudent_workedid(String student_workedid,String newPassword);

    //根据学号/职工号 修改角色id
    public void changeRoleidBystudent_workedid(String student_workedid,Integer roleid);

    //根据 roleid 查询数据库
    public List<User> findUserByroleid(Integer roleid);

    public void setMoneyByWorkedId(User user);

}
