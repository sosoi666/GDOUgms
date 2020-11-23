package tianti.service.user.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tianti.dao.user.AnnouncementDao;
import tianti.domain.user.Announcement;
import tianti.service.user.AnnouncementService;
@Service
public class AnnouncementServiceImpl implements AnnouncementService {

    @Autowired
    private AnnouncementDao announcementDao;

    @Override
    public void changeAnnouncement(Integer id,String student_workedid, String name, String content) {
        announcementDao.changeAnnouncement(id,student_workedid,name,content);
    }

    @Override
    public Announcement getAnnouncement(Integer id) {
        Announcement announcement = announcementDao.getAnnouncement(id);
        return announcement;
    }
}
