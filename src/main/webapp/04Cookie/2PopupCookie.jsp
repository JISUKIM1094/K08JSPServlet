<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!-- trimDirectiveWhitespaces : 지시어 속성 중 
	상단의 불필요한 공백을 삭제하는 기능을 가진다. 
	콜백 데이터는 해당 페이지에 출력되는 모든 소스코드를 반환하게 되는데
	공백도 하나의 문자이므로 필요없는 경우 제거해야한다. 
	
		불필요한 공백을 데이터가 있는 것으로 간주하여 콜백데이터를 보내는 오류가 생길 수 있다. -->
    <%
    // 하루동안 열지않음 체크박스 체크 후 닫기버튼을 누르면 값 1이 파라미터로 전달된다.
    String chkVal = request.getParameter("inactiveToday"); //체크박스에서 체크했을 때 값
    
    if(chkVal !=null && chkVal.equals("1")){ //파라미터의 값이 null이 아니면서 1인 경우 
    	Cookie cookie = new Cookie("PopupClose","off"); //쿠키생성
    	cookie.setPath(request.getContextPath()); //쿠키의 경로지정
    	cookie.setMaxAge(3600*24); //쿠키 유지시간
    	response.addCookie(cookie); //응답헤더에 쿠키를 싣고 클라이언트로 전송
    	out.println("쿠키: 하루동안 열지 않음"); //콜백 데이터 출력
    }
    %>
     