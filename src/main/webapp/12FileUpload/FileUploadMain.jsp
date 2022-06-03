<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head><title>FileUpload</title></head>
<script>
    function validateForm(form) { 
        if (form.name.value == "") {
            alert("작성자를 입력하세요.");
            form.name.focus();
            return false;
        }
        if (form.title.value == "") {
            alert("제목을 입력하세요.");
            form.title.focus();
            return false;
        }
        if (form.attachedFile.value == "") {
            alert("첨부파일은 필수 입력입니다.");
            return false;
        }
    }
</script>
<body>
    <h3>파일 업로드</h3>
    <span style="color: red;">${errorMessage }</span>
    
    
<!-- 업로드 폼 -->
    
    <!-- 파일 업로드를 위한 form 태그에는 반드시 아래 두가지 속성이 있어야 함
    	method="post" enctype="multipart/form-data"
    	전송방식 post
    	인코딩방식 multipart/form-data
    		전송되는 것이 파일이기때문에 서버에서는 
    			리퀘스트 내장객체를 통해 폼값을 받을 수 없게됨
	-->
		<form name="fileForm" method="post" enctype="multipart/form-data"
          action="UploadProcess.jsp" onsubmit="return validateForm(this);">    
    <!--
     파일명을 그대로 사용하고 중복되는 경우 자동 인덱싱 처리하는 방식 
     	<form name="fileForm" method="post" enctype="multipart/form-data"
          action="SimpleProcess.jsp" onsubmit="return validateForm(this);">
    -->
            
        작성자 : <input type="text" name="name" value="머스트해브" /><br />
        제목 : <input type="text" name="title" /><br /> 
        카테고리(선택사항) : 
            <input type="checkbox" name="cate" value="사진" checked />사진 
            <input type="checkbox" name="cate" value="과제" />과제 
            <input type="checkbox" name="cate" value="워드" />워드 
            <input type="checkbox" name="cate" value="음원" />음원 <br /> 
        첨부파일 : <input type="file" name="attachedFile" /> <br />
        <input type="submit" value="전송하기" />
    </form>
</body>
</html>
