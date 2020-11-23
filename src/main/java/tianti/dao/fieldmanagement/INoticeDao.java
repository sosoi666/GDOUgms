package tianti.dao.fieldmanagement;


import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
import tianti.domain.fieldmanagement.Notice;

import java.util.List;

@Repository
public interface INoticeDao {


    @Select("select * from notice")
    public List<Notice> findAll();

    @Select("select * from notice where id=#{id}")
    public Notice findById(Integer id);

    @Insert("insert into notice (title,description,date) values(#{title},#{description},#{date})")
    public void saveNotice(Notice notice);
}
