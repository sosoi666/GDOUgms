package tianti.service.user;

import tianti.domain.user.Announcement;

public interface AnnouncementService {
    //修改馆内公告
    public void changeAnnouncement(Integer id,String student_workedid,String name,String content);

    //根据id查询 馆内公告
    public Announcement getAnnouncement(Integer id);

}
