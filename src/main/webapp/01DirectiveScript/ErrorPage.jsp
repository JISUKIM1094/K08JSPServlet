<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    errorPage = "IsErrorPage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page지시어 - errorPage, isErrorPage속성</title>
</head>
<body>
<%
int myAge2 = Integer.parseInt(request.getParameter("age"))+10;
out.println("10년 후 나이"+myAge2+"입니다");
%>
</body>
</html>
<!-- 에러페이지 처리방법2 : page 지시어에 errorPage 속성 추가
	현재 페이지에서 에러발생 시 지정된 페이지로 오류를 전달하겠다는 의미를 가짐.
		주소줄에는 현재 페이지 주소가 보이지만
		실제 출력되는 내용은 지정된 페이지의 내용이 출력된다. -->