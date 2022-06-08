package model2.mvcboard;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import fileupload.FileUtil;
import utils.JSFunction;

public class WriteController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/14MVCBoard/Write.jsp").forward(req, resp);
	// 글쓰기 페이지 진입 메서드 (단순 페이지 이동) 처리 -GET 전송방식 이용
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//12FileUpload UploadProcess.jsp 참고
		
		String saveDirectory= req.getServletContext().getRealPath("/Uploads"); //물리적 경로 설정
		//req.getServletContext()를 통해 application 얻어오기
		ServletContext application = getServletContext();//web.xml 파라미터 얻어오기 위해 application 객체 사용
		int maxPostSize= Integer.parseInt(application.getInitParameter("maxPostSize")); //업로드 제한 용량 지정
		
		MultipartRequest mr= FileUtil.uploadFile(req,saveDirectory,maxPostSize); //파일 업로드
		if(mr ==null) { //업로드 실패시
			JSFunction.alertLocation(resp, "첨부파일이 제한용량을 초과합니다.", "../mvcboard/write.do"); 
			return; 
			
//파일 첨부 완료
		//만약 글 작성 시 파일을 첨부하지 않는다면 업로드 실패일까?
			// 아니다 무조건 mr객체 생성은 실행되어 null값이 아니게 된다.
			// 객체생성이 되지 않는다면 나머지 폼값을 받을 수 없기 때문에 이렇게 만들었다..!!!!! 
		// 첨부파일 초과 업로드 실패시에만 null값을 가진다.
		}
		
		//첨부파일 이외의 폼값 받기 
			//request가 아닌 mr로 받아서 DTO에 저장한다.
		MVCBoardDTO dto = new MVCBoardDTO();
		dto.setName(mr.getParameter("name"));
		dto.setTitle(mr.getParameter("title"));
		dto.setContent(mr.getParameter("content"));
		dto.setPass(mr.getParameter("pass"));
		
		String fileName= mr.getFilesystemName("ofile"); //mr객체를 통해 서버에 저장 된 파일이름 획득
    	
		//첨부된 파일이 있는경우 파일명 변경하여 DTO에 저장한다.
		if(fileName!=null) { 
    		String now= new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date()); //현재날짜,시간(초의 밀리세컨즈 까지 이용) 으로 파일이름 생성
    		String ext= fileName.substring(fileName.lastIndexOf(".")); //파일명에서 확장자 앞 .(닷)의 인덱스를 통해 확장자획득
    		String newFileName= now+ext; //파일이름과 확장자를 합하여 파일명 생성
    		//서버에 저장 된 파일명을 새로운 파일명으로 변경한다.
    		File oldfile= new File(saveDirectory+ File.separator + fileName); //서버의 물리적 경로 + 파일구분자("/" or "\") + 기본 파일명
    		File newfile= new File(saveDirectory+ File.separator + newFileName); //
    		oldfile.renameTo(newfile);  
    		
    		dto.setOfile(fileName);
    		dto.setSfile(newFileName);
    	}
    	//새로운 게시물을 테이블에 저장한다.
    	MVCBoardDAO dao = new MVCBoardDAO();
    	int result = dao.insertWrite(dto);
    	//커넥션풀 자원 반납
    	dao.close();
    	
    	//서블릿에서 특정 요청명으로 이동 시 응답.sendRedirect(요청명)
    	if(result==1) resp.sendRedirect("../mvcboard/list.do"); //insert성공 시 목록으로 이동
    	else resp.sendRedirect("../mvcboard/write.do"); //실패 시 작성페이지로 다시 이동
    	
	// 내용작성 후 글쓰기 처리 (submit) -POST 전송방식 이용
	}
}

