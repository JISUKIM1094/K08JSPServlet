<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String popupMode = "on"; 

Cookie[] cookies = request.getCookies();
if (cookies != null) {
    for (Cookie c : cookies) {
        String cookieName = c.getName();
        String cookieValue = c.getValue();
        if (cookieName.equals("PopupClose")) {
            popupMode = cookieValue; 
        }
    }
} 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키를 이용한 팝업 관리</title>
<style>
    div#popup{
        position: absolute; top:100px; left:100px; color:yellow;  
        width:300px; height:100px; background-color:gray;
    }
    div#popup>div{
        position: relative; background-color:#ffffff; top:0px;
        border:1px solid gray; padding:10px; color:black;
    }
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script>
$(function() {
    $('#closeBtn').click(function() { //팝업창에 닫기버튼 누름
        $('#popup').hide(); //레이어 팝업창 닫힘.(=숨긴다.)
        var chkVal = $("input:checkbox[id=inactiveToday]:checked").val(); //하루동안 열지않음 체크박스에 값이 있을 경우 (체크 된 경우) value 획득 
		// 체크안되어있으면 얻어올 값이 없기때문에 에러가 뜬다.
		
        // jQuery ajax() 함수를 통해 요청한다.
        // 비동기 통신
        $.ajax({
            url : './2PopupCookie.jsp', //요청할 서버의 url
            type : 'get', //전송방식 get, post
            data : {inactiveToday : chkVal}, // 요청시 전송 할 값, 파라미터.
    //파라미터는 JSON객체 형식으로 기술
            dataType : "text", //콜백 데이터 형식 지정
            success : function(resData) { //성공 했을 때 콜백함수. resData == 콜백데이터
            	if(resData){
            		console.log('있다');
            	}
            	else{
            		console.log('없다');	
            	}
                if (resData != '') location.reload(); //콜백데이터 있으면 리로드(새로고침)
            }
        });
    });
});
</script>
</head>
<body>
<h2>팝업 메인 페이지</h2>
<%
    for (int i = 1; i <= 10; i++) { //텍스트 출력 단순 반복
        out.println("현재 팝업창은 " + popupMode + " 상태입니다.<br/>");
    }
    if (popupMode.equals("on")) {
		%>
	    <div id="popup">
	        <h2 align="center">공지사항 팝업입니다.</h2>
	        <div align="right"><form name="popFrm">
	            <input type="checkbox" id="inactiveToday" value="1" />
	            하루 동안 열지 않음
	            <input type="button" value="닫기" id="closeBtn" />
	        </form></div>
	    </div>
		<%
    }
%>
</body>
</html>
