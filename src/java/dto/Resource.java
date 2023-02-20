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

    public Resource(UUID resourceId, UUID accountId, String url, String thumbnail, String mimeType) {
        this.resourceId = resourceId;
        this.accountId = accountId;
        this.url = url;
        this.thumbnail = thumbnail;
        this.mimeType = mimeType;
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

    @Override
    public String toString() {
        return "Resource(" + String.join(", ", new String[]{
            resourceId.toString(),
            accountId.toString(),
            url,
            thumbnail,
            mimeType
        }) + ")";
    }

    @Override
    public boolean equals(Object obj) {
        Resource resource = (Resource) obj;
        return resource.resourceId.equals(this.resourceId);
    }

}
