
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h2>useBean 액션 태그</h2>
    <h3>자바빈즈 생성하기</h3>
    
<%--
    <jsp:useBean id="참조변수명" class="패키지.클래스명" scope="저장할 영역" />
    
     위 액션태그를 Java코드로 변경하면...
   		클래스 임포트, 객체 생성, 세터로 멤버변수 값 설정
    page import="common.Person"
	Person person2 = new Person();
	person2.setAge(99);
	person2.setName("김삿갓");
	request.setAttribute("person2", person2);
--%>
    <jsp:useBean id="person" class="common.Person" scope="request" />
    
    <h3>setProperty 액션 태그로 자바빈즈 속성 지정하기</h3>
<!-- DTO 객체의 세터메서드로 값설정 -->
    <jsp:setProperty name="person" property="name" value="임꺽정" /> 
    <jsp:setProperty name="person" property="age" value="41" /> 

    <h3>getProperty 액션 태그로 자바빈즈 속성 읽기</h3>
<!-- 게터로 값출력 -->
    <ul>
        <li>이름 : <jsp:getProperty name="person" property="name" /></li> 
        <li>나이 : <jsp:getProperty name="person" property="age" /></li> 
							
				<!-- 자바코드로 만든 객체는 이 방식으로 못가져오나요?-->
		<li> 이름: <%--= person2.getName(); --%></li>        
    </ul>
</body>
</html>