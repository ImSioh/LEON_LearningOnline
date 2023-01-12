package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {

    private static volatile Connection connection;

    private DBContext() {
    }

    protected static Connection getConnecttion() {
        Connection connection = DBContext.connection;
        if (connection == null) {
            synchronized (Connection.class) {
                connection = DBContext.connection;
                if (connection == null) {
                    try {
                        String user = "root";
                        String password = "Leducphi2002";
                        String url = "jdbc:mysql://localhost:3306/online_learning";
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
