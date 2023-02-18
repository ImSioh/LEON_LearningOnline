package dao;

import dto.Resource;
import helpers.Util;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.UUID;

public class ResourceDAO extends AbstractDAO<Resource> {
    
    public int deleteResource(UUID resourceId) throws Exception {
        String query = "DELETE FROM resource WHERE resource_id = ? AND (SELECT COUNT(pr.resource_id) FROM post_resource pr WHERE pr.resource_id = ?) = 0";
        byte[] id = Util.UUIDToByteArray(resourceId);
        return update(query, id, id);
    }
    
    public int setResource(Resource resource) throws Exception {
        String query = "INSERT INTO resource (resource_id, account_id, url, thumbnail, mime_type) VALUES (?, ?, ?, ?, ?);";
        return update(
                query,
                Util.UUIDToByteArray(resource.getResourceId()),
                Util.UUIDToByteArray(resource.getAccountId()),
                resource.getUrl(),
                resource.getThumbnail(),
                resource.getMimeType()
        );
    }
    
    public ArrayList<Resource> getResourcesByAccount(UUID accountId) throws Exception {
        String query = "SELECT resource_id, account_id, url, thumbnail, mime_type FROM resource r WHERE r.account_id = ?";
        return selectMany(query, Util.UUIDToByteArray(accountId));
    }
    
    public ArrayList<Resource> getResourcesByPost(UUID postId) throws Exception {
        String query = "SELECT r.* FROM post_resource pr LEFT JOIN resource r ON pr.resource_id = r.resource_id WHERE pr.post_id = ?";
        return selectMany(query, Util.UUIDToByteArray(postId));
    }

    @Override
    protected Resource propMapping(ResultSet rs) throws Exception {
        return new Resource(
                Util.ByteArrayToUUID(rs.getBytes("resource_id")),
                Util.ByteArrayToUUID(rs.getBytes("account_id")),
                rs.getString("url"),
                rs.getString("thumbnail"),
                rs.getString("mime_type")
        );
    }
    
}
