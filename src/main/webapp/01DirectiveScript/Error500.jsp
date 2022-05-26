<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page지시어 - errorPage, isErrorPage속성</title>
</head>
<body>
<%
//첫실행시 파라미터가 없는 상태이므로 예외발생. 
// java.lang.NumberFormatException: null

	int myAge = Integer.parseInt(request.getParameter("age"))+10;
	out.println("10년 후 나이"+myAge+"입니다");
//실행 후 주소입력줄에서 파일명 뒤에 ?age=32 추가하면 정상작동  
%>
</body>
</html>

<!-- 500에러. 오타나 뭔가 잘못됐을 때.. 
	리퀘스트 할 변수가 null값이기 때문에 잘못됨 -->