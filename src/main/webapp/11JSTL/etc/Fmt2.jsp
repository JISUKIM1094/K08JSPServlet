<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL -fmt2</title>
</head>
<body>
	<c:set var="today" value="<%=new java.util.Date() %>"/>
	
	<h4>날짜포맷</h4>
	<!-- 
		full: 2022년 6월 3일 금요일
		short: 22. 6. 3.
		long: 2022년 6월 3일
		default: 2022. 6. 3.
	 -->
	full: <fmt:formatDate value="${today }" type="date" dateStyle="full"/> <br>
	short: <fmt:formatDate value="${today }" type="date" dateStyle="short"/> <br>
	long: <fmt:formatDate value="${today }" type="date" dateStyle="long"/> <br>
	default: <fmt:formatDate value="${today }" type="date" /> 
	
	<h4>시간포맷</h4>
	<!-- 
		full: 오전 11시 31분 49초 대한민국 표준시
		short: 오전 11:31
		long: 오전 11시 31분 49초 KST
		default: 오전 11:31:49
	 -->	
	full: <fmt:formatDate value="${today }" type="time" timeStyle="full"/> <br>
	short: <fmt:formatDate value="${today }" type="time" timeStyle="short"/> <br>
	long: <fmt:formatDate value="${today }" type="time" timeStyle="long"/> <br>
	default: <fmt:formatDate value="${today }" type="time" timeStyle="default"/>  
		
	
	<h4>날짜, 시간표시</h4>
	<!--  type="both"로 날짜, 시간 표시. 각각 포맷지정 가능.-->
	<fmt:formatDate value="${today }" type="both" dateStyle="full" timeStyle="full"/><br>
	<!-- pattern="" 으로 출력 포맷 지정가능 -->
	<fmt:formatDate value="${today }" type="both" pattern="yyyy=MM-dd hh:mm:ss"/><br>
	
	<h4>타임존 설정</h4>
	<fmt:timeZone value="GMT"> <!-- GMT: 세계표준시로 영국의 그리니치 천문대가 기준 -->
		<fmt:formatDate value="${today }" type="both" dateStyle="full" timeStyle="full"/><br>	
	</fmt:timeZone>
	<fmt:timeZone value="America/Chicago"> <!-- 미중부 -->
		<fmt:formatDate value="${today }" type="both" dateStyle="full" timeStyle="full"/><br>	
	</fmt:timeZone>
	<br>
	<!-- GMT에 9시간을 더하면 한국시간 (KST)-->
	<fmt:timeZone value="GMT+9">
		<fmt:formatDate value="${today }" type="both" dateStyle="full" timeStyle="full"/><br>	
	</fmt:timeZone>
	<fmt:timeZone value="Asia/Seoul">
		<fmt:formatDate value="${today }" type="both" dateStyle="full" timeStyle="full"/><br>	
	</fmt:timeZone>
	<h4>타임존에 사용할 수 있는 문자열 구하기</h4>
	<c:forEach var="ids" items="<%=java.util.TimeZone.getAvailableIDs() %>">
	${ids }<br>
	</c:forEach>

	
	
</body>
</html>