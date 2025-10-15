package board;

import java.sql.*;
import java.util.ArrayList;

public class BoardDAO {
	private DBConnectionMgr pool = DBConnectionMgr.getInstance();
	Connection con;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	String sql;
	
	// total레코드 수
	public int getTotalRecord(String keyField, String keyWord) {
		int totalRecord = 0;	
		try {
			con = pool.getConnection();
			if(keyWord.equals("") || keyWord == null) {
				sql = "select count(num) from board";
				pstmt = con.prepareStatement(sql);
			} else {
				sql = "select count(num) from board where " + keyField + " like ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
			}
			rs = pstmt.executeQuery();
			if(rs.next())
				totalRecord = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return totalRecord;
	}
		
	// 게시판 목록 가져오기
	public ArrayList<BoardBean> getBoardList(String keyField, String keyWord, int start, int end) {
	    ArrayList<BoardBean> alist = new ArrayList<>();
	    try {
	        con = pool.getConnection();

	        if(keyWord == null || keyWord.equals("")) {
	            sql = "SELECT * "
	                + "FROM ("
	                + "SELECT ROWNUM AS RNUM, BT1.* "
	                + "FROM (SELECT * FROM board ORDER BY num DESC) BT1"
	                + ")"
	                + "WHERE RNUM BETWEEN ? AND ?";
	            pstmt = con.prepareStatement(sql);
	            pstmt.setInt(1, start);
	            pstmt.setInt(2, end);
	        } else {
	            sql = "SELECT * FROM ("
	                + " SELECT ROWNUM AS RNUM, BT1.* "
	                + " FROM (SELECT * FROM board WHERE " + keyField + " LIKE ? ORDER BY num DESC) BT1"
	                + ") WHERE RNUM BETWEEN ? AND ?";
	            pstmt = con.prepareStatement(sql);
	            pstmt.setString(1, "%" + keyWord + "%");
	            pstmt.setInt(2, start);
	            pstmt.setInt(3, end);
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
	    } catch(Exception e) {
	        e.printStackTrace();
	    } finally {
	        pool.freeConnection(con, pstmt, rs);
	    }
	    return alist;
	}
	
	// 조회수 증가
	public void upCount(int num) {
		try {
			con = pool.getConnection();
			sql = "update board set count = count+1 where num=" + num;
			con.createStatement().executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
	}
	
	// num에 해당하는 게시물 얻어오기
	public BoardBean getBoard(int num) {
		BoardBean bean = new BoardBean();
		try {
			con = pool.getConnection();
			sql = "select * from board where num="+num;
			rs = con.createStatement().executeQuery(sql);
			if(rs.next()) {
				bean.setNum(rs.getInt("num"));
				bean.setName(rs.getString("name"));
				bean.setSubject(rs.getString("subject"));
				bean.setContent(rs.getString("content"));
				bean.setPos(rs.getInt("pos"));
				bean.setRef(rs.getInt("ref"));
				bean.setDepth(rs.getInt("depth"));
				bean.setRegdate(rs.getString("regdate"));
				bean.setPass(rs.getString("pass"));
				bean.setIp(rs.getString("ip"));
				bean.setCount(rs.getInt("count"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return bean;
	}
	
	// 
	public ArrayList<BoardBean> getList2() {
		ArrayList<BoardBean> alist = new ArrayList<>();	
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

	public void updateBoard(BoardBean upBean) {
		try {
			con = pool.getConnection();
			sql = "update board set name=?, subject=?, content=? where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, upBean.getName());
			pstmt.setString(2, upBean.getSubject());
			pstmt.setString(3, upBean.getContent());
			pstmt.setInt(4, upBean.getNum());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
	}
	
	public int insertBoard(BoardBean board) {
		int result = 0;
		try {
			con = pool.getConnection();
			String sql = "INSERT INTO board "
				    + "(num, name, subject, content, pass, regdate, pos, ref, depth, ip) "
				    + "VALUES (seq_board.nextval, ?, ?, ?, ?, SYSDATE, 0, 0, 0, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board.getName());
			pstmt.setString(2, board.getSubject());
			pstmt.setString(3, board.getContent());
			pstmt.setString(4, board.getPass());
			pstmt.setString(5, board.getIp());
			result = pstmt.executeUpdate();				
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return result;
	}
}