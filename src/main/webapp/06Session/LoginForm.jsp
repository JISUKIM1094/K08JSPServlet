<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session</title>
</head>

<body>
<!-- 액션태그를 이용해 공통링크로 사용할 페이지를 인클루드한다. -->
	<jsp:include page="../Common/Link.jsp" />
    <h2>로그인 페이지</h2>
    <span style="color: red; font-size: 1.2em;"> 

<!--로그인 처리 페이지에서 회원정보를 찾지 못한 경우 
	request영역에 속성값 저장 후 에러메시지를 화면에 출력한다. 
	삼항연산자로 표현. 
-->    
        <%= request.getAttribute("LoginErrMsg") == null ?
                "" : request.getAttribute("LoginErrMsg") %>

    </span>
<!-- if절 시작 -->
    <%
    if (session.getAttribute("UserId") == null) { //session영역 id속성값이 저장되어있지 않다면
    //로그아웃 상태이므로 로그인 폼을 출력한다.
    %>
    <script>
    function validateForm(form) { //로그인 폼에 값이 입력 되었는 지 검증
        if (!form.user_id.value) { //not연산자 사용
            alert("아이디를 입력하세요.");
            form.user_id.focus();
            return false;
        }
        if (form.user_pw.value == "") { //비교연산자 사용
            alert("패스워드를 입력하세요.");
            form.user_pw.focus();
            return false;
        }
    }
    </script>
    
    <form action="LoginProcess.jsp" method="post" name="loginFrm"
        onsubmit="return validateForm(this);"> <!-- from태그의 DOM객체를 this를 통해 전달 -->
        아이디 : <input type="text" name="user_id" /><br />
        패스워드 : <input type="password" name="user_pw" /><br />
        <input type="submit" value="로그인하기" />
    </form>
<!-- if절 종료, else절 시작-->
    <%
    } else {  //session영역 id속성값이 저장되어있다면 
        //로그인 상태이므로 로그아웃 버튼을 출력한다.

    %>
        <%= session.getAttribute("UserName") %> 회원님, 로그인하셨습니다.<br />
        <a href="Logout.jsp">[로그아웃]</a>
<!-- else절 종료 -->
    <%
    }
    %>
</body>




</html>