<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="common.Person"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL -forEach 2</title>
</head>
<body>
	<h4> 향상된 for문 형태의 forEach태그</h4>
	<!-- 주로 배열, 컬렉션에서 값에 순차적으로 접근 하고자 할 때 사용 
		items="컬렉션 혹은 배열명" var="변수명" varStatus="loop" -->
	<%
	String[] rgba= {"Red", "Green", "Blue", "Black"}; 
	%>
	<c:forEach items="<%=rgba %>" var="c">
		<span style="color:${c };">${c }</span>
	</c:forEach>
	
	<h4>varStatus 속성</h4>
	<!-- 
		count : 실제 반복횟수 1~
		index : 현재 루프의 인덱스 0~
		current : 현재 loop의 실제 요소 (배열에 저장 된 데이터) 
	 -->
	<table border="1">
		<c:forEach items="<%=rgba %>" var="c" varStatus="loop">
			<tr>
				<td>count: ${loop.count }</td>
				<td>index: ${loop.index }</td>
				<td>current: ${loop.current }</td>
				<td>first: ${loop.first }</td>
				<td>last: ${loop.last }</td>
			</tr>
		</c:forEach>
	</table>
	
	
	
</body>
</html>