<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <!-- request영역 
 	클라이언트 요청 시 마다 새로운 객체 생성되어
 	하나의 요청을 처리하는 데 (== 같은 요청을 처리하는 데)
 	사용되는 모든 JSP페이지 (== 포워드 페이지) 에 공유 됨
 	
 	즉 request 영역에 저장 된 정보는 현재페이지, 포워드 된 페이지까지 공유된다.
 -->
 
<%
request.setAttribute("requestString", "reset 영역의 문자열");
request.setAttribute("requestPerson", new Person("안중근",31));
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request 영역의 속성값 삭제하기</title>
</head>
<body>

<h2>request 영역의 속성값 삭제하기</h2>
	<%
		request.removeAttribute("requestString"); //저장 된 객체, 삭제된다.
		request.removeAttribute("requestInteger"); //없는 객체지만 에러가 나지는 않는다.
	%>
	
<h2>request 영역의 속성값 읽기</h2>
<!-- 동일 페이지에서 저장 된 정보이므로 정상 출력 -->
	<% Person rPerson = (Person) (request.getAttribute("requestPerson")); %>

	<ul>
		<li>String 객체: <%= request.getAttribute("requestString") %></li>
		<li>Person 객체: <%= rPerson.getName() %>, <%= rPerson.getAge() %></li>
	</ul>

 

 
<h2>포워드된 페이지에서 request 영역 속성값 읽기</h2>
<!-- 포워드
	현재 페이지로 들어온 요청을 다음 페이지로 보내는 기능.
	하나의 요청을 둘 이상의 페이지가 공유 할 수 있다. 
		
		포워드 명령을 만나기 전까지의 모든 내용이 버퍼에서 삭제 되고
		포워드 페이지의 내용만 화면에 출력된다. 
	즉, 포워드란 현재 페이지로 들어온 요청을 다른 페이지에서도 공유 할 수 있도록 전달하는 것을 말한다.		
-->
<%request
	.getRequestDispatcher("2RequestForward.jsp?paramHan=한글&paramEng=English")
	.forward(request, response);	
%> 

 

</body>
</html>