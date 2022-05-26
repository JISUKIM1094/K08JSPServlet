<%@page import="java.util.Set"%>
<%@page import="common.Person"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>application 영역</title>
</head>
<body>
	<h2>application 영역의 속성 읽기</h2>
	<%
	
	/* Map컬렉션은 key를 통해 value를 저장하므로 
		출력 반복을 하기위해서는 key를 먼저 얻어와야 한다.
		keySet()으로 key의 목록을 얻고,
		get()을 통해 value를 출력한다.*/
	Map<String, Person> maps = (Map<String,Person>)application.getAttribute("maps");
	Set<String> keys = maps.keySet();
	for(String key:keys){
		Person person = maps.get(key);
		out.print(String.format("이름: %s, 나이: %d <br>", person.getName(), person.getAge()));
	}
	%>
</body>
</html>

