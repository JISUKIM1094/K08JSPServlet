package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("*.one") //요청명 퉁치기
public class FrontController extends HttpServlet{
	@Override //get방식이 디폴트
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String uri = req.getRequestURI(); //req 내장객체를 통해 현재 요청 된 URI를 얻어온다.
		// 호스트를 제외한 컨텍스트 루트부터의 주소 uri= url - host/ 
			System.out.println(uri);
		int lastSlash = uri.lastIndexOf("/"); //URL에서 마지막에 있는 /의 index값을 찾는다.
			System.out.println(lastSlash);
		String commandStr = uri.substring(lastSlash); // /의 index값을 통해 URI를 잘라서 마지막 요청명 부분만 획득한다.
			System.out.println(commandStr);
		// 마지막 요청명을 통해 어떤 요청인 지 판단 후 메서드 호출
		if(commandStr.equals("/regist.one")) registFunc(req);
		else if(commandStr.equals("/login.one")) loginFunc(req);
		else if(commandStr.equals("/freeboard.one")) freeboardFunc(req);
		
		//요청명과 관련된 변수들을 req영역에 저장한다.
		req.setAttribute("uri", uri);
		req.setAttribute("commandStr", commandStr);
		//view로 포워드
		req.getRequestDispatcher("/13Servlet/FrontController.jsp").forward(req, resp);
	}
	
	//페이지별 처리 메서드. 요청 처리 후 request 영역에 속성 값 저장
	void registFunc(HttpServletRequest req) {
		req.setAttribute("resultValue", "<h4>회원가입</h4>");
	}
	void loginFunc(HttpServletRequest req) {
		req.setAttribute("resultValue", "<h4>로그인</h4>");
	}
	void freeboardFunc(HttpServletRequest req) {
		req.setAttribute("resultValue", "<h4>자게</h4>");
	}
}
