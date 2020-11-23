package tianti.service.fieldmanagement.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tianti.dao.fieldmanagement.IAppointmentDao;
import tianti.domain.fieldmanagement.Appointment;
import tianti.service.fieldmanagement.IAppointmentService;

import java.util.List;

@Service("appointmentService")
public class AppointmentServiceImpl implements IAppointmentService {

    @Autowired
    private IAppointmentDao appointmentDao;

    @Override
    public List<Appointment> findAll() {
        return appointmentDao.findAll();
    }

    @Override
    public List<Appointment> findByWeek(Integer week) {
        return appointmentDao.findByWeek(week);
    }

    @Override
    public List<Appointment> findByAny(Appointment appointment) {
        return appointmentDao.findByAny(appointment);
    }

    @Override
    public Appointment findById(Integer id) {
        return appointmentDao.findById(id);
    }

    @Override
    public List<Appointment> findByFid(Integer fid) {
        return appointmentDao.findByFid(fid);
    }

    @Override
    public List<Appointment> findByUid(String uWid) {
        return appointmentDao.findByUid(uWid);
    }

    @Override
    public void saveAppointment(Appointment appointment) {
        appointmentDao.saveAppointment(appointment);
    }

    @Override
    public void updateAppointment(Appointment appointment) {
        appointmentDao.updateAppointment(appointment);
    }

    @Override
    public void deleteAppointmentById(Integer id) {
        appointmentDao.deleteAppointmentById(id);
    }

    @Override
    public void setStatusDelById(Integer id) {
        appointmentDao.setStatusDelById(id);
    }

    @Override
    public void setStatusComById(Integer id) {
        appointmentDao.setStatusComById(id);
    }
}
