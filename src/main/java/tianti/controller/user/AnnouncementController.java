package tianti.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import tianti.domain.user.Announcement;
import tianti.domain.user.User;
import tianti.service.user.AnnouncementService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/announcement")
public class AnnouncementController {

    @Autowired
    private AnnouncementService announcementService;

    //跳转到 修改馆内设施公告
    @RequestMapping("/toChangeAnnouncement")
    public String toChangeAnnouncement(){

        return "user/changeAnnouncement";
    }

    //修改馆内设施罚款公告
    @RequestMapping("/changeAnnouncement")
    public String changeAnnouncement(String announcement, HttpServletRequest request){
        System.out.println(announcement);
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        announcementService.changeAnnouncement(1,user.getStudent_workedid(),user.getName(),announcement);
        return "user/changeAnnouncementSuccess";
    }

    //页面一加载就去获取馆内设施罚款条例公告
    @RequestMapping("/getAnnouncement")
    public @ResponseBody Announcement getAnnouncement(){
        Announcement announcement = announcementService.getAnnouncement(1);
        return announcement;
    }

}
