<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 내장객체 - application </title>
</head>
<body>
	<%
	
	int status = response.getStatus();
	if(status ==404) {
		out.print("404에러발생");
		out.print("<br>파일 경로 확인");
	}
	if(status ==405) {
		out.print("405에러발생");
		out.print("<br>요청 방식 (method) 확인 ");
	}
	if(status ==500) {
		out.print("500에러발생");
		out.print("<br>소스코드 오류 확인");
		
	}

	%>	
	 <div> <img src ="../images/Error.jpg" width=400 alt="공사중"/> </div>
	
</body>
</html>