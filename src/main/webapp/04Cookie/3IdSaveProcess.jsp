<%@page import="utils.JSFunction"%>
<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
/* getParameter(), getParameterValues() 
	전송된 폼값을 받는다. */

String user_id = request.getParameter("user_id");
String user_pw = request.getParameter("user_pw");
String save_check = request.getParameter("save_check"); //항목이 하나라서 getParameter() 가능
	//배열로 받을 때 .getParameterValues() =.=> String[] a = request.getParameterValues(name)
	

if("must".equals(user_id) && "1234".equals(user_pw)){ //id,pw 일치여부
	if(save_check !=null && save_check.equals("Y"))	// 체크박스 체크 했을 때 쿠키 생성
		CookieManager.makeCookie(response, "loginId", user_id, 60*60*24); //로그인 아이디, 유효기간은 1일
	else CookieManager.deleteCookie(response, "loginId"); //체크박스 체크 풀었을 때 쿠키 삭제
	
	JSFunction.alertLocation("로그인성공", "3IdSaveMain.jsp", out);
}
else 
	JSFunction.alertBack("로그인실패", out);
%>
<!--     <script>
   		alert("로그인실패");
	  	history.back();"
	</script>
 -->    
    