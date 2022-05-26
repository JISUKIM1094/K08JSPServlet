<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- session 영역
    	클라이언트가 웹브라우저를 최초로 연 후 닫을 때 까지 요청되는 
    	모든페이지는 session영역을 공유 할 수 있다. 
    	즉, session이란 클라이언트가 서버에 접속해 있는 상태 혹은 단위. -->
    <%
    ArrayList<String> lists = new ArrayList<String>();
    lists.add("리스트");
    lists.add("컬렉션");
    session.setAttribute("lists", lists);
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session 영역</title>
</head>
<body>
	<h2>페이지 이동 후 session 영역의 속성 읽기</h2>
	<!-- 모든 실행창을 닫은 후 해당페이지를 단독으로 실행 하면 
		Null 오류 발생.
		세션영역은 웹을 닫으면 소멸된다.
	-->
	<a href="3SessionLocation.jsp">SessionLocation.jsp 바로가기</a>
</body>
</html>