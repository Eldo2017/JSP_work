package jdbc_oracleDB;

import java.sql.*;
import java.util.ArrayList;

public class ProPool {
	private DBConnectionMgr pool = null;
	
	public ProPool() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public ArrayList<ProductBean> getProList() {
		ArrayList<ProductBean> alist = new ArrayList<ProductBean>();
		Connection con = null;
		try {
			con = pool.getConnection();
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
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return alist;
	}
}
