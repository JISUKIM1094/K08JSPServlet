<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="scopeVar" value="Page Value"/>
    <c:set var="scopeVar" value="Request Page Value" scope="request"/>
    <c:set var="scopeVar" value="Session Page Value" scope="session"/>
    <c:set var="scopeVar" value="Application Page Value" scope="application"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL -remove</title>
</head>
<body>
	<h4>출력하기</h4>
	<ul><!-- 동일한 속성명으로 각 영역에 속성 저장 -->
		<li>scopeVar : ${scopeVar}</li>
		<li>requestScope.scopeVar : ${requestScope.scopeVar}</li>
		<li>sessionScope.scopeVar : ${sessionScope.scopeVar}</li>
		<li>applicationScope.scopeVar : ${applicationScope.scopeVar}</li>
	</ul>
	
	<h4>session영역에서 삭제하기</h4>
	<!-- 지정영역에서 속성 삭제- 지정 된 영역의 속성만 삭제된다. -->
	<c:remove var="scopeVar" scope="session" />
	<ul>
		<li>scopeVar : ${scopeVar}</li>
		<li>requestScope.scopeVar : ${requestScope.scopeVar}</li>
		<li>sessionScope.scopeVar : ${sessionScope.scopeVar}</li>
		<li>applicationScope.scopeVar : ${applicationScope.scopeVar}</li>
	</ul>
	
	<h4>scope지정 없이 삭제하기</h4>
	<!-- 영역 지정 없이 속성 삭제- 전체 영역의 같은 이름을 가진 속성이 모두 삭제된다. -->
	<c:remove var="scopeVar" />
	<ul>
		<li>scopeVar : ${scopeVar}</li>
		<li>requestScope.scopeVar : ${requestScope.scopeVar}</li>
		<li>sessionScope.scopeVar : ${sessionScope.scopeVar}</li>
		<li>applicationScope.scopeVar : ${applicationScope.scopeVar}</li>
	</ul>
</body>
</html>