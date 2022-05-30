<%@page import="utils.JSFunction"%>
<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 수정페이지 진입시 로그인 확인! -->
<%@ include file="./IsLoggedIn.jsp"%> 

    <% //기존게시물 가져오기
    String num = request.getParameter("num"); //수정 할 게시물의 일련번호 획득
    BoardDAO dao = new BoardDAO(application);
    BoardDTO dto = dao.selectView(num); //상세보기
    String sessionId = session.getAttribute("UserId").toString();
//본인이 작성한 글이 아니면 수정할 수 없게 한다. 

	//애초에 수정하기 버튼이 안나오지만,
	//URL조작으로 수정페이지 진입이 가능하다.
		//진입 전 본인확인을 추가로 해야한다.
    if(!sessionId.equals(dto.getId())) {
    	JSFunction.alertBack("작성자 본인만 수정 가능", out);
    	return;
    }
    dao.close();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
<script>
function validateForm(form) {  // 폼 내용 검증
    if (form.title.value == "") {
        alert("제목을 입력하세요.");
        form.title.focus();
        return false;
    }
    if (form.content.value == "") {
        alert("내용을 입력하세요.");
        form.content.focus();
        return false;
    }
}
</script>
</head>
<body>
<jsp:include page="../Common/Link.jsp" />
<h2>회원제 게시판 - 수정하기(Edit)</h2>
<form name="writeFrm" method="post" action="EditProcess.jsp"
	onsubmit="return validateForm(this)"	>
<input type="hidden" name="num" value="<%= dto.getNum() %>" />  
    <table border="1" width="90%">
        <tr>
            <td>제목</td>
            <td> <input type="text" name="title" style="width:90%;"
            		value="<%= dto.getTitle() %>" />
            </td>
        </tr>
        <tr>
            <td>내용</td>
            <td>
            	
            	<!--textarea의 특징! 한줄로 붙여야 한다.
            		코드정렬 진행하면 
            		앞 뒤 태그 사이 공백이 삽입 될 수 있다.  -->
            		
            	<textarea name="content" style="width: 90%; height: 100px;"><%=dto.getContent() %></textarea>
            </td> 
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button type="submit">수정 완료</button>
                <button type="reset">다시입력</button> 
                <button type="button" onclick="location.href='List.jsp';">
                    목록 보기
                </button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>