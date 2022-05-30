<%@page import="utils.JSFunction"%>
<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp"%> 


<%
	String num = request.getParameter("num");// 폼값받기
	
	BoardDTO dto = new BoardDTO();//데이터 객체
	BoardDAO dao = new BoardDAO(application);//DB연결
	dto = dao.selectView(num);//기존게시물 가져오기
	
	String sessionId = session.getAttribute("UserId").toString(); //Object 타입이라서 문자열로 변환
	//영역에 저장된 데이터는 모두 Object 타입이다.
	int delRs = 0; 
	
	if(sessionId.equals(dto.getId())) { //본인확인
		dto.setNum(num);
		delRs = dao.deletePost(dto); //DAO객체에 만들어 놓은 삭제 함수
		dao.close();
		
		if(delRs ==1) JSFunction.alertLocation("삭제완료", "List.jsp", out);
		else JSFunction.alertBack("삭제실패", out);
	}else {
		JSFunction.alertBack("본인이 아닙니다.",out);
		return;
	}
	
%>    

 