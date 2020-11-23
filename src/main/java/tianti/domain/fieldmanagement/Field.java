package tianti.domain.fieldmanagement;

import java.io.Serializable;
import java.util.List;

public class Field implements Serializable {
    private Integer id;
    private String fieldName;
    private String fieldType;
    private String useType;
    private String size;
    private Integer beginDay;
    private Integer endDay;
    private String remark;

    //多对一（mybatis中为一对一）的映射，一个场地只属于一个收费标准
    private Fees fees;

    //一对多
    private List<Appointment> appointments;

    public List<Appointment> getAppointments() {
        return appointments;
    }

    public void setAppointments(List<Appointment> appointments) {
        this.appointments = appointments;
    }

    public Fees getFees() {
        return fees;
    }

    public void setFees(Fees fees) {
        this.fees = fees;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFieldName() {
        return fieldName;
    }

    public void setFieldName(String fieldName) {
        this.fieldName = fieldName;
    }

    public String getFieldType() {
        return fieldType;
    }

    public void setFieldType(String fieldType) {
        this.fieldType = fieldType;
    }

    public String getUseType() {
        return useType;
    }

    public void setUseType(String useType) {
        this.useType = useType;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public Integer getBeginDay() {
        return beginDay;
    }

    public void setBeginDay(Integer beginDay) {
        this.beginDay = beginDay;
    }

    public Integer getEndDay() {
        return endDay;
    }

    public void setEndDay(Integer endDay) {
        this.endDay = endDay;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public String toString() {
        return "Field{" +
                "id=" + id +
                ", fieldName='" + fieldName + '\'' +
                ", fieldType='" + fieldType + '\'' +
                ", useType='" + useType + '\'' +
                ", size='" + size + '\'' +
                ", beginDay=" + beginDay +
                ", endDay=" + endDay +
                ", remark='" + remark + '\'' +
                '}';
    }
}
