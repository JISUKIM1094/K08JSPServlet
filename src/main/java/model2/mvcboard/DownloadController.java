package model2.mvcboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fileupload.FileUtil;

@WebServlet("/mvcboard/download.do")
public class DownloadController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//파라미터 가져오기
		String ofile = req.getParameter("ofile"); //원본파일명
		String sfile = req.getParameter("sfile"); //서버에 저장 된 파일명
		String idx = req.getParameter("idx"); //일련번호 - 다운로드 카운트 증가에 사용 될 파라미터.
		
		FileUtil.download(req, resp, "/Uploads", sfile, ofile);	
		
		MVCBoardDAO dao= new MVCBoardDAO();
		dao.downCountPlus(idx);
		dao.close();
	
	}
}
