<%@ page import="java.util.Collection"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//get방식으로 전송 된 폼값 (String) 을 날짜형식을 통해 타임스탬프로 변경한다.
SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd HH:mm"); 
/*

	addDateHeader(헤더명, long타입의 타임스탬프): 
		응답헤더중 날짜를 추가하는 메서드로 세계표준시를 사용해서 설정한다.
		대한민국은 표준시 +09, 즉 9시간이 느리므로 9시간을 더해줘야 정상 날짜가 출력된다.
		
	


*/
long add_date = s.parse(request.getParameter("add_date")).getTime(); 
//콘솔에 시간(초) 출력
System.out.println("add_date="+add_date);
//숫자형식으로 전송 된 값은 정수로 변경한다.
int add_int = Integer.parseInt(request.getParameter("add_int"));
//<form>태그를 통해 받은 값은 문자열로 저장된다.
String add_str = request.getParameter("add_str");
 
//add 응답헤더에 값 추가
response.addDateHeader("myBirthday", add_date);
response.addIntHeader("myNumber", add_int); //add_int값을 받아와서 저장
response.addIntHeader("myNumber", 1004); //1004도 저장되지만 
//getHeaderNames() 에서는 대표로 첫번째 부여 된 값이 나오고 getHeaders()에서는 모든 값이 다 출력
response.addHeader("myName", add_str);
//set 기존 응답헤더값 수정
response.setHeader("myName", "안중근");

%>
<html>
<head><title>내장 객체 - response</title></head>
<body>
    <h2>응답 헤더 정보 출력하기</h2>
    <%
    Collection<String> headerNames = response.getHeaderNames(); //응답헤더명 획득
    for (String hName : headerNames) {
        String hValue = response.getHeader(hName); // 응답헤더값 저장 
    %>
        <li><%= hName %> : <%= hValue %></li>
        <!-- getHeader() 헤더명 myNumber의 값이 두번 출력되는데, 처음입력 값만 출력된다. -->
    <%
    }   
    %>
    
    <h2>myNumber만 출력하기</h2>
    <%
	Collection<String> myNumber = response.getHeaders("myNumber");
	for (String myNum : myNumber) {
	%>
		<li>myNumber : <%= myNum %></li> 
		<!-- getHeaders() 헤더명 myNumber의 값이 두번 출력되는데, 각각 저장 된 값이 출력된다. -->
	<%
	} 
//즉, add계열의 메서드는 헤더명을 동일하게 사용하더라도 값은 개별적으로 추가 된다.
	%>
	<!-- 응답헤더에는 개발자가 원하는 값을 추가할 수 있으므로 프로그램에 여러형태로 응용된다. -->
</body>
</html>
