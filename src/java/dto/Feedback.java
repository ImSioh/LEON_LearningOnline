package dto;

import java.util.UUID;

public class Feedback {

    private UUID feedbackId;
    private UUID accountId;
    private String content;

    public Feedback(UUID feedbackId, UUID accountId, String content) {
        this.feedbackId = feedbackId;
        this.accountId = accountId;
        this.content = content;
    }

    public UUID getFeedbackId() {
        return feedbackId;
    }

    public void setFeedbackId(UUID feedbackId) {
        this.feedbackId = feedbackId;
    }

    public UUID getAccountId() {
        return accountId;
    }

    public void setAccountId(UUID accountId) {
        this.accountId = accountId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "Feedback(" + String.join(", ", new String[]{
            feedbackId.toString(),
            accountId.toString(),
            content
        }) + ")";
    }

    @Override
    public boolean equals(Object obj) {
        Feedback feedback = (Feedback) obj;
        return feedback.accountId.equals(this.feedbackId);
    }

}
