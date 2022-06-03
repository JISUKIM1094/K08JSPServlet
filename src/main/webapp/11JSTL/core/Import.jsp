<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL -import</title>
	<!-- jsp:include액션 태그와 동일, 리퀘스트 영역 공유
		서로 다른 페이지 이므로 페이지 영역은 공유되지 않음.
			==> 실행 된 결과만 포함. (액션태그 사용 시 실행-결과-삽입)
									(지시어라면 삽입-실행-결과)
		url속성에 절대경로로 지정할 경우 컨텍스트 루트명은 포함하지 않는다. -->
</head>
<body>
	<c:set var="requestVar" value="MustHave" scope="request"/> <!-- 리퀘스트 영역에 변수 저장 -->
	<c:import url="/11JSTL/inc/OtherPage.jsp" var="contents"> 
	<!-- 결과가 var속성 변수명에 저장됨 -->
	<!-- var속성 미사용 시 해당 위치에 포함되어 즉시 출력됨. -->
		<!-- import태그 하위태그로 param을 사용하여 
			지정 된 페이지로 파라미터 전달 -->
		<c:param name="user_param1" value="JSP" />
		<c:param name="user_param2" value="기본서" />
	</c:import>
	
	

	
	
	<h4>다른문서 삽입하기</h4>
	<!-- var에 지정한 변수를 EL로 출력하는 곳에 포함되어 출력됨 
	선언과 출력을 별도로 할 수 있으므로 코드 정리시 편리 -->
	${contents } 
	
	
	<h4>외부자원 삽입하기</h4>
	<!-- http~ 외부 url도 import태그로 가져올 수 있다. -->
	<iframe src="../inc/GoldPage.jsp" style="width:100%; heigh:600px;"></iframe>
</body>
</html>