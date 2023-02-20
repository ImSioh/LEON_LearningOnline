package dto;

import com.google.gson.annotations.Expose;
import java.sql.Timestamp;
import java.util.UUID;

public class Comment {

    @Expose
    private UUID commentId;
    private UUID accountId;
    @Expose
    private UUID postId;
    private UUID resourceId;
    @Expose
    private String content;
    @Expose
    private Timestamp createTime;
    @Expose
    public Account account;
    @Expose
    public Resource resource;

    public Comment(UUID commentId, UUID accountId, UUID postId, UUID resourceId, String content, Timestamp createTime) {
        this.commentId = commentId;
        this.accountId = accountId;
        this.postId = postId;
        this.resourceId = resourceId;
        this.content = content;
        this.createTime = createTime;
    }

    public UUID getCommentId() {
        return commentId;
    }

    public void setCommentId(UUID commentId) {
        this.commentId = commentId;
    }

    public UUID getAccountId() {
        return accountId;
    }

    public void setAccountId(UUID accountId) {
        this.accountId = accountId;
    }

    public UUID getPostId() {
        return postId;
    }

    public void setPostId(UUID postId) {
        this.postId = postId;
    }

    public UUID getResourceId() {
        return resourceId;
    }

    public void setResourceId(UUID resourceId) {
        this.resourceId = resourceId;
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
        return "Comment(" + String.join(", ", new String[]{
            commentId.toString(),
            accountId.toString(),
            postId.toString(),
            resourceId == null ? null : resourceId.toString(),
            content,
            createTime.toString()
        }) + ")";
    }

    @Override
    public boolean equals(Object obj) {
        Comment comment = (Comment) obj;
        return comment.commentId.equals(this.commentId);
    }

}
