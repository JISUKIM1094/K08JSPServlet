<%@page import="utils.JSFunction"%>
<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp"%> 


<%
	//폼값받기
	String num = request.getParameter("num");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	//폼값저장
	BoardDTO dto = new BoardDTO();
	dto.setNum(num);
	dto.setTitle(title);
	dto.setContent(content);
	/* dto.setId(session.getAttribute("UserId").toString()); */
	//CRUD 수행	
	BoardDAO dao = new BoardDAO(application);
	int affected = dao.updateEdit(dto); 
	//자원반납
	dao.close();

	//수정완료 시 1반환 -- insert는 1행씩 수행 
	if(affected ==1) response.sendRedirect("View.jsp?num="+dto.getNum()); //수정 후 내용 페이지로 이동 
	else JSFunction.alertBack("수정실패", out); //실패시 뒤로이동. 수정진행 페이지.
	
%>    

 