package ajaxReply;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ReplyDao {
	private DBConnectionMgr pool = DBConnectionMgr.getInstance();
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	String sql;
	
	public ArrayList<Reply> getReplyList(int ref) {
		ArrayList<Reply> alist = new ArrayList<Reply>();
		try {
			con = pool.getConnection();
			sql = "select * from reply WHERE ref = ? order by no desc";
			// sql = "select no, content, name, to_char(redate, 'yyyy-MM-dd') redate from reply WHERE ref = ? order by no desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ref);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				/*
				Reply bean = new Reply();
				bean.setNo(rs.getInt("no"));
				bean.setName(rs.getString("name"));
				...
				alist.add(bean);
				*/
				
				/*
				// 모든 매개변수가 있는 생성자 호출
				Reply bean = new Reply(rs.getInt("no"), 
									   rs.getString("content"), 
										rs.getInt("ref"), 
										rs.getString("name"),  
										rs.getString("redate"));
				
				alist.add(bean);
				*/
				
				/*
				// 매개변수 4개짜리 생성자 만들기
				Reply bean = new Reply(rs.getInt("no"), 
						   				rs.getString("content"), 
						   				rs.getString("name"),  
						   				rs.getString("redate"));
	
				alist.add(bean);
				*/
				
				// 위의 것을 1줄로 하면
				alist.add(new Reply(rs.getInt("no"), 
		   							rs.getString("content"), 
		   							rs.getString("name"),  
		   							rs.getString("redate")));			
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return alist;
	}
	
	public int insertReply(Reply bean) {
		int result = 0;
		try {
			con = pool.getConnection();
			sql = "insert into reply values(SEQ_REPLY.NEXTVAL, ?, ?, ?, sysdate)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getContent());
			pstmt.setInt(2, bean.getRef());
			pstmt.setString(3, bean.getName());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return result;
	}

}