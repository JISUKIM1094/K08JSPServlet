package model2.mvcboard;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.BoardPage;

public class ListController extends HttpServlet { //게시판 목록 요청 처리를 위한 서블릿 클래스
	//목록의 경우 메뉴를 클릭한 후 이동하므로 get방식으로 요청하게 된다.
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MVCBoardDAO dao = new MVCBoardDAO(); //커넥션 풀을 이용한 DB연결을 위해 DAO객체 생성
		Map<String, Object> map= new HashMap<String, Object>(); //파라미터 및 view로 전달 할 데이터를 저장하기 위해 Map컬렉션 생성
		//검색어 관련 파라미터 처리
		String searchField = req.getParameter("searchField");
		String searchWord = req.getParameter("searchWord");
		
		if(searchWord !=null) { //검색어 입력 경우에만 
			//Model(DB)로 전달하기 위해 저장
			map.put("searchField", searchField);
			map.put("searchWord", searchWord);
		}
		int totalCnt= dao.selectCount(map); //게시물 갯수 카운트, 검색어가 있는 경우 Map컬렉션을 통해 전달됨.
		
		//페이지처리
		ServletContext application = getServletContext();//jsp가 아닌 서블릿이기 때문에 내장객체를 얻어온다. 
		//web.xml에 초기화 되어있는 컨텍스트 파라미터를 얻어온다.
		int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE")); // 한페이지 당 출력할 게시물의 개수
		int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK")); // 한 블럭 당 출력 할 페이지 번호 개수
		
		int pageNum=1; //목록에 첫 진입 시 페이지 넘버 1로 초기화
		//특정 페이지로 진입 한 경우 파라미터를 받아서 구간을 계산하여 얻어옴
		String pageTemp= req.getParameter("pageNum"); // 파라미터로 넘어오는 pageNum의 값을 얻어와서
		if(pageTemp!=null && !pageTemp.equals("")) 
			pageNum = Integer.parseInt(pageTemp); //정수로 변환 후 현재페이지 번호로 지정
		
		//게시물의 구간을 계산하여 
		int start= (pageNum-1) * pageSize +1;
		int end= pageNum * pageSize;
		//계산된 구간 값을 Model(DB)로 전달하기 위해 Map에 저장.
		map.put("start",start);
		map.put("end",end);
		List<MVCBoardDTO> boardLists = dao.selectListPage(map); //현재 페이지에 출력 할 게시물을 얻어옴
		dao.close();//커넥션풀에 자원반납
		
		//유틸리티 클래스의 페이지 번호 생성 메서드 호출, 모델1에서 사용 한 메서드와 동일.
		String pagingImg = BoardPage.pagingStr(totalCnt, pageSize, blockPage, pageNum, "../mvcboard/list.do");
		map.put("pagingImg", pagingImg); //총 게시물 개수
		map.put("totalCnt", totalCnt); //한 페이지의 게시물 개수
		map.put("pageSize", pageSize); //한 블럭당 출력 페이지 개수
		map.put("pageNum", pageNum); //현재 페이지 번호 (최초 진입 시1)
		
		//view로 전달 할 객체 request영역에 저장
		req.setAttribute("boardLists",boardLists);
		req.setAttribute("map", map);
		req.getRequestDispatcher("/14MVCBoard/List.jsp").forward(req, resp); //view로 포워드
		
		
		
		
		
		
	}
}
