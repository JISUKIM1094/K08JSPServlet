<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- page 영역
	하나의 페이지에서만 영역이 공유되고 
	페이지 이동, 포워드 된 페이지에서는 영역이 소멸되어 공유되지 않는다.
	즉 해당 페이지에서만 사용 할 수 있는 영역이다.
	jsp에서의 영역은 데이터를 저장하는 공간으로 메모리라고 생각하면 된다.
-->

<%
pageContext.setAttribute("pageInteger", 1000);
pageContext.setAttribute("pageString", "페이지 영역의 문자열");
pageContext.setAttribute("pagePerson", new Person("김지수",99));
/* page영역을 포함한 4가지 영역 (pageContext, request, session, application) 에는
	setAttribute()메서드를 통해 모든 데이터를 저장할 수 있다. 
	object를 기반으로 저장되므로 차후 값을 읽을 때는 형변환 필수.*/
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page영역</title>
</head>
<body>
	<h2>page영역의 속성값 읽기</h2>
	<%
	int pInteger = (Integer)pageContext.getAttribute("pageInteger"); //정수 데이터 Integer 클래스로 언박싱
	String pString = pageContext.getAttribute("pageString").toString(); //문자열 객체의 toString()메서드로 문자열 반환
	Person pPerson = (Person)pageContext.getAttribute("pagePerson"); //사용자 정의 클래스타입으로 형변환
	%>
	
	<ul>
	<!--Java의 기본클래스인 경우 별도 처리 없이 즉시 내용 출력 가능 -->
		<li>Integer 객체: <%= pInteger %></li>
		<li>String 객체: <%= pString %></li>
	<!--사용자 정의 클래스는 getter() 이용  -->
		<li>Person 객체: <%= pPerson.getName()%>, <%= pPerson.getAge()%></li>
	</ul>
	
	<!-- 지시어를 통한 include는 포함 할 페이지의 원본 소스를 
		그대로 현재 문서에 포함 시킨 후 컴파일 진행.
		따라서 동일한 페이지로 취급되므로 page영역이 그대로 공유된다. -->
	<h2>include 된 파일에서 page 영역 읽어오기</h2>
	<!-- 인클루드 된 페이지 정상 출력 -->
	<%@ include file = "1PageInclude.jsp" %>
	
	<!-- 페이지 이동은 새로운 페이지를 웹서버에 요청하는 것이므로
		page영역은 공유되지 않는다.
			아래의 링크를 통해 이동한 페이지에서는 아무런 내용이 출력되지 않는다. -->
	<h2>페이지 이동 후 page 영역 읽어오기</h2>
	<a href="PageLocation.jsp" >PageLocation.jsp 바로가기</a>

</body>
</html>