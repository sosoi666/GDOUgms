package tianti.dao.fieldmanagement;


import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;
import org.springframework.stereotype.Repository;
import tianti.domain.fieldmanagement.Field;

import java.util.List;

@Repository
public interface IFieldDao {

    @Select("select * from field")
    @Results(id="fieldMap",value={
            @Result(id=true,column = "id",property = "id"),
            @Result(column = "fieldname",property = "fieldName"),
            @Result(column = "fieldtype",property = "fieldType"),
            @Result(column = "usetype",property = "useType"),
            @Result(column = "size",property = "size"),
            @Result(column = "beginday",property = "beginDay"),
            @Result(column = "endday",property = "endDay"),
            @Result(column = "remark",property = "remark"),
            @Result(property = "fees",column = "fieldtype",one=@One(select = "tianti.dao.fieldmanagement.IFeesDao.findByType",fetchType = FetchType.EAGER)),
            @Result(property = "appointments",column = "id",many=@Many(select = "tianti.dao.fieldmanagement.IAppointmentDao.findByFid",fetchType = FetchType.LAZY))
    })
    public List<Field> findAll();


    @Select("select * from field where id=#{id}")
    @ResultMap("fieldMap")
    public Field findById(Integer id);

    @Select("<script>"
            + "select * from field"
            + " <where>"
            + " 	<if test='fieldType != null' > "
            + "	    and fieldtype = #{fieldType}"
            + "	</if>"
            + "     <if test='useType != null'>"
            + "     and usetype = #{useType}"
            + " </if>"
            + "     <if test='size != null'>"
            + "     and size = #{size}"
            + " </if>"
            + "</where>"
            + "</script>")
    @ResultMap("fieldMap")
    public List<Field> findByAny(Field field);

    @Insert("insert into field (fieldname,fieldtype,usetype,size,beginday,endday,remark) values(#{fieldName},#{fieldType},#{useType},#{size},#{beginDay},#{endDay},#{remark})")
    public void saveField(Field field);

    @Update("update field set fieldname=#{fieldName},fieldtype=#{fieldType},usetype=#{useType},size=#{size},beginday=#{beginDay},endday=#{endDay},remark=#{remark} where id=#{id}")
    public void update(Field field);

    @Delete("delete from field where id=#{id}")
    public void deleteById(Integer id);
}
