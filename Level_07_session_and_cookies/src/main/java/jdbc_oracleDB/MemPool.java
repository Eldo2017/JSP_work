package jdbc_oracleDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemPool {
	private DBConnectionMgr pool;
	
	public MemPool() {
		try {
		pool = DBConnectionMgr.getInstance();
		} catch(Exception e) {
			System.out.println("Error : 커넥션 연결 실패");
		}
	}
	
	public boolean loginMem(String id, String pw) {
		Connection con = null;
		PreparedStatement pstment = null;
		ResultSet rs = null;
		boolean loginCon = false;
		
		try {
			con = pool.getConnection();
			String query = "select count(*) from MEMBER where MEM_ID=? and MEM_PASSWD=?";
			pstment = con.prepareStatement(query);
			pstment.setString(1,id);
			pstment.setString(2,pw);
			rs = pstment.executeQuery();
			
			if(rs.next() && rs.getInt(1) > 0) {
				loginCon = true;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstment, rs);
		}
		
		return loginCon;
	}
}
