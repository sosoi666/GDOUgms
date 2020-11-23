package tianti.service.fieldmanagement;

import tianti.domain.fieldmanagement.Employ;

public interface IEmployService {

    public Employ findByAid(Integer aid);

    public void saveEmploy(Employ employ);

    public void updateEndTime(Employ employ);

    public void deleteEmploy(Integer aid);
}
