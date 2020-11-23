package tianti.controller.user;
import com.google.code.kaptcha.Producer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import tianti.domain.user.User;
import tianti.service.user.UserService;
import tianti.utils.user.Utils;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;

@Controller
@RequestMapping("/validation")
public class ValidationController {

    @Autowired
    private Producer captchaProducer;

    @Autowired
    private UserService userService;

    private final String VALIDATE_CODE = "VALIDATE_CODE";

    private final String EXPIRE_TIME = "EXPIRE_TIME";

    //3、该方法是产生验证码的，我需要改的地方只有注解的value值，其他都不用改
    @RequestMapping(value = "/loadValidateCode", method = RequestMethod.GET)
    public void loadValidateCode(HttpServletRequest request, HttpServletResponse response) {
        try {
            HttpSession session = request.getSession();

            // 设置清除浏览器缓存
            response.setDateHeader("Expires", 0);
            response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
            response.addHeader("Cache-Control", "post-check=0, pre-check=0");
            response.setHeader("Pragma", "no-cache");
            response.setContentType("image/png");

            // 验证码一分钟内有效
            long expireTime = System.currentTimeMillis() + 60000;

            // 将验证码放到session中
            String validateCode = captchaProducer.createText();
            session.setAttribute(VALIDATE_CODE, Utils.encodeBase64(validateCode));//将加密后的验证码放到session中，确保安全
            session.setAttribute(EXPIRE_TIME, expireTime);

            // 输出验证码图片
            BufferedImage bufferedImage = captchaProducer.createImage(validateCode);
            ServletOutputStream out = response.getOutputStream();
            ImageIO.write(bufferedImage, "png", out);
            out.flush();
            out.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //以下  验证码检验  以及  注册是否成功
    //5、这里是检验  输入的验证码与产生的验证码是否匹配的  方法：要改的就是在不同状况下怎么处理，是跳转页面还是什么
    @RequestMapping("/validateLogin")
    public String testLogin(String validateCode,User user, HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
        String currentValidateCode = String.valueOf(request.getSession().getAttribute(VALIDATE_CODE));
        if (System.currentTimeMillis() > Long.parseLong(String.valueOf(request.getSession().getAttribute(EXPIRE_TIME)))) {
            model.addAttribute("msg","验证码已过期，请重新获取并输入。");
        }else if(StringUtils.isEmpty(validateCode) || validateCode.length() != 4 ||
                !Utils.encodeBase64(validateCode).equals(currentValidateCode)) {
            // 校验验证码
            model.addAttribute("msg","验证码错误，请重新输入。");
        }else {
            //验证码正确后，查询数据库数据，判断是否可以注册。
            User userBystudent_workedid = userService.findUserBystudent_workedid(user.getStudent_workedid());
            User userBymobilephone = userService.findUserBymobilephone(user.getMobilephone());
            User userByemail = userService.findUserByemail(user.getEmail());
            if(userBystudent_workedid != null){
                model.addAttribute("msg","'学号/学工号'已存在，注册失败！");
                return "user/registerResultFail";
            }else if(userBymobilephone != null){
                model.addAttribute("msg","'手机号'已存在，注册失败！");
                return "user/registerResultFail";
            }else if(userByemail != null){
                model.addAttribute("msg","'邮箱'已存在，注册失败！");
                return "user/registerResultFail";
            }else {
                userService.saveUser(user);
                model.addAttribute("msg","注册成功！3秒后自动跳转到登录页面。");
                return "user/registerResultSuccess";
            }
        }
        return "user/registerResultFail";

    }

}
