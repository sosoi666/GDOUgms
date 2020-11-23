package tianti.service.fieldmanagement;

import tianti.domain.fieldmanagement.Fees;

import java.util.List;

public interface IFeesService {

    public Fees findByType(String fieldType);

    public List<Fees> findAll();

    public Fees findById(Integer id);

    public void updateFees(Fees fees);
}
