package dao;

import dto.Comment;
import helpers.Util;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.UUID;

public class CommentDAO extends AbstractDAO<Comment> {

    public int countCommentInPost(UUID postId) throws Exception {
        String query = "SELECT COUNT(c.comment_id) FROM comment c WHERE c.post_id = ?";
        return (int) (long) selectScalar(query, Long.class, Util.UUIDToByteArray(postId));
    }

    public ArrayList<Comment> getCommentsByPost(UUID postId) throws Exception {
        String query = "SELECT * FROM comment c WHERE c.post_id = ? ORDER BY c.create_time ASC";
        return selectMany(query, Util.UUIDToByteArray(postId));
    }

    public int insertComment(Comment comment) throws Exception {
        String query = "INSERT INTO comment (comment_id, account_id, post_id, resource_id, content, create_time) VALUES (?, ?, ?, ?, ?, ?)";
        return update(
                query,
                Util.UUIDToByteArray(comment.getCommentId()),
                Util.UUIDToByteArray(comment.getAccountId()),
                Util.UUIDToByteArray(comment.getPostId()),
                Util.UUIDToByteArray(comment.getResourceId()),
                comment.getContent(),
                comment.getCreateTime()
        );
    }

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
