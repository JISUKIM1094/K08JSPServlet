<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현언어 EL - 객체 매개변수</title>
</head>
<body>
	<h2>영역을 통해 전달 된 객체 읽기</h2>
	<ul>
	<!-- 영역에 저장된 속성에 EL로 접근할 때 속성명이 중복되지 않는 경우
		EL내장객체 없이 속성명으로 접근가능.
		 requestScope.personObj.name 형태로 기술 할 필요없음.-->
	<!-- 출력 시 형변환 필요 없음 -->
		<li>Person객체 => 이름: ${personObj.name }, 나이: ${personObj.age } </li>
		<!-- 속성명.멤버변수 형태로 기술하면 객체에 선언 된 getter()메서드가
			자동 호출되어 값을 출력한다. -->
		<li>String객체 => ${requestScope.stringObj }</li> <!-- 영역은 생략가능 -->
		<li>Integer객체 => ${integerObj }</li>
	</ul>
	
	 
	<h2>JSP내장각체로 전달 된 객체 읽기  </h2>
	<%
	//영역은 모든 객체를 저장할 수 있는 공간이므로 영역에서 객체를 꺼내 사용 할 때는 형변환이 필요하다.
	//Object로 저장 / 형변환하여 getter()로 출력 
	Object object = request.getAttribute("personObj");
	Person person = (Person)object;
	out.println("이름: " +person.getName());
	%>
	나이: <%=person.getAge() %>
	
	
	
	
	<!-- 파라미터로 전달 된 값을 읽을 때 아래 세가지 모두 사용 가능
		 param.파라미터명  param["파라미터"] param['파라미터']-->
	<h2>매개변수로 전달된 값 읽기</h2>
	<ul>
		<!-- EL식에서는 연산 가능, 
			파라미터로 전달 된 문자열을 숫자로 자동 변환-->
		<li>${param.firstNum + param['secondNum'] }</li>
		<!-- 단순 문자열로 출력 --> 
		<li>${param.firstNum } + ${param["secondNum"] }</li>
	</ul>
</body>
</html>