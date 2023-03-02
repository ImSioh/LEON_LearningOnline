package dto;

import java.util.UUID;

public class Answer {

    private UUID answerId;
    private UUID questionId;
    private UUID resourceId;
    private int answerOrder;
    private String content;
    private boolean correct;

    public Answer(UUID answerId, UUID questionId, UUID resourceId, int answerOrder, String content, boolean correct) {
        this.answerId = answerId;
        this.questionId = questionId;
        this.resourceId = resourceId;
        this.answerOrder = answerOrder;
        this.content = content;
        this.correct = correct;
    }

    public UUID getAnswerId() {
        return answerId;
    }

    public void setAnswerId(UUID answerId) {
        this.answerId = answerId;
    }

    public UUID getQuestionId() {
        return questionId;
    }

    public void setQuestionId(UUID questionId) {
        this.questionId = questionId;
    }

    public UUID getResourceId() {
        return resourceId;
    }

    public void setResourceId(UUID resourceId) {
        this.resourceId = resourceId;
    }

    public int getAnswerOrder() {
        return answerOrder;
    }

    public void setAnswerOrder(int answerOrder) {
        this.answerOrder = answerOrder;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public boolean isCorrect() {
        return correct;
    }

    public void setCorrect(boolean correct) {
        this.correct = correct;
    }

    @Override
    public String toString() {
        return "Answer(" + String.join(", ", new String[]{
            String.valueOf(answerId),
            String.valueOf(questionId),
            String.valueOf(resourceId),
            String.valueOf(answerOrder),
            content,
            String.valueOf(correct)
        }) + ")";
    }

    @Override
    public boolean equals(Object obj) {
        Answer answer = (Answer) obj;
        return answer.answerId.equals(this.answerId);
    }

}
