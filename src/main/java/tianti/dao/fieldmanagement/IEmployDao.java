package tianti.dao.fieldmanagement;


import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;
import org.springframework.stereotype.Repository;
import tianti.domain.fieldmanagement.Employ;


@Repository
public interface IEmployDao {

    @Select("select * from employ where aid=#{aid}")
//    @Results(id="employMap",value={
//            @Result(id=true,column = "id",property = "id"),
//            @Result(column = "aid",property = "aid"),
//            @Result(column = "starttime",property = "startTime"),
//            @Result(column = "endtime",property = "endTime"),
//            @Result(property = "appointment",column = "aid",one=@One(select = "tianti.dao.fieldmanagement.IAppointmentDao.findById",fetchType = FetchType.EAGER)),
//    })
    public Employ findByAid(Integer aid);

    @Insert("insert into employ (aid,starttime) values(#{aid},#{startTime})")
    public void saveEmploy(Employ employ);

    @Update("update employ set endtime=#{endTime} where aid=#{aid}")
    public void updateEndTime(Employ employ);

    @Delete("delete from employ where aid=#{aid}")
    public void deleteEmploy(Integer aid);
}
