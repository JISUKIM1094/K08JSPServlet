<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL -url</title>
	<!-- url태그: url생성, 절대경로로 생성시 컨텍스트 경로 제외
		var속성 미지정 시 해당 위치에 URL출력
		param태그로 지정 한 값은 쿼리스트링으로 연결됨 -->
</head>
<body>
	<h4>url태그로 링크걸기</h4>
	<c:url value="/11JSTL/inc/OtherPage.jsp" var="url">
		<c:param name="user_param1" value="Must" />
		<c:param name="user_param2">Have</c:param>
	</c:url>
	<a href="${url }">OtherPage.jsp</a>
	
</body>
</html>