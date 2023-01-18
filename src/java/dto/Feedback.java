package dto;

import java.util.UUID;

public class Feedback {

    private UUID feedbackId;
    private UUID accountId;
    private String title;
    private String content;
    private String response;

    public Feedback(UUID feedbackId, UUID accountId, String title, String content, String response) {
        this.feedbackId = feedbackId;
        this.accountId = accountId;
        this.title = title;
        this.content = content;
        this.response = response;
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

    public String getResponse() {
        return response;
    }

    public void setResponse(String response) {
        this.response = response;
    }

    @Override
    public String toString() {
        return "Feedback(" + String.join(", ", new String[]{
            feedbackId.toString(),
            accountId.toString(),
            title,
            content,
            response
        }) + ")";
    }

    @Override
    public boolean equals(Object obj) {
        Feedback feedback = (Feedback) obj;
        return feedback.accountId.equals(this.feedbackId);
    }

}
