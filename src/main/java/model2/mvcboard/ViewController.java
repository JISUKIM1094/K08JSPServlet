package model2.mvcboard;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//애너테이션 맵핑. 요청명을 해당 컨트롤러 상단에 기술한다.
@WebServlet("/mvcboard/view.do") //기술에 오류가 있으면 톰캣시작 불능
public class ViewController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 서블릿의 수명주기 메서드 중 사용자의 요청을 전송방식에 따라 doGet, doPost로 분기해주는 역할
			//이므로 방식에 상관없이 요청 처리도 가능하다.
		MVCBoardDAO dao = new MVCBoardDAO(); //커넥트풀을 통해 DB연결
		String idx =req.getParameter("idx"); // 일련번호 파라미터로 획득
		dao.updateVistiCount(idx); //조회수 증가
		MVCBoardDTO dto = dao.selectView(idx); //게시물 내용 조회
		dao.close();
		
		dto.setContent(dto.getContent().replaceAll("\r\n", "<br>")); //내용 줄바꿈태그 처리 
		
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/14MVCBoard/View.jsp").forward(req, resp);
	}
}
