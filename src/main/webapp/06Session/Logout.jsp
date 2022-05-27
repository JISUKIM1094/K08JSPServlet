<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% //로그아웃

//로그인 한 회원정보 삭제
session.removeAttribute("UserId");
session.removeAttribute("UserName");
//세션영역의 모든 속성 삭제
session.invalidate();


response.sendRedirect("LoginForm.jsp");
%>