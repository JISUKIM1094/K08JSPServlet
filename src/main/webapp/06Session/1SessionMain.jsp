<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 세션 유지시간
	별도 설정 없으면 30분으로 지정 됨 (30*60*60초 =1800) 
	
	
	세션 유지시간 설정: web.xml에서는 분단위로 지정된다.
		 <session-config>
		 	<session-timeout>15</session-timeout>
		 </session-config>
 
 -->   
<%
SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");

long creationTime = session.getCreationTime();
String creationTimeStr = dateFormat.format(new Date(creationTime));

long lastTime = session.getCreationTime();
String lastTimeStr = dateFormat.format(new Date(lastTime));
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session</title>
</head>
<body>
<h2>Session 설정 확인</h2>	
	<ul>
		<li>세션 유지시간: <%= session.getMaxInactiveInterval() %> </li> 
		<li>세션 아이디: <%=session.getId() %> </li>
		<li>최초 요청 시각: <%=creationTimeStr %> </li>
		<li>마지막 요청 시각: <%=lastTimeStr %> </li>
	</ul>
</body>
</html>