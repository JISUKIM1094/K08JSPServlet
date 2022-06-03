<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - Redirect</title>
	<!--redirect 태그가 실행되는 즉시 페이지 이동
		새로운 페이지에 대한 요청이므로 리퀘스트 영역은 공유되지 않는다.
		절대경로 사용 시 컨텍스트 루트 경로 제외 
				request.getContextPath() -->
</head>
<body>
	<c:set var="requestVar" value="MustHave" scope="request" />

	<%-- 
	<c:redirect url="/11JSTL/inc/OtherPage.jsp">
		<c:param name="user_param1" value="출판사" />
		<c:param name="user_param2" value="골든래빗" />
	</c:redirect>
	--%>
	<h4>JSP내장객체를 통한 페이지 이동</h4>
	<%
	// 파라미터가 한글 일 경우 인코딩이 필요하다.
	String p1= URLEncoder.encode("출판사") ;
	String p2= "골든래빗" ;
	//request.getContextPath()- 리퀘스트 내장객체를 통한 이동을 할 때는 컨텍스트 루트를 필수 기재해야 한다.
	response.sendRedirect(request.getContextPath() + "/11JSTL/inc/OtherPage.jsp" + p1 +"&user_param2"+ p2);
	%>
</body>
</html>