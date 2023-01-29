package dao;

import dto.Resource;
import helpers.Util;
import java.sql.ResultSet;

public class ResourceDAO extends AbstractDAO<Resource> {

    @Override
    protected Resource propMapping(ResultSet rs) throws Exception {
        return new Resource(
                Util.ByteArrayToUUID(rs.getBytes("resource_id")),
                rs.getString("url"),
                rs.getString("thumbnail"),
                rs.getString("mime_type")
        );
    }
    
}
