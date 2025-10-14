package board;

import java.sql.*;
import java.util.*;

public class BoardDAO {
	private DBConnectionMgr pool = DBConnectionMgr.getInstance();
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	String sql;
	
	// 게시판 목록 가져오기
	public ArrayList<BoardBean> getBoardList(String keyField, String keyWord) {
		ArrayList<BoardBean> alist = new ArrayList<>();	
		try {
			con = pool.getConnection();
			
			if(keyWord.equals("") || keyWord==null) {
				sql = "select * from board order by num desc";
				pstmt = con.prepareStatement(sql);
			} else {
				sql = "SELECT * FROM board WHERE " + keyField + " LIKE ? ORDER BY num DESC";
			    pstmt = con.prepareStatement(sql);
			    pstmt.setString(1, "%" + keyWord + "%");
			}
			
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardBean bean = new BoardBean();
				bean.setNum(rs.getInt("num"));
				bean.setName(rs.getString("name"));
				bean.setSubject(rs.getString("subject"));
				bean.setPos(rs.getInt("pos"));
				bean.setRef(rs.getInt("ref"));
				bean.setDepth(rs.getInt("depth"));
				bean.setRegdate(rs.getString("regdate"));
				bean.setCount(rs.getInt("count"));
				alist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return alist;
	}
	
	
	 // 이건 무시
	 public ArrayList<BoardBean> getList2() { 
		 ArrayList<BoardBean> alist = new
		 ArrayList<>(); 
		 try { 
			 con = pool.getConnection(); 
			 sql = ""; 
			 rs = con.createStatement().executeQuery(sql); 
			 while(rs.next()) {
			 } 
		 } catch (Exception e) { 
			 e.printStackTrace(); 
		 } finally {
			 pool.freeConnection(con); 
		 } 
		 return alist; 
	 }
}
