package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBContext {

    public static Connection connection;

    private DBContext() {
    }

    public static Connection getConnecttion() {
        if (connection == null) {
            try {
                String user = "root";
                String password = "123456789";
                String url = "jdbc:mysql://localhost:3306/musicshop";
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection(url, user, password);
            } catch (Exception e) {
            }
        }
        return connection;
    }

    public static void main(String[] args) {
        System.out.println(DBContext.getConnecttion());
    }
}
