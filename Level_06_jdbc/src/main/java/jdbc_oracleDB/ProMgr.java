package jdbc_oracleDB;

import java.sql.*;
import java.util.*;

public class ProMgr {
	private final String JDBC_DRIVER = "oracle.jdbc.OracleDriver";
	private final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:free";
	private final String USER = "PlayMaker";
	private final String PASS = "1234";
	
	public ProMgr() {
		try {
			Class.forName(JDBC_DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<ProductBean> getProList() {
		ArrayList<ProductBean> alist = new ArrayList<ProductBean>();
		try {
			Connection con = DriverManager.getConnection(JDBC_URL,USER,PASS);
			Statement st = con.createStatement();
			String query = "select * from TB_PRODUCT";
			ResultSet res = st.executeQuery(query);
			
			while(res.next()) {
				ProductBean bean = new ProductBean();
				bean.setpCode(res.getInt("pCode"));
				bean.setpName(res.getString("pName"));
				bean.setBrand(res.getString("brand"));
				alist.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return alist;
	}
}
