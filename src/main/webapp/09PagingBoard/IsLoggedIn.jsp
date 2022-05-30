<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/* session 영역에 저장 된 회원인증 관련 속성 값이 있는 지 확인하여 
	만약 없다면 로그인 페이지로 이동한다. 이 때 utils패키지에 생성한 클래스 활용
*/
if(session.getAttribute("UserId") ==null){ //세션에서 id값 얻어와서 확인
	// utils.JSFunction 클래스를 통해 자바스크립트로 경고창 띄우기.
	JSFunction.alertLocation("로그인 후 이용해라", "../06Session/LoginForm.jsp", out);
	return; //요놈은 왜나왔냐?! - _jspService 메서드 종료됨.
			// _jspService메서드에 남은 뒤코드 실행안하고 종료.
	/* return
		JS와 JSP코드가 같이 있으면 코드상으로는 순서대로 진행 될 것으로 보이지만 JS코드가 무시되고 JSP만 실행된다. */
		//response.sendRedirect("List.jsp"); 
		/* JS보다 JSP코드의 우선실행 순위가 높다.*/  
}
%>