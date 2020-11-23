package tianti.dao.fieldmanagement;


import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;
import org.springframework.stereotype.Repository;
import tianti.domain.fieldmanagement.Appointment;

import java.util.List;

@Repository
public interface IAppointmentDao {

    @Select("select * from appointment")
    @Results(id="appointmentMap",value={
            @Result(id=true,column = "id",property = "id"),
            @Result(column = "fid",property = "fid"),
            @Result(column = "uwid",property = "uWid"),
            @Result(column = "type",property = "type"),
            @Result(column = "week",property = "week"),
            @Result(column = "day",property = "day"),
            @Result(column = "hours",property = "hours"),
            @Result(column = "remark",property = "remark"),
            @Result(column = "status",property = "status"),
            @Result(property = "field",column = "fid",one=@One(select = "tianti.dao.fieldmanagement.IFieldDao.findById",fetchType = FetchType.EAGER)),
            @Result(property = "user",column = "uWid",one=@One(select = "tianti.dao.user.UserDao.findUserBystudent_workedid",fetchType = FetchType.EAGER))
    })
    public List<Appointment> findAll();

    @Select("select * from appointment where week>=#{week} and status = 0")
    @ResultMap("appointmentMap")
    public List<Appointment> findByWeek(Integer week);


    @Select("<script>"
            + "select * from appointment"
            + " <where>"
            + " 	<if test='type != null' > "
            + "	    and type = #{type}"
            + "	</if>"
            + "     <if test='week != null'>"
            + "     and week = #{week}"
            + " </if>"
            + "     <if test='day != null'>"
            + "     and day = #{day}"
            + " </if>"
            + "     <if test='hours != null'>"
            + "     and hours = #{hours}"
            + " </if>"
            + "</where>"
            + "</script>")
    @ResultMap("appointmentMap")
    public List<Appointment> findByAny(Appointment appointment);


    @Select("select * from appointment where id=#{id}")
    @ResultMap("appointmentMap")
    public Appointment findById(Integer id);

    @Select("select * from appointment where fid=#{fid}")
    public List<Appointment> findByFid(Integer fid);

    @Select("select * from appointment where uwid=#{uWid}")
    @ResultMap("appointmentMap")
    public List<Appointment> findByUid(String uWid);

    @Insert("insert into appointment (fid,uwid,type,week,day,hours,remark) values(#{fid},#{uWid},#{type},#{week},#{day},#{hours},#{remark})")
    public void saveAppointment(Appointment appointment);

    @Update("update appointment set fid=#{fid},uwid=#{uWid},type=#{type},week=#{week},day=#{day},hours=#{hours},remark=#{remark} where id=#{id}")
    public void updateAppointment(Appointment appointment);

    @Delete("delete from appointment where id=#{id}")
    public void deleteAppointmentById(Integer id);

    @Update("update appointment set status= 2 where id=#{id}")
    public void setStatusDelById(Integer id);

    @Update("update appointment set status= 1 where id=#{id}")
    public void setStatusComById(Integer id);

}
