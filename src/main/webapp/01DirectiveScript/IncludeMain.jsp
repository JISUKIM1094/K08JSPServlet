<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="IncludeFile.jsp" %>
<!-- include 공통 페이지를 사용 할 때. 한번만 수정 하면 되고 편안~
상속같네 -->    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Include 지시어</title>
</head>
<body>
<% 
	out.println("오늘날짜: "+today+"<br>");
	out.println("내일날짜: "+tomorrow);
%>
<%--주석못썼음~_~ㅋ --%>
</body>
</html>
