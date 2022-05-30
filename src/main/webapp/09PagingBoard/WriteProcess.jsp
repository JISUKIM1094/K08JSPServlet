<%@page import="utils.JSFunction"%>
<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  


<!-- 글쓰기 전 로그인 되어있는 지 확인. session이 끊어졌을 때 대비 -->
<%@ include file = "./IsLoggedIn.jsp"%>



<%
	//폼값획득
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	//사용자가 입력한 폼 값을 저장하기 위해 DTO객체 생성			
	BoardDTO dto = new BoardDTO();
	//DTO에 데이터 저장
	dto.setTitle(title);
	dto.setContent(content);
	//작성자는 로그인 되어있으므로 세션에서 ID를 얻어온다.
	dto.setId(session.getAttribute("UserId").toString());
	
	//DB연결을 위해 DAO객체 생성
	BoardDAO dao = new BoardDAO(application);
	 
	
	
	
	
	
	/* int iResult = dao.insertWrite(dto); //insert 성공시 1 반환 */
	
	//100개입력하기!!
	int iResult =0;
	for(int i=1;i<=100;i++){
		dto.setTitle(title+"-"+i);
		iResult = dao.insertWrite(dto);
	}
	dao.close();
	
	
	
	
	
	
	
	
	if(iResult ==1) response.sendRedirect("List.jsp");
	else JSFunction.alertBack("글쓰기실패", out);
	
%>    