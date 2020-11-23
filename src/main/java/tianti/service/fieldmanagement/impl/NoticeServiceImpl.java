package tianti.service.fieldmanagement.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tianti.dao.fieldmanagement.INoticeDao;
import tianti.domain.fieldmanagement.Notice;
import tianti.service.fieldmanagement.INoticeService;

import java.util.List;


@Service("noticeService")
public class NoticeServiceImpl implements INoticeService {

    @Autowired
    private INoticeDao noticeDao;

    @Override
    public List<Notice> findAll() {
        return noticeDao.findAll();
    }

    @Override
    public Notice findById(Integer id) {
        return noticeDao.findById(id);
    }

    @Override
    public void saveNotice(Notice notice) {
        noticeDao.saveNotice(notice);
    }
}
