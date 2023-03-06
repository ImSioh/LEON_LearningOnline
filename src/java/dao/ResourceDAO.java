package dao;

import dto.Resource;
import helpers.Util;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.UUID;

public class ResourceDAO extends AbstractDAO<Resource> {
    
    public int deleteResource(UUID resourceId) throws Exception {
        String query = "UPDATE resource r SET r.deleted = TRUE WHERE r.resource_id = ?";
        return update(query, Util.UUIDToByteArray(resourceId));
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
        String query = "SELECT resource_id, account_id, url, thumbnail, mime_type, deleted FROM resource r WHERE r.account_id = ? AND r.deleted = FALSE";
        return selectMany(query, Util.UUIDToByteArray(accountId));
    }
    
    public ArrayList<Resource> getResourcesByPost(UUID postId) throws Exception {
        String query = "SELECT r.* FROM post_resource pr LEFT JOIN resource r ON pr.resource_id = r.resource_id WHERE pr.post_id = ?";
        return selectMany(query, Util.UUIDToByteArray(postId));
    }
    
    public ArrayList<Resource> getResourcesByTest(UUID testId) throws Exception {
        String query = "SELECT r.* FROM resource r WHERE r.resource_id IN (SELECT t.resource_id FROM test t WHERE t.test_id = ? AND t.resource_id IS NOT NULL UNION SELECT q.resource_id FROM question q WHERE q.resource_id IS NOT NULL UNION SELECT a.resource_id FROM answer a WHERE a.resource_id IS NOT NULL)";
        return selectMany(query, Util.UUIDToByteArray(testId));
    }

    public Resource getResourcesById(UUID resourceId) throws Exception {
        String query = "SELECT resource_id, account_id, url, thumbnail, mime_type, deleted FROM resource r WHERE r.resource_id = ?";
        return selectOne(query, Util.UUIDToByteArray(resourceId));
    }

    @Override
    protected Resource propMapping(ResultSet rs) throws Exception {
        return new Resource(
                Util.ByteArrayToUUID(rs.getBytes("resource_id")),
                Util.ByteArrayToUUID(rs.getBytes("account_id")),
                rs.getString("url"),
                rs.getString("thumbnail"),
                rs.getString("mime_type"),
                rs.getBoolean("deleted")
        );
    }
    
}
