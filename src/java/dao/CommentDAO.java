package dao;

import dto.Comment;
import java.sql.ResultSet;
import java.util.UUID;

public class CommentDAO extends AbstractDAO<Comment>{

    @Override
    protected Comment propMapping(ResultSet rs) throws Exception {
        return new Comment(
                UUID.nameUUIDFromBytes(rs.getBytes("comment_id")),
                UUID.nameUUIDFromBytes(rs.getBytes("account_id")),
                UUID.nameUUIDFromBytes(rs.getBytes("post_id")),
                UUID.nameUUIDFromBytes(rs.getBytes("resource_id")),
                rs.getNString("content"),
                rs.getTimestamp("create_time")
        );
    }
    
}
