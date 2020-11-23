package tianti.service.fieldmanagement.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tianti.dao.fieldmanagement.IFeesDao;
import tianti.domain.fieldmanagement.Fees;
import tianti.service.fieldmanagement.IFeesService;

import java.util.List;

@Service("feesService")
public class FeesServiceImpl implements IFeesService {

    @Autowired
    private IFeesDao feesDao;

    @Override
    public Fees findByType(String fieldType) {
        return feesDao.findByType(fieldType);
    }

    @Override
    public List<Fees> findAll() {
        return feesDao.findAll();
    }

    @Override
    public Fees findById(Integer id) {
        return feesDao.findById(id);
    }

    @Override
    public void updateFees(Fees fees) {
        feesDao.updateFees(fees);
    }
}
