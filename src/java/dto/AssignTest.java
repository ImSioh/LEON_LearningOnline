package dto;

import java.sql.Time;
import java.sql.Timestamp;
import java.util.UUID;

public class AssignTest {

    private UUID assignTestId;
    private UUID testId;
    private UUID accountId;
    private UUID classId;
    private Time duration;
    private Timestamp startAt;
    private Timestamp endAt;
    private Timestamp createTime;

    public AssignTest(UUID assignTestId, UUID testId, UUID accountId, UUID classId, Time duration, Timestamp startAt, Timestamp endAt, Timestamp createTime) {
        this.assignTestId = assignTestId;
        this.testId = testId;
        this.accountId = accountId;
        this.classId = classId;
        this.duration = duration;
        this.startAt = startAt;
        this.endAt = endAt;
        this.createTime = createTime;
    }

    public UUID getAssignTestId() {
        return assignTestId;
    }

    public void setAssignTestId(UUID assignTestId) {
        this.assignTestId = assignTestId;
    }

    public UUID getTestId() {
        return testId;
    }

    public void setTestId(UUID testId) {
        this.testId = testId;
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

    public Time getDuration() {
        return duration;
    }

    public void setDuration(Time duration) {
        this.duration = duration;
    }

    public Timestamp getStartAt() {
        return startAt;
    }

    public void setStartAt(Timestamp startAt) {
        this.startAt = startAt;
    }

    public Timestamp getEndAt() {
        return endAt;
    }

    public void setEndAt(Timestamp endAt) {
        this.endAt = endAt;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "AssignTest(" + String.join(", ", new String[]{
            assignTestId.toString(),
            testId.toString(),
            accountId.toString(),
            classId.toString(),
            duration.toString(),
            startAt.toString(),
            endAt.toString(),
            createTime.toString()
        }) + ")";
    }

    @Override
    public boolean equals(Object obj) {
        AssignTest assignTest = (AssignTest) obj;
        return assignTest.assignTestId.equals(this.assignTestId);
    }

}
