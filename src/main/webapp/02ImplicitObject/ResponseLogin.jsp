<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - response</title>
</head>
<body>
<%
//request 내장객체를 통해 전송 된 폼값 받기
String id = request.getParameter("user_id");
String pwd = request.getParameter("user_pwd");
//id, pw 확인하여 페이지 이동
if( id.equalsIgnoreCase("must") && pwd.equalsIgnoreCase("1234")) //문자열 단순 비교
	response.sendRedirect("ResponseWelcome.jsp"); //JS의 location.href='경로'와 동일 (==a태그)
else{//로그인 실패시
	request.getRequestDispatcher("ResponseMain.jsp?loginErr=1").forward(request, response);
	// 메인페이지 출력. 웹브라우저 주소줄에는 로그인.jsp가 보이지만 실제 출력은 main.jsp 가 된다.

/*forward() 
	제어의 흐름을 전달하고자 할 때 사용. 페이지 이동과는 다르다. 
	이 전 모든 내용을 버퍼에서 제거 후 해당 페이지 내용을 웹브라우저에 출력한다.
*/
}
%>
</body>
</html>