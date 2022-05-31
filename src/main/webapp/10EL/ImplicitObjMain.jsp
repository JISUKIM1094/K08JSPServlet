<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    //4가지 영역에 동일한 속성명(scopeValue)으로 각기 다른 값 저장.
    pageContext.setAttribute("scopeValue", "page영역");
    request.setAttribute("scopeValue", "request영역");
    session.setAttribute("scopeValue", "session영역");
    application.setAttribute("scopeValue", "application영역");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현언어 EL - 내장객체</title>
</head>
<body>
	<h2>ImplicitObjMain페이지</h2>
	
	
	
	<h3>각 영역에 저장 된 속성 읽기(JSP내장객체 사용)</h3>
	<ul>
		<li> page영역 : <%=pageContext.getAttribute("scopeValue") %> </li>
		<li> request영역 : <%=request.getAttribute("scopeValue") %></li>
		<li> session영역 :<%=session.getAttribute("scopeValue") %></li>
		<li> application영역 : <%=application.getAttribute("scopeValue") %></li>
	</ul>
	
	<h3>각 영역에 저장 된 속성 읽기(EL사용)</h3>
		<!-- 4가지 영역에 접근 할 때 EL의 내장객체를 통해 내용 출력.
			모두 동일 패턴으로, [영역명Scope] 형태 -->
	<ul>
		<li> page영역 : ${pageScope.scopeValue }</li>
		<li> request영역 : ${requestScope.scopeValue }</li>
		<li> session영역 : ${sessionScope.scopeValue }</li>
		<li> application영역 : ${applicationScope.scopeValue }</li>
	</ul>
	<h3>영역 지정 없이 속성 읽기</h3>
	<!-- 영역지정 없을 때 가장 좁은 영역을 우선출력한다. 
		실무에서는 동일속성명으로 저장하는 경우가 거의 없으므로 대부분 이렇게 사용한다.-->
	<ul><li> ${scopeValue } </li></ul> 
	
 	<jsp:forward page= "ImplicitForwardResult.jsp"/> 
</body>
</html>