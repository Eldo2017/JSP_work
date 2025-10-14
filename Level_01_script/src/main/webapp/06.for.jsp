<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int sum=0;
		int i;
		
		for(i=1;i<11;i++){
			sum += i;
			if(i==10){
				out.print(i);
				break;
			} else {
				out.print(i + " + ");
			}
		}
	%>
	
	= <%= sum %>이다.<br>
	
	<%
		int arr[] = new int[10];
	
		for(i=0;i<arr.length; i++) {
			arr[i] = i+1;
	%>
		 <%=arr[i] + " " %>
			out.print();
	<%
		}
	%>
</body>
</html>