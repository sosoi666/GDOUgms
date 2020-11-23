package tianti.domain.fieldmanagement;

import java.io.Serializable;

public class Fees implements Serializable {
    private Integer id;
    private String fieldType;
    private double cashPledge;
    private double cost;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFieldType() {
        return fieldType;
    }

    public void setFieldType(String fieldType) {
        this.fieldType = fieldType;
    }

    public double getCashPledge() {
        return cashPledge;
    }

    public void setCashPledge(double cashPledge) {
        this.cashPledge = cashPledge;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    @Override
    public String toString() {
        return "Fees{" +
                "id=" + id +
                ", fieldType='" + fieldType + '\'' +
                ", cashPledge=" + cashPledge +
                ", cost=" + cost +
                '}';
    }
}
