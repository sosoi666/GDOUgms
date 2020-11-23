package tianti.dao.user;

import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;
import org.springframework.stereotype.Repository;
import tianti.domain.user.User;

import java.util.List;
@Repository
public interface UserDao {

    //查询所有用户
    @Select("select * from user ")
    @Results(value = {
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "student_workedid",column = "student_workedid"),
            @Result(property = "password",column = "password"),
            @Result(property = "name",column = "name"),
            @Result(property = "mobilephone",column = "mobilephone"),
            @Result(property = "email",column = "email"),
            @Result(property = "roleid",column = "roleid"),
            @Result(property = "money",column = "money"),
            @Result(property = "role", column = "roleid", one = @One(select = "tianti.dao.user.RoleDao.findById",fetchType = FetchType.EAGER))
    })
    public List<User> findAll();

    //注册账户
    @Insert("insert into user(student_workedid,password,name,mobilephone,email) values(#{student_workedid}," +
            "#{password},#{name},#{mobilephone},#{email})")
    public void saveUser(User user);

    //根据学号 / 职工号 查询用户
    @Select("select * from user where student_workedid = #{student_workedid}")
    @Results(value = {
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "student_workedid",column = "student_workedid"),
            @Result(property = "password",column = "password"),
            @Result(property = "name",column = "name"),
            @Result(property = "mobilephone",column = "mobilephone"),
            @Result(property = "email",column = "email"),
            @Result(property = "roleid",column = "roleid"),
            @Result(property = "money",column = "money"),
            @Result(property = "role", column = "roleid", one = @One(select = "tianti.dao.user.RoleDao.findById",fetchType = FetchType.EAGER))
    })
    public User findUserBystudent_workedid(String student_workedid);

    //根据手机号 查询用户
    @Select("select * from user where mobilephone = #{mobilephone}")
    @Results(value = {
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "student_workedid",column = "student_workedid"),
            @Result(property = "password",column = "password"),
            @Result(property = "name",column = "name"),
            @Result(property = "mobilephone",column = "mobilephone"),
            @Result(property = "email",column = "email"),
            @Result(property = "roleid",column = "roleid"),
            @Result(property = "money",column = "money"),
            @Result(property = "role", column = "roleid", one = @One(select = "tianti.dao.user.RoleDao.findById",fetchType = FetchType.EAGER))
    })
    public User findUserBymobilephone(String mobilephone);

    //根据邮箱 查询用户
    @Select("select * from user where email = #{email}")
    @Results(value = {
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "student_workedid",column = "student_workedid"),
            @Result(property = "password",column = "password"),
            @Result(property = "name",column = "name"),
            @Result(property = "mobilephone",column = "mobilephone"),
            @Result(property = "email",column = "email"),
            @Result(property = "roleid",column = "roleid"),
            @Result(property = "money",column = "money"),
            @Result(property = "role", column = "roleid", one = @One(select = "tianti.dao.user.RoleDao.findById",fetchType = FetchType.EAGER))
    })
    public User findUserByemail(String email);

    //根据学号 / 职工号 修改密码
    @Update("update user set password=#{newPassword} where student_workedid=#{student_workedid}")
    public void changePasswordBystudent_workedid(@Param("student_workedid") String student_workedid,@Param("newPassword") String newPassword);

    //根据学号/职工号 修改角色id
    @Update("update user set roleid=#{roleid} where student_workedid=#{student_workedid}")
    public void changeRoleidBystudent_workedid(@Param("student_workedid") String student_workedid,@Param("roleid") Integer roleid);

    //根据 roleid 查询数据库
    @Select("select * from user where roleid = #{roleid}")
    @Results(value = {
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "student_workedid",column = "student_workedid"),
            @Result(property = "password",column = "password"),
            @Result(property = "name",column = "name"),
            @Result(property = "mobilephone",column = "mobilephone"),
            @Result(property = "email",column = "email"),
            @Result(property = "roleid",column = "roleid"),
            @Result(property = "money",column = "money"),
            @Result(property = "role", column = "roleid", one = @One(select = "tianti.dao.user.RoleDao.findById",fetchType = FetchType.EAGER))
    })
    public List<User> findUserByroleid(Integer roleid);

    //根据 student_workedid 修改余额
    @Update("update user set money=#{money} where student_workedid = #{student_workedid}")
    @Results(value = {
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "student_workedid",column = "student_workedid"),
            @Result(property = "password",column = "password"),
            @Result(property = "name",column = "name"),
            @Result(property = "mobilephone",column = "mobilephone"),
            @Result(property = "email",column = "email"),
            @Result(property = "roleid",column = "roleid"),
            @Result(property = "money",column = "money"),
    })
    public void setMoneyByWorkedId(User user);

}
