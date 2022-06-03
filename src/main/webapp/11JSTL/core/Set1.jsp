<%@page import="common.Person"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL -set1 </title>
<!-- set 태그
 setAttribute("속성명","값") 와 같은 역할을 한다.
 즉, 4가지 영역에 변수를 저장한다.
 
 	var="값을 지정할 EL 변수명"  
	value="지정한 변수의 값"	
	[scope = "변수를 저장할 영역"]
	
	target="var로 설정한 객체변수 or Map객체변수" 
	property="자바빈 or Map객체의 속성명" 
	value="지정한 속성의 값" 
-->
</head>
<body>
<!-- 변수선언 -->
	<c:set var = "directVar" value="100" />
	<c:set var = "elVar" value="${directVar mod 5 }" />
	<c:set var = "expVar" value="<%= new Date() %>" />
	<c:set var = "betweenVar">변수값 설정 이렇게 </c:set>
	
	<h4> EL 변수 출력 </h4>
	<ul>
		<li>directVar : ${directVar } </li>
		<li>elVar :${elVar } </li>
		<li>expVar :${expVar } </li>
		<li>betweenVar :${betweenVar } </li>
	</ul>
	<!-- 클래스의 생성자를 통해 클래스 생성 후 리퀘스트 영역에 저장 -->
	<!-- JSTL은 JSP코드이므로 value 속성 기술 시 객체 생성을 위한 더블쿼테이션이 중복 사용될 수 있다.
		이 때 value를 싱글쿼테이션으로 묶거나 \" 를 이용하여 단문 문자열로 인식하게 한다.   -->
	<h4> 자바빈즈 생성1 생성자 사용 </h4>
	<c:set var ="personVar1" value ='<%= new Person("김지수",50)%>' scope="request" />
	<!-- 자바빈즈 게터를 통해 멤버변수 값 출력 -->
	<ul>
		<li>이름: ${requestScope.personVar1.name }</li>
		<li>이름: ${personVar1.age }</li>
	</ul>	
	<!-- 빈 객체 생성 후 타겟, 속성 설정하여 멤버변수 값 지정 -->	
	<h4> 자바빈즈 생성2 target, property 사용</h4>
	<c:set var= "personVar2" value="<%= new Person() %>" scope="request" />
	<c:set target="${personVar2 }" property="name" value ="정약용" />
	<c:set target="${personVar2 }" property="age" value ="60" />
	<ul>
		<li>이름: ${requestScope.personVar2.name }</li>
		<li>이름: ${personVar2.age }</li>
	</ul>
</body>
</html>