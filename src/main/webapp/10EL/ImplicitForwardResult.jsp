<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현언어 EL - 내장객체</title>
</head>
<body>
EL은 톰캣에서 제공하는 JSP언어
출력에 특화되어있다.
<hr />
	<h2>ImplicitObjResult페이지</h2>
	<h3>각 영역에 저장 된 속성 읽기</h3>
	<!-- 포워드 되면 페이지영역이 소멸되고,
		리퀘스트 영역만 공유되므로 아래 페이지영역 부분은 출력되지 않는다. -->
	<ul>
		<li> page영역 : ${pageScope.scopeValue }</li>
		<li> request영역 : ${requestScope.scopeValue }</li>
		<li> session영역 : ${sessionScope.scopeValue }</li>
		<li> application영역 : ${applicationScope.scopeValue }</li>
	</ul>
	<!-- 여기서 가장좁은 영역인 리퀘스트 영역의 속성값이 출력됨 -->
	<h3>영역 지정 없이 속성 읽기</h3>
	<ul><li> ${scopeValue } </li></ul>
	<!-- 속성명을 각기 다르게 설정하면 EL로 출력이 매우매우매우매우 쉬워진다!!! -->
	
	<!-- 이 파일을 단독 실행한다면
		앞의 메인파일을 실행 하였으므로 세션, 어플리케이션 영역의 값이 출력된다.
		브라우저 종료/서버 종료 시에는 어플리케이션 영역 값만 출력된다.
		 -->
</body>
</html>