package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {

    private static volatile Connection connection;

    private DBContext() {
    }

    public static Connection getConnecttion() {
        Connection connection = DBContext.connection;
        if (connection == null) {
            synchronized (Connection.class) {
                connection = DBContext.connection;
                if (connection == null) {
                    try {
                        String user = System.getProperty("leon.mysql.username", System.getenv("MYSQL_USERNAME"));
                        String password = System.getProperty("leon.mysql.password", System.getenv("MYSQL_PASSWORD"));
                        String database = "online_learning";
                        String url = "jdbc:mysql://localhost:3306/" + database;
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        DBContext.connection = connection = DriverManager.getConnection(url, user, password);
                    } catch (ClassNotFoundException | SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        }

        return connection;
    }
    
    public static void main(String[] args) {
        System.out.println(new DBContext().getConnecttion());
    }
}
