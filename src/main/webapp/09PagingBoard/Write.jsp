<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 

<%@ include file="./IsLoggedIn.jsp"%> 
<!-- 글쓰기 페이지 진입 전 로그인 확인을 위해 지시어 작성 -->
<!-- 로그인 되지 않았다면 로그인페이지로 이동한다. -->


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
<script type="text/javascript">
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
    //di값은 세션에서 얻어오기 때문에 작성하지 않는다.
}
</script>
</head>
<body>
<jsp:include page="../Common/Link.jsp" /> <!-- 액션태그 사용, 태그 실행 완료 후 결과를 삽입-->
<h2>회원제 게시판 - 글쓰기(Write)</h2>
<form name="writeFrm" method="post" action="WriteProcess.jsp"
      onsubmit="return validateForm(this);"> 
<!-- 글쓰기 처리에는 반드시 post 방식을 사용한다. get 방식은 전송량의 제한이 있어서, HTML태그를 전송하지 못할수도 있다.-->
    <!-- 작성자 아이디는 session에 저장되어있으므로 회원정보를 가져다 사용할 것이다 -->
    <table border="1" width="90%">
        <tr>
            <td>제목</td>
            <td>
                <input type="text" name="title" style="width: 90%;" />
            </td>
        </tr>
        <tr>
            <td>내용</td>
            <td>
                <textarea name="content" style="width: 90%; height: 100px;"></textarea>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button type="submit">작성 완료</button>
                <button type="reset">다시 입력</button>
                <button type="button" onclick="location.href='List.jsp';">
                    목록 보기</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
