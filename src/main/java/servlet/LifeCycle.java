package servlet;

import java.io.IOException;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/13Servlet/LifeCycle.do")
public class LifeCycle extends HttpServlet{
	
	
	
	@Override
	public void init() throws ServletException { //서블릿 객체 생성 후 딱 한번만 호출.
		System.out.println("init() 호출");
		//서블릿 초기화 
	}//2번
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("service() 호출");
		super.service(req, resp);
		// 전송방식에 상관없이 먼저 호출 된 후 클라이언트의 요청을 분석하여 doGet / doPost 호출
	}//3번
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doGet() 호출");
		req.getRequestDispatcher("/13Servlet/LifeCycle.jsp").forward(req, resp);
		// GET방식 요청 처리
	}//4번
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doPost() 호출");
		req.getRequestDispatcher("/13Servlet/LifeCycle.jsp").forward(req, resp);
		// POST방식 요청 처리
	}//4번
	
	@Override
	public void destroy() { //서블릿이 새롭게 컴파일 되거나 서버가 종료 될 때 호출
		System.out.println("destroy() 호출");
		// 메모리에서 서블릿 객체 소멸
	}//5번
	
	@PreDestroy // @어노테이션을 통해 생성한다. 함수명을 맘대로 지정 할 수 있다.
	public void myPreDestroy() { 
		System.out.println("생성한 메서드, PreDestroy() 호출");
		//destroy() 호출 후 후처리를 위해 사용된다.
	}//6번
	
	@PostConstruct // @어노테이션을 통해 생성한다. 함수명을 맘대로 지정 할 수 있다.
	public void myPostConstruct(){ //최초로 호출되는 메서드.
		System.out.println("생성한 메서드, PostConstruct()호출");
		//init()메서드 호출 전에 전처리를 위해 사용된다.
	}//1번
	
	
}
