package dao;

import dto.Post;
import helpers.Util;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.UUID;

public class PostDAO extends AbstractDAO<Post> {
    
    public int deletePost(UUID postId) throws Exception {
        String query = "DELETE FROM post WHERE post_id = ?";
        return update(query, Util.UUIDToByteArray(postId));
    }
    
    public Post getPost(UUID postId) throws Exception {
        String query = "SELECT post_id, account_id, class_id, pin, content, create_time FROM post p WHERE p.post_id = ?";
        return selectOne(query, Util.UUIDToByteArray(postId));
    }
    
    public ArrayList<Post> getPostsInClass(UUID classId) throws Exception {
        String query = "SELECT post_id, account_id, class_id, pin, content, create_time FROM post p WHERE p.class_id = ? ORDER BY p.create_time ASC";
        return selectMany(
                query,
                Util.UUIDToByteArray(classId)
        );
    }
    
    public int insertPost(Post post) throws Exception {
        String query = "INSERT INTO post (post_id, account_id, class_id, pin, content, create_time) VALUES (?, ?, ?, ?, ?, ?)";
        return update(
                query,
                Util.UUIDToByteArray(post.getPostId()),
                Util.UUIDToByteArray(post.getAccountId()),
                Util.UUIDToByteArray(post.getClassId()),
                post.isPin(),
                post.getContent(),
                post.getCreateTime()
        );
    }

    @Override
    protected Post propMapping(ResultSet rs) throws Exception {
        return new Post(
                Util.ByteArrayToUUID(rs.getBytes("post_id")),
                Util.ByteArrayToUUID(rs.getBytes("account_id")),
                Util.ByteArrayToUUID(rs.getBytes("class_id")),
                rs.getBoolean("pin"),
                rs.getNString("content"),
                rs.getTimestamp("create_time")
        );
    }
    
}
