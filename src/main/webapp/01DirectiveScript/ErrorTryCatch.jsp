<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page지시어 - errorPage, isErrorPage속성</title>
</head>
<body>
<%
try{
	int myAge2 = Integer.parseInt(request.getParameter("age"))+10;
	out.println("10년 후 나이"+myAge2+"입니다");
}catch(Exception e){
	out.println("예외발생: 매개변수 age가 null");
}
%>
</body>
</html>
<!-- 에러페이지 처리방법1 : try~catch 예외발생 문단 감싸기 -->