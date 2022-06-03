<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL -if</title>
</head>
<!-- if태그
	조건을 확인하여 실행여부 판단
	속성: 	test- EL을 이용해서 조건식 삽입
			var- test에서 판단한 결과값을 저장한다.
-->

<body>
	<c:set var="number" value="100"/>
	<c:set var="string" value="JSP"/>
	
	<h4>JSTL의 if태그로 짝/홀 판단하기</h4>
	<!-- if(number%2 ==0)  와 같은 조건의 if문. 
		해당 조건의 결과는 나머지가 0이므로 result에 true가 저장된다.-->
	<c:if test="${number mod 2 eq 0 }" var="result">
		${number }는 짝수입니다 <br> </c:if>
	result: ${result }<br>
	
	<h4>문자열비교와 else 구문 흉내내기</h4>
	<!-- if~else 구문이 없으므로 두개의 if태그를 사용한다. 
		유사한 기능의 choose 태그가 있다. -->
	<c:if test="${string eq 'Java' }" var="result2" > 문자열은 Java입니다. </c:if>
	<!-- Java의 비교연산자 ==와 equals()는 서로 다르지만,
		EL에서는 eq를 통해 값/문자열의 비교 모두 가능.
		여기서는 Java의 compareTo()와 같이 사전순으로 문자열을 비교한다. -->
	<c:if test="${not result2 }"> 'Java'가 아닙니다<br></c:if><!-- 앞 문장의 result와 반대인 경우 조건문 작성 ==else구문 -->
	
	<h4>조건식 주의사항</h4>
	<c:if test="100" var="result3"> EL이 아닌 정수를 지정하면 false </c:if>
	result3: ${result3 }<br><br>
	<c:if test="tRuE" var="result4"> 대소문자 구분없이 true인 경우 true </c:if>
	<br>result4: ${result4 }<br>
	<c:if test=" ${test}" var="result5"> EL양쪽에 공백있는 경우 false </c:if>
	<br>result5: ${result5 }<br>
	


    <h4>연습문제 : if태그</h4>
	<!-- 
	아이디, 패스워드를 입력후 submit 한후 EL식을 통해 파라미터로 받은후
	"kosmo", "1234" 인 경우에는 "kosmo님 하이룽~" 이라고 출력한다. 
	만약 틀렸다면 "아이디와 비번을 확인하세요" 를 출력한다. 
	EL과 JSTL의 if태그만을 이용해서 구현하시오.
	 -->
	<form method="get">
		아이디 : <input type="text" name="user" />
		<br />
		패스워드 : <input type="text" name="pass" />
		<br />
		<input type="submit" value="로그인" />
	</form>	
	
	<c:if test= "${not empty param.user }">
		<c:if test="${param.user eq 'kosmo' and param.pass eq '1234'}" var="result0" > ${param.user}님 하이룽~ </c:if>
		<c:if test="${not result0 }"> 아이디와 비번을 확인하세요<br></c:if>
	</c:if>	
	

</body>
</html>