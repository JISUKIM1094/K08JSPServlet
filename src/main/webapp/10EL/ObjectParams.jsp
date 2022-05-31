<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현언어 EL - 객체 매개변수</title>
</head>
<body>
	<%
	//request영역에 객체 저장
	request.setAttribute("personObj", new Person("가나다",33));
	request.setAttribute("stringObj", "문자열입니다");
	request.setAttribute("integerObj", new Integer(99));
	%>
	
	
	<!-- 액션태그를 통해 포워드 -->
<!-- 액션태그는 시작,종료 태그 사이에 주석 작성 불가 -->
	<!-- 경로 뒤에 쿼리문으로 변수 포워드 -->
	<jsp:forward page="ObjectResult.jsp?secondNum=20"> 
		<jsp:param value="10" name="firstNum"/>
	</jsp:forward>
		<!-- 두개의 정수를 파라미터로 전달 -->


</body>
</html>