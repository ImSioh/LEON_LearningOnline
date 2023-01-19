package dao;

import dto.Account;
import helpers.Util;
import java.sql.ResultSet;
import java.util.UUID;

public class AccountDAO extends AbstractDAO<Account> {

    public Account getAccountByEmail(String email) throws Exception {
        String query = "SELECT * FROM account a WHERE a.email = ?";
        return selectOne(query, email);
    }

    public Account getAccountById(UUID id) throws Exception {
        String query = "SELECT * FROM account a WHERE a.account_id = ?";
        return selectOne(query, Util.UUIDToByteArray(id));
    }
    
    public int setVerifyCodeNull(UUID id) throws Exception {
        String query = "UPDATE account set verification_code = NULL WHERE BIN_TO_UUID(account_id) = ?";
        return update(query, Util.UUIDToByteArray(id));
    }
    
    public int setPassword(String password, String email) throws Exception {
        String query = "UPDATE account set password = ? WHERE email = ?";
        return update(query, password, email);
    }
    
    public int insertAccount(Account account) throws Exception {
        String query = "INSERT INTO account VALUES (?, ?, ?, ?, ?, ?, ?, ?, NULL, ?, ?, ?)";
        return update(
                query,
                Util.UUIDToByteArray(account.getAccountId()),
                account.getName(),
                account.getBirthDate(),
                account.getAddress(),
                account.getPhoneNumber(),
                account.getEmail(),
                account.getPassword(),
                account.getRole(),
                account.getVerificationCode(),
                account.getCreateTime(),
                account.isLocked()
        );
    }

    @Override
    protected Account propMapping(ResultSet rs) throws Exception {
        return new Account(
                UUID.nameUUIDFromBytes(rs.getBytes("account_id")),
                rs.getString("name"),
                rs.getDate("birth_date"),
                rs.getString("address"),
                rs.getString("phone_number"),
                rs.getString("email"),
                rs.getString("password"),
                rs.getInt("role"),
                rs.getString("profile_picture"),
                rs.getString("verification_code"),
                rs.getTimestamp("create_time"),
                rs.getBoolean("locked")
        );
    }

}
