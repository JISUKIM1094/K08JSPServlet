package model2.mvcboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fileupload.FileUtil;
import utils.JSFunction;

@WebServlet("/mvcboard/pass.do") 
public class PassController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		/*요청명: /mvcboard/pass.do?mode=edit&idx=162
			에서 파라미터를 얻어와야 한다.
			방법1: request내장객체 이용 -> req.getParameter("mode")
			방법2: View(.jsp)에서 EL로 param 얻어오기 -> ${param."mode" }
		*/ 
		
		
		req.setAttribute("mode", req.getParameter("mode"));
		req.getRequestDispatcher("/14MVCBoard/Pass.jsp").forward(req, resp);
	}
	
	//전송한 폼값을 받아 수정페이지로 이동 혹은 게시물 삭제처리
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//검증페이지에서 폼값을 전송받음 
		String idx= req.getParameter("idx");
		String mode= req.getParameter("mode");
		String pass= req.getParameter("pass");
		//커넥션 풀을 이용한 DB연결, PASS검증
		MVCBoardDAO dao = new MVCBoardDAO();
		boolean confirmed = dao.confirmPassword(pass, idx);
		
		dao.close();
		
		if(confirmed) { //pass일치 시 
			if(mode.equals("edit")) { //수정모드일 때 페이지 이동
				HttpSession session = req.getSession();
				session.setAttribute("pass", pass); //패스워드 세션에 저장 
				resp.sendRedirect("../mvcboard/edit.do?idx="+idx); 
					//에딧컨트롤러에서 업데이트 쿼리문에 비번 사용
			}
			else if(mode.equals("delete")) {//삭제모드일 때 삭제 진행
				

				//커넥션 풀을 이용해 DB연결
				dao = new MVCBoardDAO();
				//기존 게시물 얻어오기 (파일삭제를 위한)
				MVCBoardDTO dto = dao.selectView(idx);
				//게시물 삭제
				int result= dao.deletePost(idx);
				dao.close();//커넥션 풀에 자원반납
				
				if(result==1) { //파일 삭제
					//(게시물에 있던) 파일명을 얻어와서
					String saveFileName= dto.getSfile(); 
					// 삭제
					FileUtil.deleteFile(req, "/Uploads", saveFileName);
				}

				
				JSFunction.alertLocation(resp, "삭제되었어용","../mvcboard/list.do");
			}
		}
		else JSFunction.alertBack(resp, "비밀번호 검증 실패");
	}
}
