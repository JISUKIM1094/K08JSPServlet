<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DirectServletPrint</title>
</head>
<body>
	<h2>web.xml 매핑 후 Servlet에서 직접 출력</h2>
	<form method="post" action="../13Servlet/DirectServletPrint.do">
	<!--전달방식: POST 
		요청명: (컨텍스트 루트 제외한 상대경로) 
				../13Servlet/DirectServletPrint.do -->
		<input type="submit" value="바로가기" />
	</form>
	
</body>
</html>