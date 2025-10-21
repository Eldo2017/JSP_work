<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.study.dto.person" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Core Library</title>
<style>
	table th {
		background-color:gold;
	}
</style>
</head>
<body>
	<h1>JSTL Core Library</h1>
	
	<h3>1. 변수(속성 == attribute)</h3>
	
	<h4>1-1. 변수 선언과 초기화</h4>
	<pre>
	* 변수 선언과 동시에 초기화 (c:set var="변수명" value="값" [scope=""])
		- 변수 선언하고 초기값을 대입하는 기능 제공
		- 해당 변수를 어떤 scope에 담아둘지 지정 가능(생략 시 기본값 pageScope)
		  => 해당 scope에 setAttribute를 통해 key-value 형태로 데이터를 담아놓는 것과 유사
		  => c:set으로 선언된 변수는 EL로 접근해 사용(스크립팅 원소로는 접근 불가)
		    
		- 변수 타입은 별도로 지정 필요 없다
		- 그러나 초기값만은 지정해야 한다
	</pre>
	
	<c:set var="num1" value="17" /> <!-- pageContext.setAttribute("num1",17) -->
	<c:set var="num2" value="32" scope="request" />
	
	num1 변수의 값 : ${num1}<br>
	num2 변수의 값 : ${num2}<br>
	
	<c:set var="result" value="num1+num2" scope="session" />
	<c:set var="result" value="${num1 + num2}" scope="session" />
	result : ${result}<br><br>
	
	pageScope.num1 : ${pageScope.num1}<br>
	requestScope.num2 : ${requestScope.num2}<br>
	sessionScope.result : ${sessionScope.result}<br>
	requestScope.result : ${requestScope.result}<br><br>
	
	<!-- value 속성 대신 시작태그, 종료태그 사이에 초기값 지정 가능 -->
	<c:set var="result" scope="request">
		9999999
	</c:set>
	
	requestScope.result : ${requestScope.result}<br>
	sessionScope.result : ${sessionScope.result}<br>
	
	<h4>1-2. 변수 삭제</h4>
	
	<pre>
	* 변수 삭제(c:remove var="없앨 변수명" [scope=""])
	  - 해당 scope 영역에서 해당 변수를 찾아서 제거한다
	  - scope 지정 생략 시 모든 scope에서 해당 변수를 다 찾아서 없앤다
	    => 즉, 해당 scope에 .removeAttribute로 제거하는 거라고 생각하면 쉽다
	</pre>
	
	삭제 전 result : ${result}<br><br>
	
	1) 특정 scope 지정하고 삭제 <br>
	<c:remove var="result" scope="request" />
	requestScope에서 삭제 후 result : ${result}<br><br>
	
	2) 모든 scope에서 삭제<br>
	<c:remove var="result" />
	삭제 후 result : ${result}<br>
	
	<hr>
	
	<h4>1-3. 변수 출력</h4>
	<pre>
	* 변수(데이터) 출력 (c:out value="출력하려고 하는 값" [default="기본값"][escapeXml=true | false])
	  데이터를 출력하려고 할 때 사용한다
	</pre>
	
	<c:out value="${num2}" /><br>
	<c:out value="${Arc}" default="데이터 없다"/><br>
	
	<c:set var="outTest" value="<b>출력테스트</b>" />
	
	<!-- escapeXml을 넣지 않는다면 기본값 true : 태그 해석이 안된다(문자열로 취급)
		 escapeXml = "false"면 태그 해석 -->
	<c:out value="${outTest}" /><br>
	<c:out value="${outTest}" escapeXml="false" /><br>
	
	<hr>
	
	<h3>2. 조건문 - if (c:if test="조건식")</h3>
	
	<pre>
	- java의 if문과 비슷한 역할을 하는 태그
	- 조건식은 test 속성에 작성한다 (단, el구문으로만 기술해야 한다)
	</pre>
	
	<c:if test="${num1 gt num2}">
		<b>num1이 num2보다 크다</b>
	</c:if>
	
	<c:if test="${num1 le num2}">
		<b>num1이 num2보다 작다</b>
	</c:if>
	
	<br>
	
	<c:set var="str" value="나 김두한이다" />
<%-- 	
<%
	if(str.equals("나 김두한이다")) {
%>
		<h4>뭐 뭐, 김두한? 반동이다!</h4>
<%
	}
%>
--%>

	<c:if test="${str eq '나 김두한이다'}">
		<h4>뭐 뭐, 김두한? 반동이다!</h4>
	</c:if>
	
	<c:if test="${str ne '나 김두한이다'}">
		<h4>전위대! 전위대!</h4>
	</c:if>
	
	<br><br>
	
	<h3>3. 조건문 - Choose(c:choose, c:when, c:otherwise)</h3>
	<pre>
	- java의 if-else, if-else 문과 비슷한 역할을 하는 태그
	- 각 조건들을 c:choose의 하위요소로 c:when을 통해 작성한다 (else문 역할 -> c:otherwise)
	</pre>
<%-- 	
	<%
		if(num1 > 20) {
	%>
		
	<%
		} else if {	
	%>
		
	<%
		} 
	%>
--%>

	<c:choose>
		<c:when test="${num1 gt 20}">
			<b>20보다 크다</b>
		</c:when>
		<c:when test="${num1 ge 10}">
			<b>20보다 작고 10보다 크다</b>
		</c:when>
		<c:otherwise>
			<b>10보다 작다</b>
		</c:otherwise>
	</c:choose>
	
	<hr>
	
	<h3>4. 반복문 - forEach</h3>
	<pre>
	for loop문 - (c:forEach var="변수명" begin="초기값" end="끝값" [step="증가값"])
	향상된 for문 - (c:forEach var="변수명" items="순차적으로 접근하려 하는 객체(배열 | 컬렉션)" [varStatus="현재 접근이 된 요소의 상태값을 보관할 변수명"])
	</pre>

	<c:forEach var="i" begin="1" end="10" step="2">
		반복확인 : ${i}<br>
	</c:forEach>
	
	<c:forEach var="i" begin="1" end="6">
		<h${i}>태그 내에도 적용가능</h${i}>
	</c:forEach>
	
	<c:set var="colors">
		red, yellow, blue, pink, green, gold
	</c:set>
	
	colors 변수값 : ${colors}<br>
	
	<ul>
		<c:forEach var="c" items="${colors}">
			<li style="color: ${c}">${c}</li>
		</c:forEach>
		<!-- 
		<li style="color: red">김두한</li>
		<li style="color: yellow">김무옥</li>
		<li style="color: blue">문영철</li>
		<li style="color: pink">김영태</li>
		<li style="color: green">김삼수</li>
		<li style="color: gold">정진영</li>
		 -->
	</ul>
	<!-- 
	String[] str = {"x","y"};
	for(String m: str) {
	 -->
	 
	 <%
	 	ArrayList<person> list = new ArrayList<>();
	 	list.add(new person("김천호",28,"남성"));
	 	list.add(new person("임화수",30,"남성"));
	 	list.add(new person("윤왕초",22,"남성"));
	 %>
	 
	 <c:set var="pList" value="<%=list %>" scope="request" />
	 
	 <table border="1">
	 	<thead>
	 		<tr>
	 			<th>index번호</th>
	 			<th>count번호</th>
	 			<th>이름</th>
	 			<th>나이</th>
	 			<th>성별</th>
	 		</tr>
	 	</thead>
	 	<tbody>
	 		<c:choose>
	 			<c:when test="${empty pList}">
	 				<tr>
	 					<td colspan="3">조회된 사람이 없습니다</td>
	 				</tr>
	 			</c:when>
	 			<c:otherwise>
	 				<c:forEach var="x" items="${pList}" varStatus="status">
	 					<tr>
	 						<td>${status.index}</td> <!-- index는 0부터 시작, count는 1부터 -->
	 						<td>${status.count}</td>
	 						<td>${x.name}</td>
	 						<td>${x.age}</td>
	 						<td>${x.gender}</td>
	 					</tr>
	 				</c:forEach>
	 			</c:otherwise>
	 		</c:choose>
	 		<%-- 
	 		<tr>
	 			<%
	 			if(list.isEmpty()) {
	 			%>
	 				<tr>
	 					<td colspan="3">조회된 사람이 없습니다</td>
	 				</tr>
	 			<%
	 			} else {
	 				for(person x: list) {
	 			%>
	 					<tr>
	 						<td><%=x.getName() %></td>
	 						<td><%=x.getAge() %></td>
	 						<td><%=x.getGender() %></td>
	 					</tr>
	 			<%
	 				}
	 			}
	 			%>
	 		</tr>
	 		 --%>
	 	</tbody>
	 </table>
	 
	 <hr>
	 
	 <h3>5. 반복문 - forTokens</h3>
	 
	 <pre>
	 (c:forTokens var="변수명" items="분리시키려고 하는 문자열" delims="구분자")
	 - 구분자를 통해 분리된 각각의 문자열에 순차적으로 접근해 반복 수행
	 - java의 split("구분자") 또는 StringTokenizer와 비슷한 기능 처리
	 </pre>
	 
	 <c:set var="device" value="PC,모바일,TV,태블릿.에어컨/냉장고.세탁기" />
	 
	 <ol>
	 	<c:forTokens var="d" items="${device}" delims=",./">
	 		<li>${d}</li>
	 	</c:forTokens>
	 </ol>
	 
	 <hr>
	 
	 <h3>6. url, 쿼리 스트링 관련 - url, param</h3>
	 <pre>
	 - url 경로를 생성하고, 쿼리 스트링을 정의해 두는 태그
	 
	 &lt;c:url var="변수명" value="요청할 url"&gt;
	 	&lt;c:param name="키" value="값" /&gt;
	 	&lt;c:param name="키" value="값" /&gt;
	 &lt;/c:url&gt;
	 </pre>
	 
	 <a href="list.do?nowPage=1&num=2">기존 방식</a><br>
	 
	 <c:url var="u" value="list.do">
	 	<c:param name="nowPage" value="1" />
	 	<c:param name="num" value="2" />
	 </c:url>
	 
	 <a href="{u}">c:url을 이용하면?</a>
</body>
</html>