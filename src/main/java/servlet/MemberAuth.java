package servlet;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import membership.MemberDAO;
import membership.MemberDTO;

//수명주기 메서드 사용이유: 
//어차피 서블릿을 구동하면 실행되는 메서드이므로 
//각 스텝에 맞게 메서드를 작성하여 호출.



public class MemberAuth extends HttpServlet{ //MVC패턴으로 회원인증을 처리하기 위한 서블릿 정의
	MemberDAO dao; //서블릿 멤버변수
	@Override
	public void init() throws ServletException { //최초 한번만 실행되는 수명주기 메서드.
		//DB접속 메서드 호출하기
		
/////////////////////////////////////////////////////////////////		
		ServletContext application = this.getServletContext(); //내장객체 application 얻어와서 사용하기.
		// 모델2는 클라이언트 요청을 서블릿에서 제일 먼저 받기 때문에 
			//(.jsp에서 생성되는) 내장객체를 직접 사용 할 수 없다.
		
		// 모델1은 클라이언트 요청을 .jsp가 제일 먼저 받기때문에 
			// 내장객체를 직접 사용할 수 있다.
			
		//web.xml에 저장 된 컨텍스트 초기화 파라미터 획득
		String driver = application.getInitParameter("OracleDriver");
		String connectUrl = application.getInitParameter("OracleURL");
		String oId = application.getInitParameter("OracleId");
		String oPass = application.getInitParameter("OraclePwd");
		
		dao = new MemberDAO(driver, connectUrl, oId, oPass);
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	//doGet,doPost 메서드 상위에서 분기해주는 메서드 이므로 두가지 전송방식 모두 처리 할 수 있다.	
		String admin_id = this.getInitParameter("admin_id"); // (web.xml에 정의 한) 서블릿 초기화 파라미터를 얻어온다.
			//해당 서블릿에서만 사용 가능 
		String id = req.getParameter("id"); //쿼리스트링에서 파라미터를 겟
		String pass = req.getParameter("pass"); //쿼리스트링 파라미터 겟
		
		MemberDTO memDTO = dao.getMemberDTO(id, pass); //DAO에 있는 회원 인증 메서드 호출
			//id pass를 통해 회원 인증 진행 후 일치정보 있으면 해당 레코드를 DTO에 저장, 반환.
			//일치정보 없으면 내용이 없는 DTO를 반환.
		
		String memberName = memDTO.getName(); //회원 이름을 통해 로그인 성공 여부 판단
		if(memberName !=null) req.setAttribute("authMessage", memberName+"회원님 HI");
		else {//회원 아니면 관리자 여부 판단
			if(admin_id.equals(id)) req.setAttribute("authMessage", admin_id+"최고 관리자");
			else req.setAttribute("authMessage", "회원이 아니야");
		}
		req.getRequestDispatcher("/13Servlet/MemberAuth.jsp").forward(req, resp); //처리 한 메시지 request영역에 저장 후 포워드.
		
	}
	
	@Override
	public void destroy() { //서블릿 종료시 DAO객체 자원 해제
		dao.close();
	}
	
	
}
