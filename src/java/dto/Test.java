package dto;

import java.sql.Time;
import java.sql.Timestamp;
import java.util.UUID;

public class Test {

    private UUID testId;
    private UUID classId;
    private String title;
    private String description;
    private Timestamp startAt;
    private Timestamp endAt;
    private Time duration;
    private Timestamp createTime;

    public Test(UUID testId, UUID classId, String title, String description, Timestamp startAt, Timestamp endAt, Time duration, Timestamp createTime) {
        this.testId = testId;
        this.classId = classId;
        this.title = title;
        this.description = description;
        this.startAt = startAt;
        this.endAt = endAt;
        this.duration = duration;
        this.createTime = createTime;
    }

    public UUID getTestId() {
        return testId;
    }

    public void setTestId(UUID testId) {
        this.testId = testId;
    }

    public UUID getClassId() {
        return classId;
    }

    public void setClassId(UUID classId) {
        this.classId = classId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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

    public Time getDuration() {
        return duration;
    }

    public void setDuration(Time duration) {
        this.duration = duration;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "Test(" + String.join(", ", new String[]{
            testId.toString(),
            classId.toString(),
            title,
            description,
            startAt.toString(),
            endAt.toString(),
            duration.toString(),
            createTime.toString()
        }) + ")";
    }

    @Override
    public boolean equals(Object obj) {
        Test test = (Test) obj;
        return test.testId.equals(this.testId);
    }

}
