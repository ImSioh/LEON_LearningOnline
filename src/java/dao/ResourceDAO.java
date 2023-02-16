package dao;

import dto.Resource;
import helpers.Util;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.UUID;

public class ResourceDAO extends AbstractDAO<Resource> {
    
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
    
    public ArrayList<Resource> getResources(UUID accountId) throws Exception {
        String query = "SELECT resource_id, account_id, url, thumbnail, mime_type FROM resource r WHERE r.account_id = ?";
        return selectMany(query, Util.UUIDToByteArray(accountId));
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
