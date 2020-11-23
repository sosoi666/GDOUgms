package tianti.service.fieldmanagement.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tianti.dao.fieldmanagement.IFieldDao;
import tianti.domain.fieldmanagement.Field;
import tianti.service.fieldmanagement.IFieldService;

import java.util.List;

@Service("fieldService")
public class FieldServiceImpl implements IFieldService {

    @Autowired
    private IFieldDao fieldDao;

    @Override
    public List<Field> findAll() {
        return fieldDao.findAll();
    }

    @Override
    public Field findById(Integer id) {
        return fieldDao.findById(id);
    }

    @Override
    public List<Field> findByAny(Field field) {
        return fieldDao.findByAny(field);
    }

    @Override
    public void saveField(Field field) {
        fieldDao.saveField(field);
    }

    @Override
    public void update(Field field) {
        fieldDao.update(field);
    }

    @Override
    public void deleteById(Integer id) {
        fieldDao.deleteById(id);
    }
}
