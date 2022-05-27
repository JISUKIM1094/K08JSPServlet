<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <% 
   //외부파일의 경로를 변수로 설정
   String outerPath1 = "./inc/OuterPage1.jsp" ;
   String outerPath2 = "./inc/OuterPage2.jsp" ;
   //페이지영역과 리퀘스트영역에 각각 속성저장
   pageContext.setAttribute("pAttr", "동명왕");
   request.setAttribute("rAttr", "온조왕");
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지시어와 액션 태그 동작 방식 비교</title>
</head>
<body>
	<h2>지시어와 액션 태그 동작 방식 비교</h2>
	
	<h3>지시어로 페이지 포함하기</h3>
<!-- 지시어의 경우
	페이지의 경로를 문자열의 형태로만 기술 할 수 있다.
	표현식을 통해 변수를 사용 할 수 있다. -->
	<%@ include file = "./inc/OuterPage1.jsp" %>
<%--
<%@ include file="<%=outerPath1 OuterPage1 %>" %>  
--%>
<!--포함할 파일의 소스를 그대로 현재 문서에 포함시킨 후 컴파일을 진행한다.
	따라서 하나의 페이지라 생각하면 된다. -->
	<p>외부파일에 선언한 변수: <%=newVar1%></p>
	
	
	<h3>액션테그로 페이지 포함하기</h3>
<!-- 액션태그의 경우 표현식과 문자열 모두 사용 -->
	<jsp:include page="./inc/OuterPage2.jsp"/>
 <jsp:include page="<%= outerPath2 %>"/>
	
	
<!-- 파일을 먼저 실행 한 후 실행 결과를 해당 문서에 포함시키기 때문에 변수를 사용 할 수 없다. -->	
<p>외부파일에 선언한 변수: <br>
	 액션태그는 파일을 먼저 실행 한 후 실행 결과를 해당 문서에 포함시키기 때문에 변수를 사용 할 수 없다.  <%-- =newVar2 --%> </p> 
	
<!-- include
	지시어와 액션태그 차이
	
지시어: jsp소스를 그대로 포함, 페이지 컴파일 == 같은 페이지
		jsp가 포함되어 있는 경우 주로 사용
액션태그: jsp소스를 먼저 실행 후 실행결과를 포함 != 같은페이지.
		변수사용 불가, 페이지 영역은 공유되지 않고 리퀘스트 영역은 공유된다.
		HTML만 있는 경우 주로 사용 
	-->
	
</body>
</html>

















