package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//서블릿 클래스 만들기
public class HelloServlet extends HttpServlet { //1. 클래스 상속 extends HttpServlet
	
	@Override //2. 클라이언트의 요청을 받아 처리하기위해 doGet() / doPost() 메서드 오버라이딩
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setAttribute("message", "Hello"); //req영역에 속성값 저장
		req.getRequestDispatcher("/13Servlet/HelloServlet.jsp").forward(req, resp); //JSP 페이지(View에 해당)로 포워드
/*
 리퀘스트 영역은 포워드 된 페이지까지 공유 되므로 
 서블릿에서 저장 한 속성 값을 JSP에서 사용 할 수 있다.
*/
		//3. 패키지 임포트와 예외처리는 자동완성 된다.
		//4. 내장객체를 사용 할 때 매개변수 req 사용
	}
	
	
	/*@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}*/
}
