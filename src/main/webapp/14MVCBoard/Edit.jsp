<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일첨부형 게시판</title>
<script type="text/javascript">
function validateForm(form) {
	if(form.name.value ==""){
		alert("작성자를 입력하세요");
		form.name.focus();
		return false;
	}
	if(form.title.value ==""){
		alert("제목을 입력하세요");
		form.title.focus();
		return false;
	}
	if(form.content.value ==""){
		alert("내용을 입력하세요");
		form.content.focus();
		return false;
	}
}
</script>
</head>
<body>
<h2>파일 첨부형 게시판 - 수정 edit</h2>
<!-- 파일 첨부를 위한 작성 폼이 
	1. 전송방식 POST
	2. 인코딩 방식 multipart/form-data -파일 업로드  
form태그를 구성 한 후 전송(submit)하면
 일반적 request객체로는 form값을 받을 수 없다.
cos.jar 확장 라이브러리가 제공하는 MultipartRe 객체를 사용해서 폼값을 받아야 한다.		
-->
<form action="../mvcboard/edit.do" name="writeFrm" method="post" 
	enctype="multipart/form-data" onsubmit="return validateForm(this);">
	<!-- 게시물 수정을 위한 일련번호, 기존 첨부되어있던 파일명 값 저장 -->
	<input type="hid den" name="idx" value="${dto.idx }">
	<input type="hid den" name="prevOfile" value="${dto.ofile }">
	<input type="hid den" name="prevSfile" value="${dto.sfile }">
	패스워드:${pass }
	<table border="1" width="90%">
	<tr>
		<td>작성자</td>
		<td> <input type="text" name="name" style="width:150px;" value="${dto.name }"/> </td>
	</tr>
	<tr>
		<td>제목</td>
		<td> <input type="text" name="title" style="width:90%;" value="${dto.title }"/> </td>
	</tr>
	<tr>
		<td>내용</td>
		<td> <textarea name="content" style="width:90%; height:100px;" >${dto.content }</textarea> </td> 
	</tr>
	<tr>
		<td>첨부파일</td>
		<td> <input type="file" name="ofile" /> 
		<!-- 인풋타입이 파일일 때 밸류 속성은 의미가 없다.
			Value 속성은 스트링 타입이므로 디비에서 처리해야 한다.
			 -->
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="submit">작성완료</button>	
			<button type="reset">RESET</button>	
			<button type="button" onclick="location.href='../mvcboard/list.do'">목록 바로가기</button>	
		</td>
	</tr>
	</table>
</form>
</body>
</html>