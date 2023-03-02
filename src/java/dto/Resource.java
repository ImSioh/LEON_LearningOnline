package dto;

import com.google.gson.annotations.Expose;
import java.util.UUID;

public class Resource {

    @Expose
    private UUID resourceId;
    private UUID accountId;
    @Expose
    private String url;
    @Expose
    private String thumbnail;
    @Expose
    private String mimeType;
    private boolean deleted;

    public Resource(UUID resourceId, UUID accountId, String url, String thumbnail, String mimeType, boolean deleted) {
        this.resourceId = resourceId;
        this.accountId = accountId;
        this.url = url;
        this.thumbnail = thumbnail;
        this.mimeType = mimeType;
        this.deleted = deleted;
    }

    public UUID getResourceId() {
        return resourceId;
    }

    public void setResourceId(UUID resourceId) {
        this.resourceId = resourceId;
    }

    public UUID getAccountId() {
        return accountId;
    }

    public void setAccountId(UUID accountId) {
        this.accountId = accountId;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public String getMimeType() {
        return mimeType;
    }

    public void setMimeType(String mimeType) {
        this.mimeType = mimeType;
    }

    public boolean isDeleted() {
        return deleted;
    }

    public void setDeleted(boolean deleted) {
        this.deleted = deleted;
    }

    @Override
    public String toString() {
        return "Resource(" + String.join(", ", new String[]{
            String.valueOf(resourceId),
            String.valueOf(accountId),
            url,
            thumbnail,
            mimeType,
            String.valueOf(deleted)
        }) + ")";
    }

    @Override
    public boolean equals(Object obj) {
        Resource resource = (Resource) obj;
        return resource.resourceId.equals(this.resourceId);
    }

}
