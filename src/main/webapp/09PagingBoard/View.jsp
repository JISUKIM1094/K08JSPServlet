<%@page import="model1.board.BoardDTO"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String num =request.getParameter("num"); //파라미터로 전달 된 게시물의 일련번호 획득
    BoardDAO dao = new BoardDAO(application); //DB연결
    dao.updateVistiCount(num); //게시물 조회수++
    BoardDTO dto = dao.selectView(num); //일변번호에 해당하는 게시물 조회
    dao.close();//자원해제
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
<script>
function deletePost() {
    var confirmed = confirm("정말로 삭제하겠습니까?"); 
    if (confirmed) {
        var form = document.writeFrm;      
        form.method = "post"; 
        form.action = "DeleteProcess.jsp"; 
        form.submit();         
    }
}
</script>
</head>
<body>
<jsp:include page="../Common/Link.jsp" />
<h2>회원제 게시판 - 상세 보기(View)</h2>
<form name="writeFrm">
<input type="hid-den" name="num" value="<%= num %>" />  
    <table border="1" width="90%">
        <tr>
            <td>번호</td>
            <td><%= dto.getNum() %></td>
            <td>작성자</td>
            <td><%= dto.getName() %></td>
        </tr>
        <tr>
            <td>작성일</td>
            <td><%= dto.getPostdate() %></td>
            <td>조회수</td>
            <td><%= dto.getVisitcount() %></td>
        </tr>
        <tr>
            <td>제목</td>
            <td colspan="3"><%= dto.getTitle() %></td>
        </tr>
        <tr>
            <td>내용</td>
            <td colspan="3" height="100">
	            <!-- 엔터키로 처리된 부분을 <br>태그로 변경해야지만 줄바꿈되어 출력된다. -->
  				<%= dto.getContent().replace("\r\n", "<br/>") %>
            </td> 
        </tr>
        <tr>
            <td colspan="4" align="center">
            <%
//로그인이 된 상태에서 세션영역에 저장 된 아이디가 해당 게시물을 작성 한 아이디와 일치한다면 수정, 삭제 버튼을 보이게 처리한다.
            if(session.getAttribute("UserId")!=null &&session.getAttribute("UserId").toString().equals(dto.getId())) {
            %>
                <button type="button" onclick="location.href='Edit.jsp?num=<%=dto.getNum()%>';">
                    수정하기</button>
                <button type="button" onclick="deletePost();">삭제하기</button> 
            <%
            }
            %>
                <button type="button" onclick="location.href='List.jsp';">
                    목록 보기
                </button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
