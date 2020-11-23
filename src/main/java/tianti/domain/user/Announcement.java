package tianti.domain.user;

import java.io.Serializable;

public class Announcement implements Serializable {
    private Integer id;
    private String student_workedid;
    private String name;
    private String content;

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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "Announcement{" +
                "id=" + id +
                ", student_workedid='" + student_workedid + '\'' +
                ", name='" + name + '\'' +
                ", content='" + content + '\'' +
                '}';
    }
}
