package tianti.dao.user;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;
import tianti.domain.user.Announcement;

@Repository
public interface AnnouncementDao {

    //修改馆内公告
    @Update("update announcement set student_workedid=#{student_workedid},name=#{name},content=#{content} where id =#{id}")
    public void changeAnnouncement(@Param("id") Integer id,@Param("student_workedid") String student_workedid,
                                   @Param("name") String name,@Param("content") String content);

    //根据id 查询公告
    @Select("select * from announcement where id = #{id}")
    public Announcement getAnnouncement(Integer id);

}
