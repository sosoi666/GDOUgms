package tianti.dao.fieldmanagement;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;
import tianti.domain.fieldmanagement.Fees;

import java.util.List;

@Repository
public interface IFeesDao {

    @Select("select * from fees where fieldtype=#{fieldType}")
    public Fees findByType(String fieldType);

    @Select("select * from fees")
    public List<Fees> findAll();

    @Select("select * from fees where id=#{id}")
    public Fees findById(Integer id);

    @Update("update fees set fieldtype=#{fieldType},cashpledge=#{cashPledge},cost=#{cost} where id=#{id}")
    public void updateFees(Fees fees);
}
