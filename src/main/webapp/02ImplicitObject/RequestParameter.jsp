<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
</head>
<body>
<%

request.setCharacterEncoding("UTF-8"); //post방식에서 한글 표현 시 깨짐 현상 처리 - 나중에 필터 를 통해서 전체에 적용하는 거  함

//form값을 받을 때 사용하는 함수 
	// getParameter("value속성"): 하나의 값 String 만 얻을 때 - input 태그 중 text, radio 타입 
	// getParameterValues("value속성"): 두개 이상의 값을 배열로 String[] 얻을 때 - checkbox, select 태그에 multiple속성을 부여한 경우 
String id= request.getParameter("id");
String sex= request.getParameter("sex");
String[] favo= request.getParameterValues("favo");

String favoStr="";
if(favo !=null){
	for(int i=0; i<favo.length;i++) favoStr += favo[i]+" ";
}
//<textarea> 태그는 두 줄 이상 입력이 가능하므로 엔터키를 <br>태그로 변경한다.
	// 엔터키로 표현 된 "\r\n"는 줄바꿈 적용이 안된다.
String intro = request.getParameter("intro").replace("\r\n", "<br>");
%>

<ul>
	<li>아이디: <%= id%></li>
	<li>성별: <%= sex%> </li>
	<li>관심사항: <%= favoStr%> </li>
	<li>자기소개: <%= intro%> </li>
</ul>
</body>
</html>