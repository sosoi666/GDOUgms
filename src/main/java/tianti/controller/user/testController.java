package tianti.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import tianti.domain.user.User;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/test")
public class testController {
    @RequestMapping("/ajaxqq")
    public @ResponseBody List<User> testAjax(@RequestBody User user){
        System.out.println(user.getRoleid());
        user.setStudent_workedid("11111111");
        List<User> users = new ArrayList<User>();
        users.add(user);
        return users;
    }
    //produces注解为的是解决中文字符串响应给jsp时出现乱码问题。
    @RequestMapping(value = "/ajax2",produces = "text/html;charset=UTF-8")
    public @ResponseBody String ajax2(){
        return "{\"msg\":\"登录失败哦！\"}";
    }
}
