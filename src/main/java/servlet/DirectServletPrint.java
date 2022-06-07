package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 보통 서블릿에서 출력하지 않지만 가끔 그럴 때가 있따..통신..??

public class DirectServletPrint extends HttpServlet{ //HttpServlet 상속하면 서블릿 생성 준비완료

	@Override	// 사용자의 요청을 처리 할 메서드 오버라이딩
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//요청 부분에서의 전송방식이 POST 이므로 doPost를 오버라이딩 한다.
		resp.setContentType("text/html;charset=UTF-8"); 
		//자바문서(서블릿)에서 HTML 출력을 하기위해 문서의 컨텐츠 타입 설정.
			// .jsp에서는 이미 지시어로 포함이 되어있다. 
		PrintWriter writer = resp.getWriter(); //직접 출력을 위해 PrintWriter 객체 생성
		//웹페이지에 출력 될 HTML코드 작성 
		writer.println("<html>");
		writer.println("<head><title>DirectServletPrint</title></head>");
		writer.println("<body>");
		writer.println("<h2>서블릿에서 직접출력</h2");
		writer.println("<p>jsp로 포워드 안함</p>");
		writer.println("</body>");
		writer.println("</html>");
		
		writer.close(); //자원 반환..?
	}

}
/*	404에러발생 : 요청 된 전송방식과 처리 할 메서드가 일치 하지 않을 때
		- 클라이언트는 get방식으로 요청 , 서블릿에서는 doPost 메서드만 있으면 에러 
	
	현재 페이지는 POST방식으로 전송 받은 것을 처리할 수 있는 doPost 메서드가 정의 되어있는데
	요청 없이 서블릿만 실행 했을 때는 전송받은 사항이 없으므로 
	디폴트인 GET방식으로 전송방식을 인지하고 메서드와 일치 하지 않은 에러페이지가 출력된다.  
 */