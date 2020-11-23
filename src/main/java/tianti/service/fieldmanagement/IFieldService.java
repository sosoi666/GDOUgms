package tianti.service.fieldmanagement;

import tianti.domain.fieldmanagement.Field;

import java.util.List;

public interface IFieldService {

    public List<Field> findAll();

    public Field findById(Integer id);

    public List<Field> findByAny(Field field);

    public void saveField(Field field);

    public void update(Field field);

    public void deleteById(Integer id);
}
