<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    //페이지 영역과 리퀘스크 영역에 속성값 저장
    pageContext.setAttribute("pAttr", "김유신");
    request.setAttribute("rAttr", "계백");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션태그 forward</title>
</head>
<body>
	<!-- 페이지 이동의 경우 새로운 요청을 하는 것이므로 
		완전히 서로 다른 페이지를 의미한다.
		페이지, 리퀘스트 영역 모두 공유되지 않는다. -->
	<!-- <h3>sendRedirect를 통한 페이지 이동</h3> -->
	<%-- <% response.sendRedirect("ForwardSub.jsp"); %> --%>
	
<!-- 포워드 된 페이지에서는 리퀘스트 영역이 공유된다.
	주소에는 최초 요청 페이지 주소가 보여지지만,
	포워드 된 페이지의 내용이 출력된다.
	액션태그를 사용하면 간결히 사용가능
-->
	<h2>액션태그를 이용한 포워딩</h2> 	
	<jsp:forward page="/07ActionTag/ForwardSub.jsp"/>
	
<!-- 자바코드를 통한 포워딩-->	
<%--  <%request.getRequestDispatcher("ForwardSub.jsp").forward(request, response); %>
--%>


</body>
</html>