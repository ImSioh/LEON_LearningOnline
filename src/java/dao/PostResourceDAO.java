package dao;

import dto.PostResource;
import helpers.Util;
import java.sql.ResultSet;
import java.util.UUID;

public class PostResourceDAO extends AbstractDAO<PostResource> {
    
    public int deletePostResourceByPost(UUID postId) throws Exception {
        String query = "DELETE FROM post_resource WHERE post_id = ?";
        return update(query, Util.UUIDToByteArray(postId));
    }

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
