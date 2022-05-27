<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//로그인창에서 사용자가 입력한 id,pass
String userId = request.getParameter("user_id");
String userPwd = request.getParameter("user_pw");
//application내장객체를 통해 web.xml에 작성 한 
	//컨텍스트 파라미터 초기화 한 정보 얻어오기
String oracleDriver = application.getInitParameter("OracleDriver");
String oracleURL = application.getInitParameter("OracleURL");
String oracleId = application.getInitParameter("OracleId");
String oraclePwd = application.getInitParameter("OraclePwd");

//JDBC를 통해 오라클접속
MemberDAO dao = new MemberDAO(oracleDriver, oracleURL, oracleId, oraclePwd);
//받아온  ID,PASS를 매개변수로 메서드 호출, 일치하는 정보가 있는 지 확인
MemberDTO memberDTO = dao.getMemberDTO(userId, userPwd);
//DB작업 종료 시 자원해제
dao.close();

if(memberDTO.getId() !=null) { //DTO객체에 있는 정보라면 로그인 성공
	session.setAttribute("UserId", memberDTO.getId()); 
	session.setAttribute("UserName", memberDTO.getName());
	//세션영역에 ID,NAME 저장, 서버종료 전까지 영역공유.
	response.sendRedirect("LoginForm.jsp"); //로그인페이지로 이동
}else {//DTO객체에 없는 정보 -회원이 아닌 경우 로그인 실패
	request.setAttribute("LoginErrMsg", "로그인오류");
	request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
	//리퀘스트영역에 실패메시지 저장, 포워드된 페이지까지만 영역공유.
}

%>