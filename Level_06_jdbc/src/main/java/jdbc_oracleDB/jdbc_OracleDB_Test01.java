package jdbc_oracleDB;

import java.sql.*;

public class jdbc_OracleDB_Test01 {

	public static void main(String[] args) {
		try {
			 // MySQL의 경우 : Class.forName("com.mysql.jdbc.Driver");
			Class.forName("oracle.jdbc.OracleDriver");
			
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:free","PlayMaker","1234");
			System.out.println("Success");
		} catch (ClassNotFoundException e) {
			System.out.println("No JDBC Driver");
		} catch (SQLException e) {
			System.out.println("No DB version or Invalid username, password");
		}
	}

}
