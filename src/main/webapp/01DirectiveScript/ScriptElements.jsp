<%@page import="common.MyClass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%!
   	public int add(int num1, int num2){
    	return num1+num2;	
    }
    %>
    <!-- 선언부 Declaration - 스크립트릿이나 표현식에서 사용 할 메서드 선언
    	해당 JSP가 서블릿(Java파일)로 변환 될 때 멤버메서드 형태로 선언된다. -->
    <%--선언부 <%! 메소드(함수)선언 외 자바코드 %> 
    ScriptElements_jsp 클래스 아래 멤버함수로 선언됨 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스크립트 요소</title>
</head>
<body>
<%
	int result = add(10,20);
%>
	<!-- 주로 JSP코드를 작성하고 실행할 때 사용한다. body,head,<script>,<style> 어디서든 사용.
	 	_jspService() 메서드 내 포함된다. 따라서 해당 영역에서는 메서드 선언 불가 
	 	-->
	<%-- 스크립트렛. 메소드를 구성할 수 없다.
		html / Javascript / css코드안에도 삽입할 수 있다.
		<% 자바코드, JSP 코드 실행부 %> 
		_jspService 함수아래 멤버변수로 선언됨 --%>
		
덧셈결과 1 <%= result %> <br>
 결과 2 <%= add(30,40) %>
 	<!-- 변수를 웹브라우저상 출력할 때 사용. JS의 document.write()와 동일한 역할. 
 		주의할 점 : 문장 끝에 ; 붙이지 않는다.	 -->
	<%-- 표현문 <%=출력할변수%> --%>
	
	<h2>내가 만든 Java클래스의 메서드 호출하기</h2>
	<%
	//Java에서는 class가 없으면 메서드 못만든다. 자바파일에서 클래스랑 함수 만들어놓음.
		int sum= MyClass.myFunc(1,100); //이 메서드는 static 이므로 객체생성 없이 호출할 수 있다.
		out.println("1~100합: "+sum); //웹브라우저에 출력
		System.out.println("1~100합: "+sum); //로그에 출력
	%>
</body>
</html>





