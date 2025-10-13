<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, vote.*" %>

<%
    request.setCharacterEncoding("UTF-8");

    // 선택된 설문 번호
    int num = Integer.parseInt(request.getParameter("num"));

    // 사용자가 선택한 항목 번호들
    String[] items = request.getParameterValues("itemnum");

    // DB 연결
    DBConnectionMgr pool = DBConnectionMgr.getInstance();
    Connection con = null;
    PreparedStatement pstmt = null;
    String sql = "";

    boolean success = true;

    try {
        con = pool.getConnection();
        con.setAutoCommit(false); // 트랜잭션 시작

        if (items != null) {
            // 사용자가 여러 항목을 선택했을 수 있음
            for (String itemNum : items) {
                // voteitem 테이블에 count 컬럼이 있다고 가정
                sql = "UPDATE voteitem SET count = count + 1 WHERE listnum = ? AND itemnum = ?";
                pstmt = con.prepareStatement(sql);
                pstmt.setInt(1, num);
                pstmt.setInt(2, Integer.parseInt(itemNum));
                pstmt.executeUpdate();
				success = true;
            }
        } else {
            success = false; // 아무 것도 선택 안 함
        }

        if (success) con.commit();
        else con.rollback();

    } catch (Exception e) {
        success = false;
        e.printStackTrace();
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
        if (con != null) pool.freeConnection(con);
    }

    String msg = success ? "투표가 완료되었습니다!" : "투표를 실패했습니다. 다시 시도해주세요.";
    String url = "voteList.jsp?num=" + num;
%>

<script>
    alert("<%= msg %>");
    location.href = "<%= url %>";
</script>