package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/13Servlet/AnnoMapping.do")
// xml에 매핑하는 대신 어노테이션으로 요청명에 대한 매핑진행. 편한 방법이지만 유지보수를 위해
	// 요청명, 서블릿 클래스의 관계가 명확할 때 사용해야한다.
public class AnnoMapping extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("message", "@WebServlet으로 매핑 "); //req영역에 속성값 저장
		req.getRequestDispatcher("/13Servlet/AnnoMapping.jsp").forward(req, resp); //JSP 페이지(View에 해당)로 포워드
	}
}
