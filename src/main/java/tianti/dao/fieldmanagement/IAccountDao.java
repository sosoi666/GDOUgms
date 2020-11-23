package tianti.dao.fieldmanagement;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
import tianti.domain.fieldmanagement.Account;

import java.util.List;

@Repository
public interface IAccountDao {

    @Select("select * from account")
    public List<Account> findAll();

    @Insert("insert into account (name,money) values(#{name},#{money})")
    public void saveAccount(Account account);

    @Select("<script>"
            + "select * from account"
            + " <where>"
            + " 	<if test='name != null' > "
            + "	    and name = #{name}"
            + "	</if>"
            + "     <if test='money != null'>"
            + "     and money = #{money}"
            + " </if>"
            + "</where>"
            + "</script>")
    public List<Account> findByAny(Account account);
}
