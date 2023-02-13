package dao;

import dto.Account;
import helpers.Util;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.UUID;

public class AccountDAO extends AbstractDAO<Account> {
    
    public ArrayList<Account> getAccountsInClass(UUID classId) throws Exception {
        String query = "SELECT a.* FROM account a LEFT JOIN enrollment e ON a.account_id = e.account_id WHERE (e.class_id = ? AND e.accepted = TRUE) OR a.account_id = (SELECT c.account_id FROM class c WHERE c.class_id = ?)";
        return selectMany(query, Util.UUIDToByteArray(classId), Util.UUIDToByteArray(classId));
    }

    public Account getAccount(String email, String password) throws Exception {
        String query = "SELECT * FROM account a WHERE a.email = ? and a.password = ?";
        return selectOne(query, email, password);
    }

    public Account getAccountByEmail(String email) throws Exception {
        String query = "SELECT * FROM account a WHERE a.email = ?";
        return selectOne(query, email);
    }

    public Account getAccountByPhone(String phone) throws Exception {
        String query = "SELECT * FROM account a WHERE a.phone_number = ?";
        return selectOne(query, phone);
    }

    public Account getAccountById(UUID id) throws Exception {
        String query = "SELECT * FROM account a WHERE a.account_id = ?";
        return selectOne(query, Util.UUIDToByteArray(id));
    }

    public ArrayList<Account> getListAllAccounts() throws Exception {
        String query = "SELECT * FROM account";
        return selectMany(query);
    }

    public ArrayList<Account> getListAccountById(UUID id) throws Exception {
        String query = "SELECT * FROM account a where a.account_id = ?";
        return selectMany(query, Util.UUIDToByteArray(id));
    }

    public ArrayList<Account> getListAccountByEmail(String email, int role) throws Exception {
        String query = "SELECT * FROM account a WHERE a.email LIKE ? and a.role = ?";
        return selectMany(query, "%" + email + "%", role);
    }

    public ArrayList<Account> getListAccountByRole(int role) throws Exception {
        String query = "SELECT * FROM account WHERE role = ?;";
        return selectMany(query, role);
    }

    public ArrayList<Account> getListAccountByRoleAndSort(int role, String criteria, String sort) throws Exception {
        String query = "SELECT * FROM account WHERE role = ?\n"
                + "ORDER BY " + criteria + " " + sort;
        return selectMany(query, role);
    }

    public ArrayList<Account> getListAccountByPhoneNumber(String phoneNumber, int role) throws Exception {
        String query = "SELECT * FROM account a WHERE a.phone_number LIKE ? and a.role = ?";
        return selectMany(query, "%" + phoneNumber + "%", role);
    }

    public ArrayList<Account> getListAccountByName(String name, int role) throws Exception {
        String query = "SELECT * FROM account a WHERE a.name LIKE ? and a.role = ?";
        return selectMany(query, "%" + name + "%", role);
    }

    public ArrayList<Account> getListAllStudentByClassCode(String classCode , String accepted) throws Exception {
        String query = "select a.*  from account as a , enrollment as e , class as c\n"
                + "where e.account_id= a.account_id and  c.class_id =  e.class_id\n"
                + "and c.code = ? and e.accepted = ?;";
        return selectMany(query, classCode , accepted);
    }

    public int setVerifyCodeNull(UUID id) throws Exception {
        String query = "UPDATE account set verification_code = NULL WHERE account_id = ?";
        return update(query, Util.UUIDToByteArray(id));
    }

    public int setPassword(String password, String email) throws Exception {
        String query = "UPDATE account set password = ? WHERE email = ?";
        return update(query, password, email);
    }

    public int insertAccount(Account account) throws Exception {
        String query = "INSERT INTO account VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NULL, ?, ?, ?)";
        return update(
                query,
                Util.UUIDToByteArray(account.getAccountId()),
                account.getName(),
                account.getBirthDate(),
                account.isGender(),
                account.getSchool(),
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

    public int editAccount(Account account) throws Exception {
        String query
                = "UPDATE `online_learning`.`account` \n"
                + "SET \n"
                + "	`name` = ?, \n"
                + "	`birth_date` = ?, \n"
                + "	`gender` = ?, \n"
                + "	`school` = ?, \n"
                + "	`address` = ?, \n"
                + "	`phone_number` = ?, \n"
                + "	`password` = ?, \n"
                + "	`profile_picture` = ?, \n"
                + "	`locked` = ? \n"
                + "WHERE (`account_id` = ?);";
        return update(
                query,
                account.getName(),
                account.getBirthDate(),
                account.isGender(),
                account.getSchool(),
                account.getAddress(),
                account.getPhoneNumber(),
                account.getPassword(),
                account.getProfilePicture(),
                account.isLocked(),
                Util.UUIDToByteArray(account.getAccountId())
        );
    }

    public int lockAccount(Account account, boolean status, String id) throws Exception {
        String query = "UPDATE account SET locked= ? WHERE account_id = ?;";
        return update(
                query,
                account.getName(),
                account.getBirthDate(),
                account.getAddress(),
                account.getPhoneNumber(),
                account.getPassword(),
                account.getProfilePicture(),
                account.isLocked(),
                Util.UUIDToByteArray(account.getAccountId())
        );
    }

    public static void main(String[] args) throws Exception {

       
    }

    @Override
    protected Account propMapping(ResultSet rs) throws Exception {
        return new Account(
                Util.ByteArrayToUUID(rs.getBytes("account_id")),
                rs.getString("name"),
                rs.getDate("birth_date"),
                rs.getBoolean("gender"),
                rs.getString("school"),
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
