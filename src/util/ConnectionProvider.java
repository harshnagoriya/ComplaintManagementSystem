/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package util;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class ConnectionProvider {
	public static Connection getConnection() {
		Connection con = null;
		try {
			/* Initialize and load the JDBC-ODBC Bridge driver */
			Class.forName("com.mysql.jdbc.Driver");
			/* Establish a connection with a data source */
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/x", "root", "123");
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			System.out.print("********************");
		}
		/* returns connection object */
		return con;
	}

}
