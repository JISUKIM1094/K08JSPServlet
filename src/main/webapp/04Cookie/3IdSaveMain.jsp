<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% //내가 만든 메서드 사용- CookieManager.readCookie()
	String loginId= CookieManager.readCookie(request,"loginId"); //loginId 이름의 쿠키 읽어오기
	String cookieCheck =""; 
	if(!loginId.equals("")) cookieCheck="checked"; //쿠키값을 읽어왔다면 checked 부여 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie - 아이디 저장하기</title>
</head>
<body>
	<h2>로그인 페이지</h2>
	<form action="3IdSaveProcess.jsp" method="post">
<%-- tabindex : 폼에서 tab버튼을 누를 때 포커스 이동 순서 부여 --%>

	<!-- 쿠키를 통해 읽어 온 값이 있는 경우 
		text상자에는 value 속성에 변수를 추가하고
		체크박스에는 checked 속성을 부여한다. -->
		아이디: <input type="text" name="user_id" value="<%=loginId %>"  tabindex="1"> 
			<input type="checkbox" name="save_check" value="Y" <%= cookieCheck %> tabindex="3"> 
			아이디 저장하기 <br>
		패스워드: <input type="password" name="user_pw" tabindex="2"> <br>
		<input type="submit" value="로그인하기" >
	</form>
</body>
</html>