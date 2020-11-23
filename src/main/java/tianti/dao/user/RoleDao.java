package tianti.dao.user;

import org.apache.ibatis.annotations.Select;
import tianti.domain.user.Role;

public interface RoleDao {

    //根据id来查询角色
    @Select("select * from role where id = #{id}")
    public Role findById(Integer id);
}
