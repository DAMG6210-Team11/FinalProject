import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Types;

public class JDBC {

    public static Connection getConnection() {
        String connectionUrl =
                "jdbc:sqlserver://localhost:1433;"
                + "database=house_rental_database;"
                + "user=sa;"
                + "password=DB_Password;"
                + "encrypt=true;"
                + "trustServerCertificate=true;"
                + "loginTimeout=30;";

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            return DriverManager.getConnection(connectionUrl);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
    public static boolean checkPassword(String username, String password) {
     try (Connection conn = JDBC.getConnection()) {
        CallableStatement cstmt = conn.prepareCall("{CALL dbo.CheckUserLogin(?, ?, ?)}");
        cstmt.setString(1, username);
        cstmt.setString(2, password);
        cstmt.registerOutParameter(3, Types.BIT);
        
        cstmt.execute();

        return cstmt.getBoolean(3);
    } catch (SQLException ex) {
        ex.printStackTrace();
    }
    
    return false;
}
}
