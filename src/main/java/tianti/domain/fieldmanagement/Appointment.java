package tianti.domain.fieldmanagement;

import tianti.domain.user.User;

import java.io.Serializable;

public class Appointment implements Serializable {
    private Integer id;
    private Integer fid;
    private String uWid;
    private String type;
    private Integer week;
    private Integer day;
    private String hours;
    private String remark;
    private Integer status;

    //多对一（mybatis中为一对一）的映射，一个预约只属于一个场地，一个预约只属于一个用户
    private Field field;
    private User user;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getFid() {
        return fid;
    }

    public void setFid(Integer fid) {
        this.fid = fid;
    }

    public String getuWid() {
        return uWid;
    }

    public void setuWid(String uWid) {
        this.uWid = uWid;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getWeek() {
        return week;
    }

    public void setWeek(Integer week) {
        this.week = week;
    }

    public Integer getDay() {
        return day;
    }

    public void setDay(Integer day) {
        this.day = day;
    }

    public String getHours() {
        return hours;
    }

    public void setHours(String hours) {
        this.hours = hours;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Field getField() {
        return field;
    }

    public void setField(Field field) {
        this.field = field;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Appointment{" +
                "id=" + id +
                ", fid=" + fid +
                ", uWid='" + uWid + '\'' +
                ", type='" + type + '\'' +
                ", week=" + week +
                ", day=" + day +
                ", hours='" + hours + '\'' +
                ", remark='" + remark + '\'' +
                ", status=" + status +
                '}';
    }
}
