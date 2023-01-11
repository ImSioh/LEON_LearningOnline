package dto;

import java.util.UUID;

public class Resource {

    private UUID resourceId;
    private String url;
    private String thumbnail;
    private String mimeType;

    public Resource(UUID resourceId, String url, String thumbnail, String mimeType) {
        this.resourceId = resourceId;
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
