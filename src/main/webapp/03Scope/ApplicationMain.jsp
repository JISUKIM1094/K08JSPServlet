<%@page import="common.Person"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 웹 애플리케이션은 단 하나의 애플리케이션 객체만 생성하고 
	사용자가 요청 모든 페이지가 공유한다. 
	페이지를 닫은 후 새롭게 접속하더라도 정보가 유지된다.
	해당 영역의 정보는 웹서버가 셧다운 (off) 될 때까지 유지한다.-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Application 영역</title>
</head>
<body>
	<h2>Application 영역 공유</h2>
	<%
	Map<String, Person> maps= new HashMap<>();
	maps.put("actor1", new Person("이수일",30));
	maps.put("actor2", new Person("심순애",28));
	application.setAttribute("maps", maps);
	%>
	application 영역에 속성 저장
	
	
	
	
</body>
</html>