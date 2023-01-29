package dao;

import dto.Comment;
import helpers.Util;
import java.sql.ResultSet;
import java.util.UUID;

public class CommentDAO extends AbstractDAO<Comment>{

    @Override
    protected Comment propMapping(ResultSet rs) throws Exception {
        return new Comment(
                Util.ByteArrayToUUID(rs.getBytes("comment_id")),
                Util.ByteArrayToUUID(rs.getBytes("account_id")),
                Util.ByteArrayToUUID(rs.getBytes("post_id")),
                Util.ByteArrayToUUID(rs.getBytes("resource_id")),
                rs.getNString("content"),
                rs.getTimestamp("create_time")
        );
    }
    
}
