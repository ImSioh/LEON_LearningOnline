package dto;

import java.util.UUID;

public class Notification {

    private UUID notificationId;
    private UUID accountId;
    private String title;
    private String redirectUrl;
    private String content;

    public Notification(UUID notificationId, UUID accountId, String title, String redirectUrl, String content) {
        this.notificationId = notificationId;
        this.accountId = accountId;
        this.title = title;
        this.redirectUrl = redirectUrl;
        this.content = content;
    }

    public UUID getNotificationId() {
        return notificationId;
    }

    public void setNotificationId(UUID notificationId) {
        this.notificationId = notificationId;
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

    public String getRedirectUrl() {
        return redirectUrl;
    }

    public void setRedirectUrl(String redirectUrl) {
        this.redirectUrl = redirectUrl;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "Notification(" + String.join(", ", new String[]{
            notificationId.toString(),
            accountId.toString(),
            title,
            redirectUrl,
            content
        }) + ")";
    }

    @Override
    public boolean equals(Object obj) {
        Notification notification = (Notification) obj;
        return notification.notificationId.equals(this.notificationId);
    }

}
