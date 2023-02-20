package dto;

import java.util.UUID;

public class PostResource {

    private UUID resourceId;
    private UUID postId;

    public PostResource(UUID resourceId, UUID postId) {
        this.resourceId = resourceId;
        this.postId = postId;
    }

    public UUID getResourceId() {
        return resourceId;
    }

    public void setResourceId(UUID resourceId) {
        this.resourceId = resourceId;
    }

    public UUID getPostId() {
        return postId;
    }

    public void setPostId(UUID postId) {
        this.postId = postId;
    }

    @Override
    public String toString() {
        return "PostResource(" + String.join(", ", new String[]{
            resourceId.toString(),
            postId.toString()
        }) + ")";
    }

    @Override
    public boolean equals(Object obj) {
        PostResource postResource = (PostResource) obj;
        return postResource.getPostId().equals(this.postId) && postResource.getResourceId().equals(this.resourceId);
    }

}
