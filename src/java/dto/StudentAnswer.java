package dto;

import java.util.UUID;

public class StudentAnswer {

    public UUID accountId;
    public UUID questionId;
    public UUID answerId;

    public StudentAnswer() {
    }

    public StudentAnswer(UUID accountId, UUID questionId, UUID answerId) {
        this.accountId = accountId;
        this.questionId = questionId;
        this.answerId = answerId;
    }

    public UUID getAccountId() {
        return accountId;
    }

    public void setAccountId(UUID accountId) {
        this.accountId = accountId;
    }

    public UUID getQuestionId() {
        return questionId;
    }

    public void setQuestionId(UUID questionId) {
        this.questionId = questionId;
    }

    public UUID getAnswerId() {
        return answerId;
    }

    public void setAnswerId(UUID answerId) {
        this.answerId = answerId;
    }

    @Override
    public String toString() {
        return "StudentAnswer(" + String.join(", ", new String[]{
            accountId.toString(),
            questionId.toString(),
            answerId.toString()
        }) + ") \n";
    }

}
