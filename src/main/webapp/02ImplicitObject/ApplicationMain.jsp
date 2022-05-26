<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 내장객체 - application </title>
</head>
<body>
	<h2>web.xml에 설정한 내용 읽어오기</h2>
	<!-- <context-param>으로 설정한 상수값 내장객체를 통해 읽어올 수 있다. -->
	초기화 매개변수: <%=application.getInitParameter("INIT_PARAM") %>
	<!--
		서블릿 된 .jsp 파일을 확인 했을 때 
		함수 _jspService 부분에서 기본적으로 내장객체가 선언 된다.
		
		스크립트렛 부분에 작성 하면 application 외 내장객체가 이미 상수로 선언 되어있어서 
		바로 사용 할 수 있다. 
		
		선언부에 작성하면 선언되지 않았으므로 에러 발생. 
	-->
	
	<h2>서버의 물리적 경로 얻어오기</h2>
<!-- 다른 운영체제에서 실행 할 때 구동 파일 위치를 찾아내기 위해 물리적 경로를 찾아온다. -->
	
	
	<!-- 이클립스에서 실행하는 .jsp 파일은 metadata 폴더 하위에 
		프로젝트와 동일한 환경을 만들어서 복사본 파일을 실행한다. 
		우리가 직접 작성한 파일은 
			C:\02Workspaces\K08JSPServlet\src\main\webapp\...
		이클립스에서 실행하는 .jsp 파일, 서버의 물리적 위치
			C:\02Workspaces\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\...
			그 전에 서블릿으로 변경 java,class로 변경시킴~
			C:\02Workspaces\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\K08JSPServlet\org\apache\jsp\_02ImplicitObject
		실제 서버(톰캣)에서 생성되는 파일의 위치
				-->
	application 내장객체: <%=application.getRealPath("/02ImplicitObject") %>

	
	
	
	
	
	<h2>선언부에 application 내장 객체 사용하기</h2>
	<%! // 내장객체는 _jspService() 메서드 내에서만 사용 가능하므로 선언부에서 바로 사용하는 것은 불가능.
	
	// 매개변수로 전달 받아 간접적으로 사용 할 수 있다. 
	public String useImplicitObject(){ 
		//해당 함수는 오버라이딩 되어있는 것은 아니고 getServletContext()메서드를 사용해서 사용 가능하다.
		return this.getServletContext().getRealPath("/02ImplicitObject");
	// getServletContext()메서드를 통해 선언부에서 내장객체를 획득
	}
	
	public String useImplicitObject(ServletContext app){
		return app.getRealPath("/02ImplicitObject");
	//스크립트렛에서 메서드 호출 시 내장객체를 매개변수로 전달		
	}
	%>
	<ul>
		<li>this 사용: <%= useImplicitObject() %></li>
		
		<li>내장객체를 인수로 전달 <%= useImplicitObject(application)%></li>
	</ul>
	
	
</body>
</html>