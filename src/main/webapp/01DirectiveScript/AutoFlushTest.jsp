<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" buffer="1kb" autoFlush="false"%>
    <!-- 1kb= 천바이트 -->
    
<!--  JSP는 화면상에 내용 출력 시 항상 버퍼에 먼저 저장한다 
	buffer 속성을 통해 버퍼 사용여부(용량)를 설정 할 수 있고
	autoFlush 속성을 통해 버퍼가 꽉 찬 경우 내보내기 할 지 설정한다.-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> buffer autoFlush </title>
</head>
<body>
<%
	for(int i=0; i<=100; i++)
		out.println("abcde12345");
/*	for문으로 10글자(10byte)를 100번 반복하여 출력 = 1000byte
	html 태그들의 용량과 합하면 1kb를 초과하는데, 
	autoFlush가 false이므로 실행 시 에러발생
*/
%>
</body>
</html>
<!-- java.io.IOException: JSP 버퍼 오버플로우 
	해결 방법은 autoFlush를 true로 바꾼다. (buffer의 용량을 늘리거나) 
	일반적으로 autoFlush를 false로 쓰지 않는다.-->