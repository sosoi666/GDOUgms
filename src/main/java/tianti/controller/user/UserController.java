package tianti.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import tianti.domain.user.User;
import tianti.service.user.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * 类上加量注解
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    //处理登录
    @RequestMapping("/login")
    public String login(String student_workedid,String password,Model model,HttpServletRequest request){
        User user = userService.findUserBystudent_workedid(student_workedid);
        if(user == null){
            model.addAttribute("loginFailMsg","登录失败，学号 / 职工号 不存在！");
            return "user/loginFail";
        }else if(!password.equals(user.getPassword())){
            model.addAttribute("loginFailMsg","登录失败，密码错误！");
            return "user/loginFail";
        }else {
            HttpSession session = request.getSession();
            session.setAttribute("user",user);
            return "user/loginSuccess";
        }
    }

    // 跳转到 修改密码 界面
    @RequestMapping("/toChangePassword")
    public String toChangePassword(){
        return "user/changePassword";
    }

    //修改密码
    @RequestMapping("/changePassword")
    public String changePassword(String oldPassword,String newPassword,String newPassword2,HttpServletRequest request,Model model){
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if(!oldPassword.equals(user.getPassword())){
            System.out.println("这里是输入的旧密码不正确");
            model.addAttribute("cPasswordFailMsg","输入的旧密码不正确，修改密码失败！");
            return "user/changePasswordFail";
        }else if(!newPassword.equals(newPassword2)){
            System.out.println("两次输入的新密码不一致");
            model.addAttribute("cPasswordFailMsg","两次输入的新密码不一致，修改密码失败！");
            return "user/changePasswordFail";
        }else {
            System.out.println("这里是修改密码成功");
            System.out.println(user.getStudent_workedid());
            System.out.println(newPassword);
            userService.changePasswordBystudent_workedid(user.getStudent_workedid(),newPassword);
            user.setPassword(newPassword);
            session.setAttribute("user",user);
            System.out.println("还没执行到return");
            return "user/changePasswordSuccess";
        }

    }

    //跳转添加管理员
    @RequestMapping("/toAddAdmin")
    public String toAddAdmin(){

        return "user/addAdmin";
    }

    //添加管理员
    @RequestMapping("/addAdmin")
    public String addAdmin(String student_workedid,Integer roletype,Model model){
        User user = userService.findUserBystudent_workedid(student_workedid);
        if(user == null){
            model.addAttribute("addAdminMsg","添加失败！学号/管理员 不存在，请重新输入");
            return "user/addAdminFail";
        }else if(user.getRoleid() != 5){
            model.addAttribute("addAdminMsg","添加失败！该用户不是普通用户，无法添加。请重新输入");
            return "user/addAdminFail";
        }else {
            userService.changeRoleidBystudent_workedid(user.getStudent_workedid(),roletype);
            return "user/addAdminSuccess";
        }
    }

    //跳转到删除管理员
    @RequestMapping("/toDeleteAdmin")
    public String toDeleteAdmin(){

        return "user/deleteAdmin";
    }

    //删除管理员
    @RequestMapping("/deleteAdmin")
    public String deleteAdmin(String student_workedid,Model model){
        User user = userService.findUserBystudent_workedid(student_workedid);
        if(user == null){
            model.addAttribute("deleteAdminMsg","删除失败！学号/管理员 不存在，请重新输入");
            return "user/deleteAdminFail";
        }else if(user.getRoleid() != 2 && user.getRoleid() != 3 && user.getRoleid() != 4){
            model.addAttribute("deleteAdminMsg","删除失败！该用户不是管理员，请重新输入");
            return "user/deleteAdminFail";
        }else {
            userService.changeRoleidBystudent_workedid(student_workedid,5);
            return "user/deleteAdminSuccess";
        }

    }

    //跳转 查询管理员
    @RequestMapping("/toFindAdmin")
    public String toFindAdmin(){

        return "user/findAdmin";
    }

    //根据roleid  查询管理员
    @RequestMapping("/findAdmin")
    public @ResponseBody List<User> findAdmin(@RequestBody User user){
        Integer roleid = user.getRoleid();
        System.out.println(roleid);
        List<User> users = userService.findUserByroleid(roleid);

        return users;
    }
//    findAllAdmin

    //查询所有管理员
    @RequestMapping("/findAllAdmin")
    public @ResponseBody List<User> findAllAdmin(){
        List<User> users1 = userService.findUserByroleid(2);
        List<User> users2 = userService.findUserByroleid(3);
        List<User> users3 = userService.findUserByroleid(4);
        users1.addAll(users2);
        users1.addAll(users3);
        return users1;
    }

    //更新管理员角色
    @RequestMapping(value = "/updateAdmin",produces = "text/html;charset=UTF-8")
    public @ResponseBody String updateAdmin(@RequestBody User user){

        User userBystudent_workedid = userService.findUserBystudent_workedid(user.getStudent_workedid());
        if(userBystudent_workedid == null){

            return "{\"msg\":\"用户不存在，请重新输入！\"}";
        }else if(userBystudent_workedid.getRoleid() != 2 && userBystudent_workedid.getRoleid() != 3 &&
                userBystudent_workedid.getRoleid() !=4 ){

            return "{\"msg\":\"该用户不是管理员角色类型，请重新输入！\"}";
        }else {
            userService.changeRoleidBystudent_workedid(user.getStudent_workedid(),user.getRoleid());
            return "{\"msg\":\"更新成功！\"}";
        }

    }


    //查询所有用户
    @RequestMapping("/findAll")
    public String findAll(Model model){
        System.out.println("web层：执行查询所有方法。。。");
        List<User> users = userService.findAll();
        model.addAttribute("users",users);
        return "success";
    }

    //注册用户
    @RequestMapping("/saveUser")
    public void saveUser(User user, HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("web层：执行注册用户方法。。。");
        userService.saveUser(user);
        response.sendRedirect(request.getContextPath()+"/user/findAll");
    }

    //转跳登录成功主页面
    @RequestMapping("/toLoginSuccessPage")
    public String toLoginSuccessPage() {
        return "user/loginSuccess";
    }
}
