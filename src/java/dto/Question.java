package dto;

import java.util.UUID;

public class Question {

    private UUID questionId;
    private UUID testId;
    private UUID resourceId;
    private String title;
    private String content;

    public Question(UUID questionId, UUID testId, UUID resourceId, String title, String content) {
        this.questionId = questionId;
        this.testId = testId;
        this.resourceId = resourceId;
        this.title = title;
        this.content = content;
    }

    public UUID getQuestionId() {
        return questionId;
    }

    public void setQuestionId(UUID questionId) {
        this.questionId = questionId;
    }

    public UUID getTestId() {
        return testId;
    }

    public void setTestId(UUID testId) {
        this.testId = testId;
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "Question(" + String.join(", ", new String[]{
            questionId.toString(),
            testId.toString(),
            resourceId.toString(),
            title,
            content
        }) + ")";
    }

    @Override
    public boolean equals(Object obj) {
        Question question = (Question) obj;
        return question.questionId.equals(this.questionId);
    }

}
