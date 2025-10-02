package jdbc_oracleDB;

import java.sql.*;
import java.util.ArrayList;

public class LocPool {
	private DBConnectionMgr pool = null;
	
	public LocPool() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public ArrayList<LocalBean> getLocList() {
		ArrayList<LocalBean> alist = new ArrayList<LocalBean>();
		Connection con = null;
		try {
			con = pool.getConnection();
			if(con != null) {
		        System.out.println("DB 연결 성공");
		    } else {
		        System.out.println("DB 연결 실패");
		    }
			Statement st = con.createStatement();
			String query = "select * from location";
			ResultSet res = st.executeQuery(query);
			
			while(res.next()) {
				LocalBean bean = new LocalBean();
				bean.setLocal_Code(res.getString("local_Code"));
				bean.setNational_Code(res.getString("national_Code"));
				bean.setLocal_Name(res.getString("local_Name"));
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
