package dto;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.UUID;

public class Test {

    private UUID testId;
    private UUID classId;
    private UUID resourceId;
    private String title;
    private String description;
    private Timestamp startAt;
    private Timestamp endAt;
    private Double duration;
    private boolean allowReview;
    private Timestamp createTime;
    public ArrayList<Question> questions;
    public Resource resource;

    public Test(UUID testId, UUID classId, UUID resourceId, String title, String description, Timestamp startAt, Timestamp endAt, Double duration, boolean allowReview, Timestamp createTime) {
        this.testId = testId;
        this.classId = classId;
        this.resourceId = resourceId;
        this.title = title;
        this.description = description;
        this.startAt = startAt;
        this.endAt = endAt;
        this.duration = duration;
        this.allowReview = allowReview;
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

    public UUID getResourceId() {
        return resourceId;
    }

    public void setResourceId(UUID resourceId) {
        this.resourceId = resourceId;
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

    public Double getDuration() {
        return duration;
    }

    public void setDuration(Double duration) {
        this.duration = duration;
    }

    public boolean isAllowReview() {
        return allowReview;
    }

    public void setAllowReview(boolean allowReview) {
        this.allowReview = allowReview;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public ArrayList<Question> getQuestions() {
        return questions;
    }

    public void setQuestions(ArrayList<Question> questions) {
        this.questions = questions;
    }

    @Override
    public String toString() {
        return "Test(" + String.join(", ", new String[]{
            String.valueOf(testId),
            String.valueOf(classId),
            String.valueOf(resourceId),
            title,
            description,
            String.valueOf(startAt),
            String.valueOf(endAt),
            String.valueOf(duration),
            String.valueOf(allowReview),
            String.valueOf(createTime)
        }) + ")";
    }

    @Override
    public boolean equals(Object obj) {
        Test test = (Test) obj;
        return test.testId.equals(this.testId);
    }

}
