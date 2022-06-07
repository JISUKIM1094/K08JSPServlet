<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> FrontController.jsp</title>
</head>
<body>
	<h3>한번의 매핑으로 여러가지 요청 처리</h3>
	${resultValue }
	<ol>
		<li>URI: ${uri }</li>
		<li>요청명: ${commandStr }</li>
	</ol>
	<ul> <!-- 요청명을 .one으로 통일함 -->
		<li><a href="../13Servlet/regist.one">회원가입</a></li>
		<li><a href="../13Servlet/login.one">로그인</a></li>
		<li><a href="../13Servlet/freeboard.one">자유게시판</a></li>
		<li><a href="">처음 페이지</a>
			<% request.setAttribute("uri", request.getRequestURI());
			
			
			%>
			
			</li>
	</ul>
</body>
</html>