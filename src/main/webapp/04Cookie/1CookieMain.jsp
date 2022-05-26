<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 쿠키
  	클라이언트의 상태 정보를 유지하기 위한 기술로 클라이언트의 PC에 파일로 저장된다.
  	쿠키 하나의 크기는 4kb이고, 1.2MB(3000개) 까지 만들 수 있다. -->
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie</title>
</head>
<body>
	<h2>1. 쿠키설정</h2>
	<%
	/* 쿠키는 생성자를 통해서만 생성할 수 있다.
		쿠키는 setName()이라는 메서드가 없기때문에 생성 후 이름 변경이 불가능하다.*/
	Cookie cookie = new Cookie("myCookie","쿠키맛나"); //쿠키생성
	// 쿠키 경로 설정, 컨텍스트 루트 경로로 지정하므로 웹애플리케이션 전체에서 사용 할 수 있다.
	cookie.setPath(request.getContextPath()); //컨텍스트 패스...?
	cookie.setMaxAge(3600); //쿠키 유지시간
	response.addCookie(cookie); //응답헤더에 쿠키 추가, 클라이언트 측으로 전송
	%>
<!-- 클라이언트 PC에 쿠키 생성 완료 -->

	<h2>2. 쿠키 설정 직후 쿠키값 확인하기</h2>
	<%
	/* 내장객체 request의 getCookies()를 통해 현재 생성 된 모든 쿠키를 배열의 형태로 가져온다. */
	Cookie[] cookies = request.getCookies(); //쿠키를 출력하기 위해 배열 변수에 넣는다.
	if(cookies!=null){ //쿠키가 있다면
		for(Cookie c : cookies){ //쿠키의 갯수만큼 반복
			String cookieName = c.getName(); //쿠키명
			String cookieValue = c.getValue(); //쿠키값
			out.println(String.format("%s: %s <br>", cookieName, cookieValue)); //웹브라우저에 출력
		}
	}
	%>
<!-- 쿠키생성 직후에는 값을 얻어올 수 없다. 새로고침/페이지 이동을 통해 새로운 요청이 있어야 쿠키값을 얻어올 수 있다. -->	
	
	<h2>3. 페이지 이동 후 쿠키 값 확인</h2>
		<a href="1CookieResult.jsp">여기에서 쿠키 값 확인하기</a>

</body>
</html>