package tianti.service.fieldmanagement;

import tianti.domain.fieldmanagement.Notice;

import java.util.List;

public interface INoticeService {

    public List<Notice> findAll();

    public Notice findById(Integer id);

    public void saveNotice(Notice notice);

}
