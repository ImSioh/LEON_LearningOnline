package dto;

import java.sql.Timestamp;
import java.util.UUID;

public class ClassObject {

    private UUID classId;
    private UUID accountId;
    private String name;
    private String code;
    private boolean enrollApprove;
    private String classPicture;
    private boolean hidden;
    private Timestamp createTime;

    public ClassObject(UUID classId, UUID accountId, String name, String code, boolean enrollApprove, String classPicture, boolean hidden, Timestamp createTime) {
        this.classId = classId;
        this.accountId = accountId;
        this.name = name;
        this.code = code;
        this.enrollApprove = enrollApprove;
        this.classPicture = classPicture;
        this.hidden = hidden;
        this.createTime = createTime;
    }

    public UUID getClassId() {
        return classId;
    }

    public void setClassId(UUID classId) {
        this.classId = classId;
    }

    public UUID getAccountId() {
        return accountId;
    }

    public void setAccountId(UUID accountId) {
        this.accountId = accountId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public boolean isEnrollApprove() {
        return enrollApprove;
    }

    public void setEnrollApprove(boolean enrollApprove) {
        this.enrollApprove = enrollApprove;
    }

    public String getClassPicture() {
        return classPicture;
    }

    public void setClassPicture(String classPicture) {
        this.classPicture = classPicture;
    }

    public boolean isHidden() {
        return hidden;
    }

    public void setHidden(boolean hidden) {
        this.hidden = hidden;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "Class(" + String.join(", ", new String[]{
            classId.toString(),
            accountId.toString(),
            name,
            code,
            String.valueOf(enrollApprove),
            classPicture,
            String.valueOf(hidden),
            createTime.toString()
        }) + ")";
    }

    @Override
    public boolean equals(Object obj) {
        ClassObject classObject = (ClassObject) obj;
        return classObject.classId.equals(this.classId);
    }

}
