<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현언어 EL - 폼값 처리</title>
</head>
<body>
	<h3>EL로 폼값 받기</h3>
		<ul>
		<!-- 폼값이 파라미터를 받을 때 EL의 내장객체 사용 -->
			<!-- param: 단일값 -->
			<li>이름: ${param.name } </li>
			<li>성별: ${param.gender }</li>
			<li>학력: ${param.grade }</li>
			<!-- paramValues: 복수개의 값. 
				배열을 통해 값을 획득한다. 
체크 한 항목만 서버로 전송되기 때문에
		아래 배열에 값이 전송되는 배열도 있고 Null 인 배열도 있다.
하지만 EL언어는 NullPointException이 발생하지 않으므로 문제가 발생하지 않는다. -->
			<li>관심사항: 	${paramValues.inter[0] }
							${paramValues.inter[1] }
							${paramValues.inter[2] }
							${paramValues.inter[3] }
			</li>
		</ul>
<!-- JSP내장객체를 통해 폼값을 획득 후 출력하는 경우
	선택된 값이 아래 출력코드를 작성 한 개수와 맞지 않는다면 에러발생.
	이 경우 if문으로 값이 존재하는 지 체크하거나 예외처리가 필요하여
	EL에 비해 비효율적이다.  -->		
		<h3>JSP내장객체를 통해 폼값 받기</h3>
		<%
		String name = request.getParameter("name");
		String[] interArr = request.getParameterValues("inter");
		out.println("이름"+name);
		out.println("관심사항 1"+interArr[0]);
		out.println("관심사항 2"+interArr[1]);
		
		%>
</body>
</html>