package dto;

import java.sql.Timestamp;
import java.util.UUID;

public class Feedback {

    private UUID feedbackId;
    private UUID accountId;
    private String title;
    private String content;
    private String response;
    private Timestamp createTime;

    public Feedback(UUID feedbackId, UUID accountId, String title, String content, String response, Timestamp createTime) {
        this.feedbackId = feedbackId;
        this.accountId = accountId;
        this.title = title;
        this.content = content;
        this.response = response;
        this.createTime = createTime;
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

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }
    
    @Override
    public String toString() {
        return "Feedback(" + String.join(", ", new String[]{
            feedbackId.toString(),
            accountId.toString(),
            title,
            content,
            response,
            createTime.toString()
        }) + ")";
    }

    @Override
    public boolean equals(Object obj) {
        Feedback feedback = (Feedback) obj;
        return feedback.accountId.equals(this.feedbackId);
    }

}
