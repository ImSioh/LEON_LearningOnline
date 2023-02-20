package dao;

import dto.PostResource;
import helpers.Util;
import java.sql.ResultSet;

public class PostResourceDAO extends AbstractDAO<PostResource> {

    public int insertPostResouce(PostResource postResource) throws Exception {
        String query = "INSERT INTO post_resource (post_id, resource_id) VALUES (?, ?)";
        return update(
                query,
                Util.UUIDToByteArray(postResource.getPostId()),
                Util.UUIDToByteArray(postResource.getResourceId())
        );
    }

    @Override
    protected PostResource propMapping(ResultSet rs) throws Exception {
        return new PostResource(
                Util.ByteArrayToUUID(rs.getBytes("resource_id")),
                Util.ByteArrayToUUID(rs.getBytes("post_id"))
        );
    }

}
