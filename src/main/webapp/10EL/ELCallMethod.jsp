<%@page import="el.MyELClass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    MyELClass myClass = new MyELClass(); //객체 호출
    pageContext.setAttribute("myClass", myClass); //영역에 저장
    // 객체가 가진 메서드 사용할 준비 완료
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL-메서드 호출</title>
</head>
<body>
	<h3>영역에 저장 후 메서드 호출</h3>
	<!-- 일반적인 메서드 호출 -->
	910904-2000000 => ${myClass.getGender("910904-2000000") } <br>
	890127-3000000 => ${myClass.getGender("890127-3000000") } <br>
	
	<h3>클래스명을 통해 정적 메서드 호출하기</h3>
	${MyELClass.showGugudan(7) }
	
	<%
	out.print(MyELClass.isNumber("백20")? "숫자":"노숫자");
	out.println("<br>");
	
	boolean isNumStr = MyELClass.isNumber("120");
	if(isNumStr ==true) out.print("숫자");
	else out.print("노숫자");
	 
	 %>
</body>
</html>