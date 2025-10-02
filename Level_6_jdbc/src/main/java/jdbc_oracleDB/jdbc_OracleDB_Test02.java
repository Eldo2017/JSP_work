package jdbc_oracleDB;

import java.sql.*;

public class jdbc_OracleDB_Test02 {

	public static void main(String[] args) {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:free","PlayMaker","1234");
			System.out.println("Success");
			
			Statement st = con.createStatement();
			
			ResultSet res = st.executeQuery("select * from EMPLOYEE");
			
			while(res.next()) {
				String id = res.getString(1);
				String name = res.getString(2);
				String dept = res.getString(6);
				System.out.println(id + ", " + name + ", " + dept);
			}
		} catch (ClassNotFoundException e) {
			System.out.println("No JDBC Driver");
		} catch (SQLException e) {
			System.out.println("No DB version or Invalid username, password");
		}
	}

}
