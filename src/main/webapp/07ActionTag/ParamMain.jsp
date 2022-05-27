<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
	request.setCharacterEncoding("UTF-8"); 
	String pValue = "방랑시인";
	%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션태그 param</title>
</head>
<body>
	<!-- 자바빈생성: request영역에 저장 -->
	<jsp:useBean id="person" class="common.Person" scope="request"></jsp:useBean>
	<!-- 값설정 -->
	<jsp:setProperty name="person" property="name" value="김삿갓" />
	<jsp:setProperty name="person" property="age" value="56" />
	
	<!-- 다음 페이지로 포워드, 이 때 3개의 파라미터를 전달한다. -->
	<!-- 쿼리스트링 param1전달, 액션 태그로 값 전달
		 액션태그 사이에는 주석넣으면 안됨! -->
	<jsp:forward page="ParamForward.jsp?param1=김병연">
		<jsp:param name="param2" value="경기도 양주"/>
		<jsp:param name="param3" value="<%=pValue%>"/>
	</jsp:forward>
</body>
</html>