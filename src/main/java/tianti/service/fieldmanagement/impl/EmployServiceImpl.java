package tianti.service.fieldmanagement.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tianti.dao.fieldmanagement.IEmployDao;
import tianti.domain.fieldmanagement.Employ;
import tianti.service.fieldmanagement.IEmployService;


@Service("employService")
public class EmployServiceImpl implements IEmployService {

    @Autowired
    private IEmployDao employDao;

    @Override
    public Employ findByAid(Integer aid) {
        return employDao.findByAid(aid);
    }

    @Override
    public void saveEmploy(Employ employ) {
        employDao.saveEmploy(employ);
    }

    @Override
    public void updateEndTime(Employ employ) {
        employDao.updateEndTime(employ);
    }

    @Override
    public void deleteEmploy(Integer aid) {
        employDao.deleteEmploy(aid);
    }
}
