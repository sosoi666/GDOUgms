package tianti.service.user.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tianti.dao.user.UserDao;
import tianti.domain.user.User;
import tianti.service.user.UserService;

import java.util.List;

/**
 * 加注解，创建对象
 */
@Service("userService")
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao dao;

    @Override
    public List<User> findAll() {
        System.out.println("Service层：执行查询所有用户。。。");
        List<User> users = dao.findAll();
        return users;
    }

    //注册用户
    @Override
    public void saveUser(User user) {
        System.out.println("Service层：执行注册用户。。。");
        dao.saveUser(user);
    }

    @Override
    public User findUserBystudent_workedid(String student_workedid) {
        User user = dao.findUserBystudent_workedid(student_workedid);
        return user;
    }

    @Override
    public User findUserBymobilephone(String mobilephone) {
        User user = dao.findUserBymobilephone(mobilephone);
        return user;
    }

    @Override
    public User findUserByemail(String email) {
        User user = dao.findUserByemail(email);
        return user;
    }

    @Override
    public void changePasswordBystudent_workedid(String student_workedid,String newPassword) {
        dao.changePasswordBystudent_workedid(student_workedid,newPassword);
    }

    @Override
    public void changeRoleidBystudent_workedid(String student_workedid, Integer roleid) {
        dao.changeRoleidBystudent_workedid(student_workedid,roleid);
    }

    @Override
    public List<User> findUserByroleid(Integer roleid) {
        List<User> users = dao.findUserByroleid(roleid);
        return users;
    }

    @Override
    public void setMoneyByWorkedId(User user) {
        dao.setMoneyByWorkedId(user);
    }
}
