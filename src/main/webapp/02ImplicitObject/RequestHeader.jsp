<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - request</title>
</head>
<body>
	<h2>3. 요청 헤더 정보 출력</h2>
	<%-- 내가 이 전에 접속했던 링크(현재 페이지 바로 이전 페이지의 주소 )를
		반환하는 값 referer --%>
	
	<%
/*	getHeaderNames() 사용자의 요청 헤더를 얻어올 때 사용
	반환 타입은 Enumeration 
		hasMoreElements(): 출력할 정보가 있는 지 확인하여 boolean값을 반환
		nextElement(): 헤더명 반환
	getHeader(String name) name에 해당하는 헤더의 값을 return한다.
*/
	Enumeration headers = request.getHeaderNames();
	while(headers.hasMoreElements()){
		String headerName= (String)headers.nextElement();
		String headerValue= request.getHeader(headerName);
		out.print("헤더명: "+headerName+", 헤더값: " +headerValue+"<br>" );
		}
	
	/*
	요청 헤더를 통해 확인할 수 있는 값
		user-agent : 사용자가 접속 한 웹브라우저의 종류 반환
			클라이언트 프로그램인 웹브라우저의 정보
		referer : 해당 페이지로 유입 된 이전 사이트의 주소
			바로 직전에 머물었던 웹 링크 주소
		cookie : 웹서버가 클라이언트 컴퓨터에 흔적을 남긴다. 파일형태로 저장된다. 
			웹서버가 클라이언트에 쿠키를 저장한 경우 쿠키 정보(이름, 값)를 웹 서버에 전송
	*/
	%>
	
	<p>이 파일을 직접 실행하면 referer 정보는 출력되지 않습니다.</p>
</body>
</html>