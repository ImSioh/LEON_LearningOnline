package dto;

import java.util.ArrayList;
import java.util.UUID;

public class Question {

    private UUID questionId;
    private UUID testId;
    private UUID resourceId;
    private int questionOrder;
    private String content;
    public ArrayList<Answer> answers;
    public Resource resource;

    public Question(UUID questionId, UUID testId, UUID resourceId, int questionOrder, String content) {
        this.questionId = questionId;
        this.testId = testId;
        this.resourceId = resourceId;
        this.questionOrder = questionOrder;
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

    public int getQuestionOrder() {
        return questionOrder;
    }

    public void setQuestionOrder(int questionOrder) {
        this.questionOrder = questionOrder;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public ArrayList<Answer> getAnswers() {
        return answers;
    }

    public void setAnswers(ArrayList<Answer> answers) {
        this.answers = answers;
    }

    @Override
    public String toString() {
        return "Question(" + String.join(", ", new String[]{
            String.valueOf(questionId),
            String.valueOf(testId),
            String.valueOf(resourceId),
            String.valueOf(questionOrder),
            content
        }) + ")\n";
    }

    @Override
    public boolean equals(Object obj) {
        Question question = (Question) obj;
        return question.questionId.equals(this.questionId);
    }

}
