<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isErrorPage="true" %>
    <!-- 현재 페이지에서 에러를 처리하기 위해 isErrorPage속성을 true로 지정했다. -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>서비스 중 일시적 오류 발생</h2>
	 <div> <img src ="../images/Error.jpg" alt="공사중"/> </div>
	<p>
		오류명: <%= exception.getClass().getName() %> <br/>
		오류메세지: <%= exception.getMessage() %>	
	</p>
</body>
</html>