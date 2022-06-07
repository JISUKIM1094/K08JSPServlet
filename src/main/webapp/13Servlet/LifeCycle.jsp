<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LifeCycle</title>
</head>

<script type="text/javascript">

	function requestAction(frm,met) { // 전송방식 결정 함수
		if(met==1) frm.method ='get';
		else frm.method = 'post';
		frm.submit(); //폼값이 전송된다.
	}
</script>

<body>
	<h2>서블릿 수명수기 Life Cycle 메서드</h2>
	<form action="./LifeCycle.do">
		<input type="button" value="Get방식 요청하기" onclick="requestAction(this.form, 1)"/>
		<input type="button" value="Post방식 요청하기" onclick="requestAction(this.form, 2)"/>
	<!-- input태그는 button타입으로 설정하여 onclick 이벤트 핸들러를 통해
			자바스크립트 함수에서 폼값을 전송하도록 설정 함. -->
	</form>
</body>
</html>