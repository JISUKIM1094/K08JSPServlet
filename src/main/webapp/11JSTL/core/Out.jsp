<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL -out</title>
<!-- 영역에 저장 된 변수 출력
	escapeXml="true" 일 때 
		HTML태그를 그대로 출력. innerText() 와 동일 -->
</head>
<body>
	<c:set var="iTag"> iTag는 <i>기울임<i>을 표현</c:set> <!-- 변수선언 -->
	
	<h4>기본사용</h4>
	<c:out value="${iTag }"/>
	
	<h4>escapeXml</h4>
	<!-- escapeXml="true" 가 디폴트. -->
	<c:out value="${iTag }" escapeXml="false"/><!-- innerHTML() 과 동일-->
	
	<h4>default</h4>
	<c:out value="${param.name }" default="파라미터 네임 값 없으므로 이름없음 출력"/>
	<!-- 주소~?name=이름값 넣으면 이름값 출력-->

	<c:out value="" default="null일 때는 이게 출력되겠지만.. 빈문자열도 값이라서 출력안됨"/>

	<h4>default 알람띄우기</h4>	
	<c:out value="${param.js }" default="${JSFunction.alertMsg('입력값이 없다.',out) }" escapeXml="false" />
	<!-- 파라미터 js 값이 없으므로 default에 지정 된 EL이 실행된다.
		EL은 자바스크립트 실행을 위해 제작 된 JSFunction클래스의 alertMsg메서드를 호출한다. 
스크립트 태그를 포함 한 문자열이 HTML문서에 출력 되면 JS함수가 실행되므로 
			escapeXml="false"-->
</body>
</html>