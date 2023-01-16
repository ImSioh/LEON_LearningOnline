package dao;

import dto.Resource;
import java.sql.ResultSet;
import java.util.UUID;

public class ResourceDAO extends AbstractDAO<Resource> {

    @Override
    protected Resource propMapping(ResultSet rs) throws Exception {
        return new Resource(
                UUID.nameUUIDFromBytes(rs.getBytes("resource_id")),
                rs.getString("url"),
                rs.getString("thumbnail"),
                rs.getString("mime_type")
        );
    }
    
}
