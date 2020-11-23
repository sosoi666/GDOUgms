package tianti.domain.user;

import java.io.Serializable;

public class Role implements Serializable {
    private Integer id;
    private String roletype;
    private String reposibility;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRoletype() {
        return roletype;
    }

    public void setRoletype(String roletype) {
        this.roletype = roletype;
    }

    public String getReposibility() {
        return reposibility;
    }

    public void setReposibility(String reposibility) {
        this.reposibility = reposibility;
    }

    @Override
    public String toString() {
        return "Role{" +
                "id=" + id +
                ", roletype='" + roletype + '\'' +
                ", reposibility='" + reposibility + '\'' +
                '}';
    }
}
