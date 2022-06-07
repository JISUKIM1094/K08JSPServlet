<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - request</title>
</head>
<body>
	<h2>1. 클라이언트와 서버의 환경정보 읽기</h2>
	<ul>
	<!-- 얘넨 어따 서먹을까?! -->
		<%-- get / pose --%>
		<li>데이터 전송방식: <%=request.getMethod() %> </li> 
		<%-- 현재 접속 한 전체 경로 --%>
		<li>URL: <%=request.getRequestURL() %> </li>
			<!-- 호스트명+경로 -->
		<%-- URL에서 호스트를 제외한 나머지 경로 반환 --%>
		<li>URI: <%=request.getRequestURI() %> </li>
			<!-- 경로 -->
		<li>프로토콜: <%= request.getProtocol() %></li>
		<li>서버명: <%=request.getServerName() %></li>
		<li>서버 포트: <%=request.getServerPort() %></li>
		<%-- 로컬호스트주소는 루프백 주소이므로 0:0...으로 출력된다. --%>
		<li>클라이언트 ip주소: <%=request.getRemoteAddr() %></li>
			<!-- 로컬호스트주소 =루프백 주소 loop back 
				실제 서버 접속하면 거기 ip가 나오겠죠 -->
		<li>쿼리스트링: <%=request.getQueryString() %> </li>
		
		<%-- 전송한 값을 받을 때 사용 --%>
		<li>전송된 값1: <%=request.getParameter("eng") %> </li>
		<li>전송된 값2: <%=request.getParameter("han") %> </li>
			<!-- post전송 시 한글은 깨짐, 인코딩 필요 -->
	</ul>
</body>
</html>