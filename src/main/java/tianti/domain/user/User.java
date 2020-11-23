package tianti.domain.user;

import java.io.Serializable;

public class User implements Serializable {
    private Integer id;
    private String student_workedid;
    private String password;
    private String name;
    private String mobilephone;
    private String email;
    private Integer roleid;
    private Role role;
    private Double money;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStudent_workedid() {
        return student_workedid;
    }

    public void setStudent_workedid(String student_workedid) {
        this.student_workedid = student_workedid;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMobilephone() {
        return mobilephone;
    }

    public void setMobilephone(String mobilephone) {
        this.mobilephone = mobilephone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getRoleid() {
        return roleid;
    }

    public void setRoleid(Integer roleid) {
        this.roleid = roleid;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", student_workedid='" + student_workedid + '\'' +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", mobilephone='" + mobilephone + '\'' +
                ", email='" + email + '\'' +
                ", roleid=" + roleid +
                ", role=" + role +
                ", money=" + money +
                '}';
    }
}
