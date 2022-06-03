<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL -choose ~when ~otherwise</title>
</head>
<!-- c:choose
	java 의 switch 문과 유사하다.
	하나 이상의 c:when, c:otherwise와 같은 하위 tag를 가질 수 있다.
 -->
<body>
	<c:set var="number" value="100"></c:set>
	
	<h4>choose</h4>
	<c:choose>
		<c:when test="${number mod 2 eq 0 }"> ${number }: 짝수</c:when>
		<c:otherwise>${number }: 홀수</c:otherwise>
	</c:choose>
	
	<h4>국,영,수 점수 입력하면 평균과 학점 출력</h4>
	<form action="">
		국 : <input type="text" name="kor"/><br>
		영 : <input type="text" name="eng"/><br> 
		수 : <input type="text" name="mat"/><br>
		<input type="submit" value="학점 구하기"/>
	</form>
	
	<!-- 최초실행 시 전송한 폼값이 없으므로 출력물이 없다. 
		empty를 통해 파라미터가 빈 값인지 확인한다.-->
		
	<c:if test="${empty param.kor or empty param.eng or empty param.mat }" var="rs" >
		국,영,수 점수 입력하면 평균과 학점을 출력 합니다. </c:if>
	<c:if test="${not rs }">
		<!-- 파라미터로 전달 된 국영수 점수의 평균값을 구해 avg변수에 저장한다. -->
		<c:set var="avg" value="${ (param.kor +param.eng+ param.mat) /3 }"/>
		평균점수는 ${avg }이며,
		<c:choose>
			<c:when test="${avg>=90 }">A학점</c:when>
			<c:when test="${avg>=80 }">B학점</c:when>
			<c:when test="${avg>=70 }">C학점</c:when>
			<c:when test="${avg>=60 }">D학점</c:when>
			<c:otherwise>F학점</c:otherwise>	
		</c:choose>
		입니다.	
	</c:if>
	
	
	<!-- 텍스트 출력이 허용되는 부분만 주석작성이 가능하다.
		시작~종료태그 사이에 주석 작성하지 말 것~! -->
	
	
	
</body>
</html>