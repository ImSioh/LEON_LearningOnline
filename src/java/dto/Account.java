package dto;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.UUID;

public class Account {

    private UUID accountId;
    private String name;
    private Date birthDate;
    private String address;
    private String phoneNumber;
    private String email;
    private String password;
    private int role;
    private String profilePicture;
    private String verificationCode;
    private Timestamp createTime;
    private boolean locked;

    public Account(UUID accountId, String name, Date birthDate, String address, String phoneNumber, String email, String password, int role, String profilePicture, String verificationCode, Timestamp createTime, boolean locked) {
        this.accountId = accountId;
        this.name = name;
        this.birthDate = birthDate;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.password = password;
        this.role = role;
        this.profilePicture = profilePicture;
        this.verificationCode = verificationCode;
        this.createTime = createTime;
        this.locked = locked;
    }

    public UUID getAccountId() {
        return accountId;
    }

    public void setAccountId(UUID accountId) {
        this.accountId = accountId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getProfilePicture() {
        return profilePicture;
    }

    public void setProfilePicture(String profilePicture) {
        this.profilePicture = profilePicture;
    }

    public String getVerificationCode() {
        return verificationCode;
    }

    public void setVerificationCode(String verificationCode) {
        this.verificationCode = verificationCode;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public boolean isLocked() {
        return locked;
    }

    public void setLocked(boolean locked) {
        this.locked = locked;
    }

    @Override
    public String toString() {
        return "Account(" + String.join(", ", new String[]{
            accountId.toString(),
            name,
            birthDate == null ? "null" : birthDate.toString(),
            address,
            phoneNumber,
            email,
            password,
            String.valueOf(role),
            profilePicture,
            verificationCode,
            createTime.toString(),
            String.valueOf(locked)
        }) + ")";
    }

    @Override
    public boolean equals(Object obj) {
        Account account = (Account) obj;
        return account.accountId.equals(this.accountId);
    }

}
