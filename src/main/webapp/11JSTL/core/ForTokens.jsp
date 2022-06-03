<%@page import="java.util.StringTokenizer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL -forTokens</title>
	<!-- 	items="구분자를 포함한 문자열 (컬렉션/배열 불가) "
			delims (delimiter) ="문자열을 구분할 구분자 (특수기호 가능)" 
			var="구분자로 잘라낸 토큰(문법적으로 의미있는 최소단위)을 저장한다."
	-->
</head>
<body>

	<%
	String rgba="Red,Green,Blue,Black";
	%>
	<h4>JSTL의 forTokens 태그 사용</h4>
	<c:forTokens items="<%=rgba %>" delims="," var="color">
		<span style="color:${color };">${color }</span><br>
	</c:forTokens>

	<h4>StringTokenizer </h4>
	<% //문자열과 구분자를 인자로 가지는 생성자를 통한 객체생성
	StringTokenizer tokens = new StringTokenizer(rgba,",");
	out.print("토큰수: "+ tokens.countTokens() + "<br>"); 
	while(tokens.hasMoreTokens()){ //다음 토큰이 있는 지 확인
		String token = tokens.nextToken(); 
		out.println(token+"<br>"); //토큰 출력
	}
	%>
	
	
	<h4>Java -split()사용</h4>
	<%
	String[] colorArr = rgba.split(","); //구분자를 기준으로 문자열을 나누어 배열에 반환
	for(String s:colorArr) out.println(s+"<br>"); //각 배열 출력
	%>


</body>
</html>


