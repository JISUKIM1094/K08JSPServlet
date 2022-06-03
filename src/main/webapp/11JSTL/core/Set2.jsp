<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="common.Person"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL -set2 </title>
</head>
<body>
	<h4>List컬렉션 이용하기</h4>
	<%
	//Person 객체를 저장할 수 있는 리스트계열 컬렉션 생성
	ArrayList<Person> pList= new ArrayList<Person>();
	pList.add(new Person("김영호",65)); //컬렉션에 객체 추가
	pList.add(new Person("송경희",58)); 
	%>
	<!-- 리퀘스트 영역에 컬렉션 저장 -->	
	<c:set var="personList" value="<%=pList %>" scope="request" />
	<ul> <!-- List이므로 인덱스로 접근하여 출력한다. -->
		<li>이름: ${requestScope.personList[0].name } </li>
		<li>나이: ${personList[0].age }</li>
	</ul>
	
	<h4>Map컬렉션 이용하기</h4>
	<% //Key는 String, value는 Person 타입인 Map계열 컬렉션 생성
	Map<String,Person> pMap = new HashMap<String,Person>();
	pMap.put("personArgs1", new Person("김지수",32)); //컬렉션에 객체추가
	pMap.put("personArgs2", new Person("김해수",35));
	%>
	<c:set var="personMap" value="<%=pMap %>" scope="request"/>
	<ul>	<!-- Map컬렉션이므로 Key로 접근하여 출력 -->
		<li>아이디: ${requestScope.personMap.personArgs2.name }</li>
		<li>비번: ${personMap.personArgs2.age }</li>
		
	</ul>
	
</body>
</html>