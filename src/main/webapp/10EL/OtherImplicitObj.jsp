<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    /* 쿠키생성, 유효기간 10초*/
    CookieManager.makeCookie(response, "ELCookie", "EL굿",10);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현언어EL - 그외 내장객체</title>
</head>
<body>
	<h3>쿠키값 읽기</h3>
	
	<!-- EL로 읽을 때 cookie.쿠키명.value
		쿠키생성 직후는 읽을 수 없고 재 요청 시 쿠키생성 가능-->
	<li>ELCookie값: ${cookie.ELCookie.value }</li>
	
	<h3>HTTP헤더 읽기</h3> <!-- EL 로 여러가지 요청헤더 값 읽기 -->
	<ul>
		<li>host: ${header.host }</li>
		<li>user-agent: ${header['user-agent']}</li>
			<!-- 속성명에 특수문자 있어서 쩜으로는 못가져옴 -->
		<li>cookie: ${header.cookie }</li>
	</ul>
	
	<h3>컨텍스트 초기화 매개변수 읽기</h3>
	<!-- web.xml에 기술 한 내용 읽어오기 -->
	<li>OracleDriver: ${initParam.OracleDriver }</li>
	
	<h3>컨텍스트 루트 경로 읽기</h3>
	<!-- 이클립스 환경에서는 프로젝트명 이 출력된다. -->
	<li>${pageContext.request.contextPath }</li>

</body>
</html>