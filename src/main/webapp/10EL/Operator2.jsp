<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% //페이지 영역에 속성 저장
pageContext.setAttribute("num1", 9);
pageContext.setAttribute("num2", "10");
//empty 연산자 확인을 위해 null값을 가진 변수
pageContext.setAttribute("nullStr", null);
pageContext.setAttribute("emptyStr", "");
pageContext.setAttribute("lengthZero", new Integer[0]);
pageContext.setAttribute("sizeZero", new ArrayList());
%>    
<html>
<meta charset="UTF-8">
<head><title>표현 언어(EL) - 연산자</title></head>
<body>
    <h3>empty 연산자</h3>
    <!-- null 또는 빈 문자열, 길이가 0인 컬렉션, 크기가 0인 경우 
    	비어있는 지 확인하는 empty연산자는 true를 반환 -->   
    empty nullStr : ${ empty nullStr } <br />
    empty emptyStr : ${ empty emptyStr } <br />
    empty lengthZero : ${ empty lengthZero } <br />
    empty sizeZero : ${ empty sizeZero }
    
    <h3>삼항 연산자</h3>
    num1 gt num2 ? "참" : "거짓" => ${ num1 gt num2 ? "num1이 크다" : "num2가 크다" }
    

    <h3>null 연산</h3>
    <!-- EL에서는 null을 0으로 판단한다.  -->
    <%-- null + 10 : ${ null + 10 } 
    	<!-- null 때문인지 이클립스에서는 오류 발생.. 하지만 실행에 문제 없음 --><br /> --%>
    nullStr + 10 : ${ nullStr + 10 } <br />
    param.noVar > 10 : ${ param.noVar > 10 }
</body>
</html>
