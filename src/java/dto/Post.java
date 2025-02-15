package dto;

import com.google.gson.annotations.Expose;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.UUID;

public class Post {

    @Expose
    private UUID postId;
    private UUID accountId;
    private UUID classId;
    @Expose
    private boolean pin;
    @Expose
    private String content;
    @Expose
    private Timestamp createTime;
    @Expose
    public ArrayList<Resource> resources = new ArrayList<>();
    @Expose
    public Account account = null;
    @Expose
    public ArrayList<Comment> comments = new ArrayList<>();
    @Expose
    public int commentCount = 0;

    public Post(UUID postId, UUID accountId, UUID classId, boolean pin, String content, Timestamp createTime) {
        this.postId = postId;
        this.accountId = accountId;
        this.classId = classId;
        this.pin = pin;
        this.content = content;
        this.createTime = createTime;
    }

    public UUID getPostId() {
        return postId;
    }

    public void setPostId(UUID postId) {
        this.postId = postId;
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

    public boolean isPin() {
        return pin;
    }

    public void setPin(boolean pin) {
        this.pin = pin;
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
        return "Post(" + String.join(", ", new String[]{
            postId.toString(),
            accountId.toString(),
            classId.toString(),
            String.valueOf(pin),
            content,
            createTime.toString()
        }) + ")";
    }

    @Override
    public boolean equals(Object obj) {
        Post post = (Post) obj;
        return post.postId.equals(this.postId);
    }

}
