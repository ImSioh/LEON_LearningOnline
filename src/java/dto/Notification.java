package dto;

import com.google.gson.annotations.Expose;
import java.sql.Timestamp;
import java.util.UUID;

public class Notification {

    private UUID notificationId;
    @Expose
    private UUID accountId;
    @Expose
    private UUID classId;
    @Expose
    private UUID target;
    @Expose
    private int type;
    @Expose
    private String title;
    @Expose
    private String redirectUrl;
    @Expose
    private String content;
    @Expose
    private Timestamp createTime;

    public Notification(UUID notificationId, UUID accountId, UUID classId, UUID target, int type, String title, String redirectUrl, String content, Timestamp createTime) {
        this.notificationId = notificationId;
        this.accountId = accountId;
        this.classId = classId;
        this.target = target;
        this.type = type;
        this.title = title;
        this.redirectUrl = redirectUrl;
        this.content = content;
        this.createTime = createTime;
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

    public UUID getClassId() {
        return classId;
    }

    public void setClassId(UUID classId) {
        this.classId = classId;
    }

    public UUID getTarget() {
        return target;
    }

    public void setTarget(UUID target) {
        this.target = target;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
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

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "Notification(" + String.join(", ", new String[]{
            notificationId.toString(),
            accountId.toString(),
            classId.toString(),
            target.toString(),
            String.valueOf(target),
            title,
            redirectUrl,
            content,
            createTime.toString()
        }) + ")";
    }

    @Override
    public boolean equals(Object obj) {
        Notification notification = (Notification) obj;
        return notification.notificationId.equals(this.notificationId);
    }

}
