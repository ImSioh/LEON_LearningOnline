package dto;

import java.sql.Timestamp;
import java.util.UUID;

public class Enrollment {

    private UUID accountId;
    private UUID classId;
    private boolean accepted;
    private Timestamp enrollTime;

    public Enrollment() {
    }

    public Enrollment(UUID accountId, UUID classId, boolean accepted, Timestamp enrollTime) {
        this.accountId = accountId;
        this.classId = classId;
        this.accepted = accepted;
        this.enrollTime = enrollTime;
    }

    public UUID getAccountId() {
        return accountId;
    }

    public void setAccountId(UUID accountId) {
        this.accountId = accountId;
    }

    public UUID getClassId() {
        return classId;
    }

    public void setClassId(UUID classId) {
        this.classId = classId;
    }

    public boolean isAccepted() {
        return accepted;
    }

    public void setAccepted(boolean accepted) {
        this.accepted = accepted;
    }

    public Timestamp getEnrollTime() {
        return enrollTime;
    }

    public void setEnrollTime(Timestamp enrollTime) {
        this.enrollTime = enrollTime;
    }

    @Override
    public String toString() {
        return "Enrollment(" + String.join(", ", new String[]{
            accountId.toString(),
            classId.toString(),
            String.valueOf(accepted),
            enrollTime.toString()
        }) + ")";
    }

    @Override
    public boolean equals(Object obj) {
        Enrollment enrollment = (Enrollment) obj;
        return enrollment.accountId.equals(this.accountId) && enrollment.classId.equals(this.classId);
    }

}
