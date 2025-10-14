package jdbc_oracleDB;

import java.sql.*;
import java.util.*;

public class LocMgr {
	private final String JDBC_DRIVER = "oracle.jdbc.OracleDriver";
	private final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:free";
	private final String USER = "PlayMaker";
	private final String PASS = "1234";
	
	public LocMgr() {
		try {
			Class.forName(JDBC_DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<LocalBean> getLocList() {
		ArrayList<LocalBean> alist = new ArrayList<LocalBean>();
		try {
			Connection con = DriverManager.getConnection(JDBC_URL,USER,PASS);
			Statement st = con.createStatement();
			String query = "select * from location";
			ResultSet res = st.executeQuery(query);
			
			while(res.next()) {
				LocalBean bean = new LocalBean();
				bean.setLocal_Code(res.getString("local_Code"));
				bean.setLocal_Code(res.getString("national_Code"));
				bean.setLocal_Name(res.getString("local_Name"));
				alist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return alist;
	}
}
