package ajax01;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MemberDao {
	private DBConnectionMgr pool = DBConnectionMgr.getInstance();
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	String sql;
	
	// id 중복 체크
	public boolean checkId(String id) {
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select id from member where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			flag = rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return flag;
	}
	
	// 회원가입
	public boolean insertMember(Member bean) {
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert into member values(?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getPwd());
			pstmt.setString(3, bean.getName());
			pstmt.setString(4, bean.getGender());
			pstmt.setString(5, bean.getBirthday());
			pstmt.setString(6, bean.getEmail());
			pstmt.setString(7, bean.getZipcode());
			pstmt.setString(8, bean.getAddress());
			pstmt.setString(9, bean.getDetail_address());
			pstmt.setString(10, String.join(" ", bean.getHobby()));
			pstmt.setString(11, bean.getJob());
			
			if(pstmt.executeUpdate() == 1)   // insert가 잘 되었으면 1반환, 그렇지 않으면 0반환
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return flag;
	}
	
	// login
	public boolean loginMember(String id, String pwd) {
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "select id from member where id=? and pwd=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			flag = rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}	
		return flag;
	}
	
	// id에 해당하는 한 행을 Member bean에 담아 리턴하기
	public Member getMember(String id) {
		Member mem = new Member();
		try {
			con = pool.getConnection();
			sql = "select * from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				mem.setId(rs.getString("id"));
				mem.setName(rs.getString("name"));
				mem.setGender(rs.getString("gender"));
				mem.setEmail(rs.getString("email"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return mem;
	}
	
	// 전체 회원 검색
	public ArrayList<Member> getAllMember() {
		ArrayList<Member> alist = new ArrayList<>();
		try {
			con = pool.getConnection();
			sql = "select * from member";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Member mem = new Member();
				mem.setId(rs.getString("id"));
				mem.setName(rs.getString("name"));
				mem.setGender(rs.getString("gender"));
				mem.setEmail(rs.getString("email"));
				alist.add(mem);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return alist;
	}
}