package tianti.test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import tianti.domain.fieldmanagement.Account;
import tianti.domain.fieldmanagement.Appointment;
import tianti.domain.fieldmanagement.Field;
import tianti.service.fieldmanagement.IAccountService;
import tianti.service.fieldmanagement.IAppointmentService;
import tianti.service.fieldmanagement.IFieldService;

import java.util.List;

public class TestSpring {

    @Test
    public void run1(){
        //加载配置文件
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        //获取对象
        IFieldService as = (IFieldService) ac.getBean("fieldService");
        //调用方法
        List<Field> list = as.findAll();
        for (Field field : list){
            System.out.println(field);
            System.out.println(field.getFees());
            for(Appointment appointment : field.getAppointments()){
                System.out.println(appointment);
            }
        }
    }
    @Test
    public void run2(){
        //加载配置文件
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        //获取对象
        IFieldService as = (IFieldService) ac.getBean("fieldService");
        //调用方法
        Field field = new Field();
        //field.setFieldType("羽毛球场");
        //field.setUseType("普通");
        field.setSize("体育馆副馆");
        field.setUseType("上课使用");

        List<Field> list = as.findByAny(field);
        for (Field field1 : list){
            System.out.println(field1);
            System.out.println(field1.getFees());
        }
    }

    @Test
    public void run3(){
        //加载配置文件
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        //获取对象
        IFieldService as = (IFieldService) ac.getBean("fieldService");
        //调用方法
        Field field = new Field();
        field.setFieldName("篮球场3");
        field.setFieldType("篮球场");
        field.setUseType("上课使用");
        field.setBeginDay(1);
        field.setEndDay(6);
        field.setSize("西区运动场");
        field.setRemark("课程号：c00013");
        as.saveField(field);
    }


    @Test
    public void run4(){
        //加载配置文件
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        //获取对象
        IFieldService as = (IFieldService) ac.getBean("fieldService");
        //调用方法
        Field field = new Field();
        field.setId(8);
        field.setFieldName("篮球场2");
        field.setFieldType("篮球场");
        field.setUseType("校队使用");
        field.setSize("西区运动场");
        field.setBeginDay(1);
        field.setEndDay(7);
        field.setRemark("篮球校队训练场地");

        as.update(field);
    }

    @Test
    public void run5(){
        //加载配置文件
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        //获取对象
        IFieldService as = (IFieldService) ac.getBean("fieldService");
        //调用方法
        int id = 12;
        as.deleteById(id);
    }

    @Test
    public void run6(){
        //加载配置文件
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        //获取对象
        IAppointmentService as = (IAppointmentService) ac.getBean("appointmentService");
        //调用方法
        List<Appointment> list = as.findAll();
        for (Appointment appointment : list){
            System.out.println(appointment);
            System.out.println(appointment.getField());
            System.out.println(appointment.getUser());
        }
    }

    @Test
    public void run7(){
        //加载配置文件
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        //获取对象
        IAppointmentService as = (IAppointmentService) ac.getBean("appointmentService");
        //调用方法
        Appointment app = new Appointment();
        app.setType("普通预约");
        //app.setDay(4);
        app.setWeek(17);
        //app.setHours("16:00-18:00");

        List<Appointment> list = as.findByAny(app);
        for (Appointment appointment : list){
            System.out.println(appointment);
            System.out.println(appointment.getField());
            System.out.println(appointment.getUser());
        }
    }

    @Test
    public void run8(){
        //加载配置文件
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        //获取对象
        IAppointmentService as = (IAppointmentService) ac.getBean("appointmentService");
        //调用方法
        Appointment app = new Appointment();
        app.setFid(13);
        app.setuWid("201711701402");
        app.setType("普通预约");
        app.setWeek(17);
        app.setDay(5);
        app.setHours("14:00-16:00");
        app.setRemark("无");
        as.saveAppointment(app);
    }

    @Test
    public void run9(){
        //加载配置文件
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        //获取对象
        IAppointmentService as = (IAppointmentService) ac.getBean("appointmentService");
        //调用方法
        Appointment app = new Appointment();
        app.setId(5);
        app.setFid(13);
        app.setuWid("201711701402");
        app.setType("普通预约");
        app.setWeek(17);
        app.setDay(3);
        app.setHours("14:00-16:00");
        app.setRemark("无");
        as.updateAppointment(app);
    }

    @Test
    public void run10(){
        //加载配置文件
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        //获取对象
        IAppointmentService as = (IAppointmentService) ac.getBean("appointmentService");
        //调用方法
        as.deleteAppointmentById(5);
    }

    @Test
    public void run11(){
        //加载配置文件
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        //获取对象
        IAppointmentService as = (IAppointmentService) ac.getBean("appointmentService");
        //调用方法
        as.setStatusDelById(5);
    }

    @Test
    public void run12(){
        //加载配置文件
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        //获取对象
        IAppointmentService as = (IAppointmentService) ac.getBean("appointmentService");
        //调用方法
        List<Appointment> list = as.findByWeek(17);

        for (Appointment appointment : list){
            System.out.println(appointment);
            System.out.println(appointment.getField());
            System.out.println(appointment.getUser());
        }
    }
}
