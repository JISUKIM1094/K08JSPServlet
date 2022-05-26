<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - response</title>
</head>

<body>
    <h2>1. 로그인 폼</h2>
    <%
    //최초 실행 시 출력되지 않는 부분
    String loginErr = request.getParameter("loginErr");
    //get방식으로 전달 된 loginErr 파라미터가 있는 경우 출력 
    if (loginErr != null) out.print("로그인 실패");
    %>
    <form action="./ResponseLogin.jsp" method="post"> 
    	<!-- 로그인을 위해 post방식 으로 form값 전송.
    		get방식으로 로그인 시 값이 주소에 노출된다.-->
        아이디 : <input type="text" name="user_id" /><br />
        패스워드 : <input type="text" name="user_pwd" /><br />
        <input type="submit" value="로그인" />
    </form>

    <h2>2. HTTP 응답 헤더 설정하기</h2>
    <form action="./ResponseHeader.jsp" method="get">
        날짜 형식 : <input type="text" name="add_date" value="2021-12-01 09:00" /><br />  
        숫자 형식 : <input type="text" name="add_int" value="8282" /><br />
        문자 형식 : <input type="text" name="add_str" value="홍길동" /><br />
        <input type="submit" value="응답 헤더 설정 & 출력" />
    </form>
</body>



</html>



