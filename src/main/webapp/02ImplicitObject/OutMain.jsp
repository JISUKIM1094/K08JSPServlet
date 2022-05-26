<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체 - out</title>
</head>
<body>
	<%
	out.print("출력되지 않는 텍스트<br>"); //out객체를 통해 print메서드 호출
	
	//out.print("출력 버퍼 크기:"+ out.getBufferSize()+"<br>");
	//out.print("남은 버퍼 크기:"+ out.getRemaining()+"<br>");
	//out.flush();
	
	out.clearBuffer();//출력되기 전에 버퍼의 내용을 삭제하기 때문에 출력되지 않는다. 
	
	
	out.print("<h2>out내장객체</h2>");
	out.print("출력 버퍼 크기:"+ out.getBufferSize()+"<br>");
	out.print("남은 버퍼 크기:"+ out.getRemaining()+"<br>");
	
	out.flush(); //버퍼에 저장된 내용 출력 함수
	out.print("flush() 이후 남은 버퍼 크기:"+ out.getRemaining()+"<br>");
	
	//오버로딩 되어있어, 다양한 타입의 값을 출력할 수 있다.
	out.print(1);
	out.println(false);
	out.print("가");
	out.println('나');
	/*
	print()와 println()의 차이
		println() 문자열 뒤에 \n이 추가 되어있는 것.
		웹브라우저에서 \n은 줄바꿈으로 적용되지 않고 
			한칸 띄우는것으로만 출력됨. 
			(줄바꿈은 <br>이 필요하다.)
	*/
	%>
</body>
</html>