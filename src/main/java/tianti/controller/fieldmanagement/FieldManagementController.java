package tianti.controller.fieldmanagement;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import tianti.domain.fieldmanagement.*;
import tianti.domain.user.User;
import tianti.service.fieldmanagement.*;
import tianti.service.user.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/field")
public class FieldManagementController {

    @Autowired
    private IFieldService fieldService;

    private Integer thisWeek;

    @Autowired
    private IAppointmentService appointmentService;

    @Autowired
    private UserService userService;

    @Autowired
    private IFeesService feesService;

    @Autowired
    private INoticeService noticeService;

    @Autowired
    private IEmployService employService;

    //跳转管理员主界面
    @RequestMapping("/toIndex")
    public String toIndex(Model model){
        List<Notice> list1 = noticeService.findAll();
        List<Notice> list = new ArrayList<Notice>();
        for (int i = list1.size() - 1; i >= 0; i--) {
            list.add(list1.get(i));
        }
        model.addAttribute("list",list);
        return "fieldManagement/a_field_index";
    }

    //跳转到场地公告页面
    @RequestMapping("/toNotice")
    public String toNotice(Integer id,Model model){
        Notice notice = noticeService.findById(id);
        model.addAttribute("notice",notice);
        return "fieldManagement/a_notice_check";
    }

    //查询场地
    @RequestMapping("/fieldQuery")
    public String fieldQuery(Model model){
        List<Field> list = fieldService.findAll();
        model.addAttribute("list",list);
        return "fieldManagement/a_field_query";
    }

    //模糊查询场地
    @RequestMapping("/findByAny")
    public String findByAny(Field field,Model model){
        System.out.println("表现层：查询场地");
        //调用service
        System.out.println(field);
        String emp = "全部";
        if (field.getFieldType().equals(emp)){
            field.setFieldType(null);
        }
        if (field.getUseType().equals(emp)){
            field.setUseType(null);
        }
        if (field.getSize().equals(emp)){
            field.setSize(null);
        }
        System.out.println(field);
        List<Field> list = fieldService.findByAny(field);
        for (Field field1 : list){
            System.out.println(field1);
            System.out.println(field1.getFees());
        }
        model.addAttribute("list",list);
        return "fieldManagement/a_field_query";
    }

    //删除场地
    @RequestMapping("/deleteField")
    public String deleteField(Integer id,HttpServletRequest request, HttpServletResponse response) throws IOException {

        System.out.println(id);
        fieldService.deleteById(id);
        response.sendRedirect(request.getContextPath()+"/field/fieldQuery");
        return "fieldManagement/a_field_query";
    }

    //跳转添加场地页面
    @RequestMapping("/toAddFieldPage")
    public String toAddFieldPage(Field field){
        return "fieldManagement/a_field_add";
    }

    //添加场地
    @RequestMapping("/addField")
    public String addField(Field field,HttpServletRequest request, HttpServletResponse response) throws Exception{
        System.out.println(field);
        fieldService.saveField(field);
        response.sendRedirect(request.getContextPath()+"/field/fieldQuery");
        return "fieldManagement/a_field_query";
    }

    //跳转编辑场地页面
    @RequestMapping("/toEditField")
    public String toEditField(Integer id, Model model){
        System.out.println(id);
        Field field = fieldService.findById(id);
        model.addAttribute("tField",field);
        return "fieldManagement/a_field_edit";
    }

    //更新场地
    @RequestMapping("/updateField")
    public String updateField(Field field, HttpServletRequest request, HttpServletResponse response) throws  Exception{
        System.out.println(field);
        fieldService.update(field);
        response.sendRedirect(request.getContextPath()+"/field/fieldQuery");
        return "fieldManagement/a_field_query";
    }

    //场地预约管理

    //查询所有预约
    @RequestMapping("/appointmentQueryAll")
    public String appointmentQueryAll(Model model){
        List<Appointment> list = appointmentService.findAll();
        model.addAttribute("app",list);
        return "fieldManagement/a_appointment_query";
    }

    //查询本周后预约
    @RequestMapping("/appointmentQuery")
    public String appointmentQuery(Integer week,Model model){
        System.out.println(week);
        thisWeek = week;
        List<Appointment> list = appointmentService.findByWeek(week);
        model.addAttribute("app",list);
        return "fieldManagement/a_appointment_query";
    }

    //模糊查询预约
    @RequestMapping("/findAppByAny")
    public String findAppByAny(Appointment appointment,Model model){
        System.out.println("表现层：查询预约");
        //调用service
        System.out.println(appointment);
        String emp = "全部";
        if (appointment.getType().equals(emp)){
            appointment.setType(null);
        }
        if (appointment.getWeek()== 0){
            appointment.setWeek(null);
        }
        if (appointment.getDay()== 0){
            appointment.setDay(null);
        }
        if (appointment.getHours().equals(emp)){
            appointment.setHours(null);
        }
        System.out.println(appointment);
        List<Appointment> list = appointmentService.findByAny(appointment);
        List<Appointment> list1 = new ArrayList<Appointment>();
        for (Appointment appointment1 : list){
            if ((appointment1.getWeek()>=thisWeek)&&(appointment1.getStatus()==0)){
                list1.add(appointment1);
            }
            System.out.println(appointment1);
            System.out.println(appointment1.getField());
            System.out.println(appointment1.getUser());
        }
        model.addAttribute("app",list1);
        return "fieldManagement/a_appointment_query";
    }

    //管理员删除预约
    @RequestMapping("/deleteAppointment")
    public String deleteAppointment(Integer id,HttpServletRequest request, HttpServletResponse response) throws IOException {

        System.out.println(id);
        appointmentService.setStatusDelById(id);
        response.sendRedirect(request.getContextPath()+"/field/appointmentQuery?week="+thisWeek);
        return "fieldManagement/a_appointment_query";
    }

    //跳转添加预约主页面
    @RequestMapping("/toAddAppPage")
    public String toAddAppPage(Model model){
        List<Field> list = fieldService.findAll();
        List<Field> list1 = new ArrayList<Field>();
        String emp = "普通";
        for (Field field : list){
            if (field.getUseType().equals(emp)){
                list1.add(field);
            }
        }
        model.addAttribute("appField",list1);
        return "fieldManagement/a_appointment_add1";
    }

    //添加预约时的查询场地
    @RequestMapping("/findByAnyAppField")
    public String findByAnyAppField(Field field,Model model){
        //调用service
        String emp = "全部";
        field.setUseType("普通");

        if (field.getFieldType().equals(emp)){
            field.setFieldType(null);
        }
        if (field.getSize().equals(emp)){
            field.setSize(null);
        }
        System.out.println(field);
        List<Field> list = fieldService.findByAny(field);
        for (Field field1 : list){
            System.out.println(field1);
            System.out.println(field1.getFees());
        }
        model.addAttribute("appField",list);
        return "fieldManagement/a_appointment_add1";
    }

    //跳转添加预约具体场地页面
    @RequestMapping("/toAddAppointment")
    public String toAddAppointment(Integer id, Model model){
        System.out.println(id);
        Field field = fieldService.findById(id);
        System.out.println(field);
        model.addAttribute("thisField",field);
        return "fieldManagement/a_appointment_add2";
    }

    //添加预约
    @RequestMapping("/addAppointment")
    public String addAppointment(Appointment appointment,HttpServletRequest request, HttpServletResponse response) throws Exception{
        System.out.println(appointment);
        appointmentService.saveAppointment(appointment);
        response.sendRedirect(request.getContextPath()+"/field/toAddAppPage");
        return "fieldManagement/a_appointment_add1";
    }

    //跳转编辑预约页面
    @RequestMapping("/toEditApp")
    public String toEditApp(Integer id, Model model){
        System.out.println(id);
        List<Field> fields = new ArrayList<Field>();
        List<Field> list1 = new ArrayList<Field>();
        Field field = new Field();
        Appointment appointment = appointmentService.findById(id);
        field.setFieldType(appointment.getField().getFieldType());
        fields = fieldService.findByAny(field);
        String emp = "普通";
        for (Field list : fields){
            if (list.getUseType().equals(emp)){
                System.out.println(list);
                list1.add(list);
            }
        }
        System.out.println(appointment);
        model.addAttribute("tApp",appointment);
        model.addAttribute("aField",JSON.toJSON(list1));
        return "fieldManagement/a_appointment_edit";
    }

//    @RequestMapping("/findAllFieldName")
//    public @ResponseBody Appointment  findAllFieldName(@RequestBody Field field,Model model){
//        //Field field = new Field();
//        //field.setFieldType(fieldType);
//        Appointment app = new Appointment();
//        app.setWeek(17);
//        List<Field> fields = fieldService.findByAny(field);
//        List<Field> list1 = new ArrayList<Field>();
//        String emp = "普通";
//        for (Field list : fields){
//            if (list.getUseType().equals(emp)){
//                System.out.println(list);
//                list1.add(list);
//            }
//        }
//        for (Field list2 : list1){
//            System.out.println(list2);
//        }
//        //model.addAttribute("aField",field);
//        return app;
//    }

    //更新预约
    @RequestMapping("/editAppointment")
    public String editAppointment(Appointment appointment, HttpServletRequest request, HttpServletResponse response) throws  Exception{
        System.out.println(appointment);
        appointmentService.updateAppointment(appointment);
        response.sendRedirect(request.getContextPath()+"/field/toAddAppPage");
        return "fieldManagement/a_appointment_add1";
    }

    //学生

    //跳转学生主页面
    @RequestMapping("/toUserIndex")
    public String toUserIndex(Model model, HttpSession session){
        List<Notice> list1 = noticeService.findAll();
        List<Notice> list = new ArrayList<Notice>();
        for (int i = list1.size() - 1; i >= 0; i--) {
            list.add(list1.get(i));
        }
//        session.setAttribute("uid", "201711701405");
//        session.setAttribute("username", "王七");
//        session.setAttribute("money", "200");
        model.addAttribute("list",list);
        return "fieldManagement/u_field_index";
    }

    //学生查看公告页面
    @RequestMapping("/toUserNotice")
    public String toUserNotice(Integer id,Model model){
        Notice notice = noticeService.findById(id);
        model.addAttribute("notice",notice);
        return "fieldManagement/u_notice_check";
    }

    //学生查询场地
    @RequestMapping("/findAllFieldToUser")
    public String findAllFieldToUser(Model model){


        List<Field> list = fieldService.findAll();
        List<Field> fields = new ArrayList<Field>();
        String emp = "普通";
        for (Field field : list){
            if (field.getUseType().equals(emp)){
                fields.add(field);
            }
        }
        model.addAttribute("list",fields);
        return "fieldManagement/u_field_query";
    }

    //学生模糊查询场地
    @RequestMapping("/findByAnyToUser")
    public String findByAnyToUser(Field field,Model model){
        field.setUseType("普通");
        //调用service
        System.out.println(field);
        String emp = "全部";
        if (field.getFieldType().equals(emp)){
            field.setFieldType(null);
        }
        if (field.getSize().equals(emp)){
            field.setSize(null);
        }
        System.out.println(field);
        List<Field> list = fieldService.findByAny(field);
        for (Field field1 : list){
            System.out.println(field1);
            System.out.println(field1.getFees());
        }
        model.addAttribute("list",list);
        return "fieldManagement/u_field_query";
    }

    //学生跳转预约场地页面
    @RequestMapping("/toAddMyApp")
    public String toAddMyApp(Integer id, Model model){
        System.out.println(id);
        Field field = fieldService.findById(id);
        System.out.println(field);
        model.addAttribute("thisField",field);
        return "fieldManagement/u_appointment_add";
    }

    //学生预约场地
    @RequestMapping("/addMyApp")
    public String addMyApp(Appointment appointment,HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception{
        System.out.println(appointment);
        appointmentService.saveAppointment(appointment);
        double money = (userService.findUserBystudent_workedid(appointment.getuWid()).getMoney())-(fieldService.findById(appointment.getFid()).getFees().getCashPledge());
        User user = new User();
        user.setStudent_workedid(appointment.getuWid());
        user.setMoney(money);
        userService.setMoneyByWorkedId(user);
        User user1 = userService.findUserBystudent_workedid(user.getStudent_workedid());
        session.setAttribute("user",user1);
        response.sendRedirect(request.getContextPath()+"/field/findAllFieldToUser");
        return "fieldManagement/u_field_query";
    }

    //学生查看自己预约
    @RequestMapping("/findMyAppointment")
    public String findMyAppointment(String uid,Model model){
       List<Appointment> list = appointmentService.findByUid(uid);
       List<Appointment> list1 = new ArrayList<Appointment>();
       for (Appointment app : list){
           if (app.getStatus() == 0){
               list1.add(app);
           }
       }
        model.addAttribute("myApp",list1);
        return "fieldManagement/u_my_appointment";
    }

    //学生跳转编辑自己预约页面
    @RequestMapping("/toEditMyApp")
    public String toEditMyApp(Integer id, Model model){
        System.out.println(id);
        List<Field> fields = new ArrayList<Field>();
        List<Field> list1 = new ArrayList<Field>();
        Field field = new Field();
        Appointment appointment = appointmentService.findById(id);
        field.setFieldType(appointment.getField().getFieldType());
        fields = fieldService.findByAny(field);
        String emp = "普通";
        for (Field list : fields){
            if (list.getUseType().equals(emp)){
                System.out.println(list);
                list1.add(list);
            }
        }
        System.out.println(appointment);
        model.addAttribute("tApp",appointment);
        model.addAttribute("aField",JSON.toJSON(list1));
        return "fieldManagement/u_appointment_edit";
    }

    //学生编辑自己预约
    @RequestMapping("/editMyApp")
    public String editMyApp(Appointment appointment, HttpServletRequest request, HttpServletResponse response) throws  Exception{
        System.out.println(appointment);
        appointmentService.updateAppointment(appointment);
        response.sendRedirect(request.getContextPath()+"/field/findAllFieldToUser");
        return "fieldManagement/u_field_query";
    }

    //申请上课场地时查询场地
    @RequestMapping("/findAllFieldTCourse")
    public String findAllFieldTCourse(Model model , HttpSession session){

        List<Field> list = fieldService.findAll();
        List<Field> fields = new ArrayList<Field>();
        String emp = "普通";
        for (Field field : list){
            if (field.getUseType().equals(emp)){
                fields.add(field);
            }
        }
        model.addAttribute("list",fields);
        return "fieldManagement/u_course_app_add1";
    }

    //申请上课场地时模糊查询场地
    @RequestMapping("/findByAnyFieldToCourse")
    public String findByAnyFieldToCourse(Field field,Model model){
        field.setUseType("普通");
        //调用service
        System.out.println(field);
        String emp = "全部";
        if (field.getFieldType().equals(emp)){
            field.setFieldType(null);
        }
        if (field.getSize().equals(emp)){
            field.setSize(null);
        }
        System.out.println(field);
        List<Field> list = fieldService.findByAny(field);
        for (Field field1 : list){
            System.out.println(field1);
            System.out.println(field1.getFees());
        }
        model.addAttribute("list",list);
        return "fieldManagement/u_course_app_add1";
    }

    //跳转申请上课场地页面
    @RequestMapping("/toAddCourseApp")
    public String toAddCourseApp(Integer id, Model model){
        System.out.println(id);
        Field field = fieldService.findById(id);
        System.out.println(field);
        model.addAttribute("thisField",field);
        return "fieldManagement/u_course_app_add2";
    }

    //申请上课场地
    @RequestMapping("/addCourseApp")
    public String addCourseApp(Appointment appointment,HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception{
        System.out.println(appointment);
        int startWeek = appointment.getWeek();
        for (int i =startWeek;i<=20;i++){
            appointment.setWeek(i);
            appointmentService.saveAppointment(appointment);
        }
        response.sendRedirect(request.getContextPath()+"/field/findAllFieldTCourse");
        return "fieldManagement/u_course_app_add1";
    }

    //申请赛事场地时查询场地
    @RequestMapping("/findAllFieldTMatch")
    public String findAllFieldTMatch(Model model , HttpSession session){

        List<Field> list = fieldService.findAll();
        List<Field> fields = new ArrayList<Field>();
        String emp = "普通";
        for (Field field : list){
            if (field.getUseType().equals(emp)){
                fields.add(field);
            }
        }
        model.addAttribute("list",fields);
        return "fieldManagement/u_match_app_add1";
    }

    //申请赛事场地时模糊查询场地
    @RequestMapping("/findByAnyFieldToMatch")
    public String findByAnyFieldToMatch(Field field,Model model){
        field.setUseType("普通");
        //调用service
        System.out.println(field);
        String emp = "全部";
        if (field.getFieldType().equals(emp)){
            field.setFieldType(null);
        }
        if (field.getSize().equals(emp)){
            field.setSize(null);
        }
        System.out.println(field);
        List<Field> list = fieldService.findByAny(field);
        for (Field field1 : list){
            System.out.println(field1);
            System.out.println(field1.getFees());
        }
        model.addAttribute("list",list);
        return "fieldManagement/u_match_app_add1";
    }

    //跳转申请赛事场地页面
    @RequestMapping("/toAddMatchApp")
    public String toAddMatchApp(Integer id, Model model){
        System.out.println(id);
        Field field = fieldService.findById(id);
        System.out.println(field);
        model.addAttribute("thisField",field);
        return "fieldManagement/u_match_app_add2";
    }

    //申请赛事场地
    @RequestMapping("/addMatchApp")
    public String addMatchApp(Appointment appointment,HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception{
        System.out.println(appointment);
        appointmentService.saveAppointment(appointment);
        double money = (userService.findUserBystudent_workedid(appointment.getuWid()).getMoney())-(fieldService.findById(appointment.getFid()).getFees().getCashPledge());
        User user = new User();
        user.setStudent_workedid(appointment.getuWid());
        user.setMoney(money);
        userService.setMoneyByWorkedId(user);
        User user1 = userService.findUserBystudent_workedid(user.getStudent_workedid());
        session.setAttribute("user",user1);
        response.sendRedirect(request.getContextPath()+"/field/findAllFieldTMatch");
        return "fieldManagement/u_match_app_add1";
    }

    //删除我的预约
    @RequestMapping("/deleteMyApp")
    public String deleteMyApp(Integer id,HttpServletRequest request, HttpServletResponse response) throws IOException {

        System.out.println(id);
        appointmentService.deleteAppointmentById(id);
        response.sendRedirect(request.getContextPath()+"/field/findAllFieldToUser");
        return "fieldManagement/u_field_query";
    }

    //查询我的预约记录
    @RequestMapping("/findMyAllApp")
    public String findMyAllApp(String uid,Model model){
        List<Appointment> list = appointmentService.findByUid(uid);
        model.addAttribute("myApp",list);
        return "fieldManagement/u_appointment_record";
    }

    //查询收费标准
    @RequestMapping("/feesQuery")
    public String feesQuery(Model model){
        List<Fees> list = feesService.findAll();
        model.addAttribute("list",list);
        return "fieldManagement/a_fees_query";
    }

    //跳转编辑收费标准页面
    @RequestMapping("/toEditFees")
    public String toEditFees(Integer id, Model model){
        System.out.println(id);
        Fees fees = feesService.findById(id);
        model.addAttribute("tFees",fees);
        return "fieldManagement/a_fees_edit";
    }

    //更新收费标准
    @RequestMapping("/updateFees")
    public String updateFees(Fees fees, HttpServletRequest request, HttpServletResponse response) throws  Exception{
        System.out.println(fees);
        feesService.updateFees(fees);
        response.sendRedirect(request.getContextPath()+"/field/feesQuery");
        return "fieldManagement/a_fees_query";
    }

    //跳转编辑场馆公告页面
    @RequestMapping("/toEditNotice")
    public String toEditNotice(){
        return "fieldManagement/a_edit_notice";
    }

    //发表场馆公告
    @RequestMapping("/saveNotice")
    public String saveNotice(Notice notice){
        noticeService.saveNotice(notice);
        return "fieldManagement/a_edit_notice";
    }

    //跳转场地使用页面
    @RequestMapping("/toFieldUse")
    public String toFieldUse(Integer week, Integer day,Integer hours,Model model){
        System.out.println(week);
        System.out.println(day);
        System.out.println(hours);
        String thisHours;
        if (hours>=16){
            thisHours="16:00-18:00";
        }else if(hours>=14){
            thisHours="14:00-16:00";
        }else if(hours>=10){
            thisHours="10:00-12:00";
        }else{
            thisHours="8:00-10:00";
        }
        List<Appointment> list = appointmentService.findAll();
        List<Appointment> list1 = new ArrayList<Appointment>();
        System.out.println(list);
        String temp = "上课预约";
        for (Appointment appointment : list){
            if((appointment.getWeek()==week) && (appointment.getDay()==day) && (appointment.getHours().equals(thisHours)) && (appointment.getStatus()==0) && (!appointment.getType().equals(temp))){
                list1.add(appointment);
            }
        }
        System.out.println(list1);
        model.addAttribute("list",list1);

        return "fieldManagement/a_field_use";
    }

    //查询计时
    @RequestMapping("/findTimer")
    public @ResponseBody Employ findTimer(@RequestBody Employ employ){
        System.out.println(employ.getAid());
        Employ tEmploy;
        if(employService.findByAid(employ.getAid())==null){
            tEmploy = new Employ();
            tEmploy.setAid(employ.getAid());
        }else {
            tEmploy = employService.findByAid(employ.getAid());
        }

        return tEmploy;
    }

    //开始计时
    @RequestMapping("/startTimer")
    public @ResponseBody Employ startTimer(@RequestBody Employ employ){
        System.out.println(employ.getAid());
        System.out.println(employ.getStartTime());
        employService.saveEmploy(employ);
        Employ tEmploy = employService.findByAid(employ.getAid());
        return tEmploy;
    }

    //结束计时
    @RequestMapping("/stopTimer")
    public @ResponseBody Employ stopTimer(@RequestBody Employ employ){
        System.out.println(employ.getAid());
        System.out.println(employ.getEndTime());
        employService.updateEndTime(employ);
        Employ tEmploy = employService.findByAid(employ.getAid());
        return tEmploy;
    }

    //结算
    @RequestMapping("/toFinal")
    public @ResponseBody double toFinal(@RequestBody Employ employ,Integer useHours,Integer useMinutes,HttpSession session){
        System.out.println(employ.getAid());
        System.out.println(useHours);
        System.out.println(useMinutes);
        Appointment appointment = appointmentService.findById(employ.getAid());
        Field field = fieldService.findById(appointment.getFid());
        Fees fees = feesService.findByType(field.getFieldType());
        System.out.println(fees.getFieldType());
        System.out.println(fees.getCashPledge());
        System.out.println(fees.getCost());
        double cash = fees.getCost()*useHours+fees.getCost()*((double)useMinutes/60);
        double cash1 = Double.valueOf(String.format("%.1f", cash ));
        double money= appointment.getUser().getMoney() - cash1;
        if (useHours>=1){
            money = money + fees.getCashPledge();
        }
        System.out.println(money);
        User user = new User();
        user.setStudent_workedid(appointment.getuWid());
        user.setMoney(money);
        userService.setMoneyByWorkedId(user);
        employService.deleteEmploy(employ.getAid());
        appointmentService.setStatusComById(employ.getAid());
        User user1 = userService.findUserBystudent_workedid(user.getStudent_workedid());
        session.setAttribute("user",user1);
        return cash1;
    }

}
