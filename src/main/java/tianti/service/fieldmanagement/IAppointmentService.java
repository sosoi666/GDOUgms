package tianti.service.fieldmanagement;

import tianti.domain.fieldmanagement.Appointment;

import java.util.List;

public interface IAppointmentService {

    public List<Appointment> findAll();

    public List<Appointment> findByWeek(Integer week);

    public List<Appointment> findByAny(Appointment appointment);

    public Appointment findById(Integer id);

    public List<Appointment> findByFid(Integer fid);

    public List<Appointment> findByUid(String uWid);

    public void saveAppointment(Appointment appointment);

    public void updateAppointment(Appointment appointment);

    public void deleteAppointmentById(Integer id);

    public void setStatusDelById(Integer id);

    public void setStatusComById(Integer id);
}
