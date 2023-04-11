
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author ACER NITRO 5
 */
public class DBContext {

    private static Connection connection = null;

    public static Connection getConnection() {
        if (connection == null) {
            String dbUser = "sa";
            String dbPassword = "12345";
            String port = "1433";
            String IP = "127.0.0.1";
            String ServerName = "DESKTOP-0HM5E32";
            String DBName = "nal-script";
            String driverClass = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
            String dbURL = "jdbc:sqlserver://" + ServerName + ";databaseName=" + DBName + ";encrypt=false;trustServerCertificate=false;loginTimeout=30";
            try {
                //Class.forName(driverClass);
                DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
                connection = DriverManager.getConnection(dbURL, dbUser, dbPassword);
            } catch (SQLException e) {
                System.out.println("Error: " + e);
            }
        }

        return connection;
    }
}
