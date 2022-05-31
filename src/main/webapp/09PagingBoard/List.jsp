<%@page import="utils.BoardPage"%>
<%@page import="model1.board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    BoardDAO dao = new BoardDAO(application); //DAO객체 생성 -오라클DB접속
    //application내장객체를 매개변수로 하는 생성자 호출, web.xml 파라미터를 직접 읽어온다.
    
    //application.getInitParameter("변수") --> 오라클 드라이버 로드, 커넥션 url생성, 계정 id/pass
    
    Map<String, Object> param = new HashMap<String, Object>();
    //검색어가 있는 경우 파라미터 저장을 위해 Map계열의 컬렉션을 생성한다.

    //파라미터 획득하기
    String searchField = request.getParameter("searchField"); //제목,내용 셀렉트타입 인풋태그
    String searchWord = request.getParameter("searchWord"); 
    if( searchWord!=null){ //파라미터 있을 때 =검색어 있을 때 
    	//map컬렉션 param에 저장한다.	
		param.put("searchField", searchField); //검색을 위한 테이블 컬럼명: title, content 
		param.put("searchWord", searchWord); //클라이언트가 입력한 검색어
		//목록에 최초진입시에는 파라미터 없는 상태.
	}
	int totalCnt = dao.selectCount(param); //board 테이블에 저장 된 게시물의 개수 카운트
	
	
//************************************************페이지 처리
	//컨텍스트 초기화 파라미터를 얻어온 후 사칙연산을 위해 정수로 변환
	int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
	int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
	//전체페이지 수 계산 - (전체 게시물 개수/ 페이지당 게시물 개수) 결과의 올림
	int totalPage = (int)Math.ceil((double)totalCnt / pageSize);
	
	//목록에 첫 진입 시 페이지관련 파라미터가 없는 상태이므로 무조건 1page로 지정.
	int pageNum=1;  //List.jsp :파라미터가 없는 상태(Null)
					//List.jsp?pageNum= :파라미터가 있지만 값이 없는 상태("빈값")
	//파라미터 pageNum이 있다면 request 내장객체를 통해 획득한 후 페이지번호로 지정한다.
	String pageTemp = request.getParameter("pageNum"); //List.jsp?pageNum=2
	if(pageTemp !=null && !pageTemp.equals(""))
		pageNum = Integer.parseInt(pageTemp);
	
	//각 게시물의 구간을 계산한다.
	int start= (pageNum-1) * pageSize +1; //각 페이지에서의 시작번호 (rowNum)
	int end= pageNum * pageSize; //각 페이지에서의 종료번호 (rowNum)
	
	//계산 된 값을 DAO로 전달하기 위해 Map컬렉션에 저장한다.
	param.put("start",start);
	param.put("end",end);
	List<BoardDTO> boardLists = dao.selectListPage(param);
//****************************************************************
	
	
	
//검색어가 있을 때 해당 조건에 맞는 게시물만 select 해야 하므로
//검색어 여부에 따라 where절이 조건부로 추가된다.
	dao.close();//자원해제
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
</head>

<body>
    <jsp:include page="../Common/Link.jsp" />  

    <h2>목록 보기(List) -현재 페이지 : <%=pageNum %>(전체: <%= totalPage %>) </h2>
    <form method="get">  
    <table border="1" width="90%">
    <tr>
        <td align="center">
            <select name="searchField"> 
                <option value="title">제목</option> 
                <option value="content">내용</option>
            </select>
            <input type="text" name="searchWord" />
            <input type="submit" value="검색하기" />
        </td>
    </tr>   
    </table>
    </form>
    <table border="1" width="90%">
        <tr>
            <th width="10%">번호</th>
            <th width="50%">제목</th>
            <th width="15%">작성자</th>
            <th width="10%">조회수</th>
            <th width="15%">작성일</th>
        </tr>
<%
if (boardLists.isEmpty()) { //List 컬렉션에 저장된 내용이 없을 때
	//true를 반환하는 isEmpty()메서드로 출력할 게시물이 있는 지 확인
%>
        <tr>
            <td colspan="5" align="center">
                등록된 게시물이 없습니다^^*
            </td>
        </tr>
<%
}
else { //게시물이 있는 경우
    int virtualNum = 0;  //게시물의 출력번호
    int cntNum=0;
    for (BoardDTO dto : boardLists) //목록에 출력할 레코드 추출 후 게시물의 개수만큼 반복
    {
        /* virtualNum = totalCnt--;   //전체 레코드 수 -1씩 하면서 리스트에 출력 */
      //
    	virtualNum = totalCnt- (((pageNum-1)*pageSize) +cntNum++); //현재페이지 번호 적용 한 게시물 번호 출력
%>
        <tr align="center">
            <td><%= virtualNum %></td>  
            <td align="left"> 
                <a href="View.jsp?num=<%= dto.getNum() %>"><%= dto.getTitle() %></a> 
            </td>
            <td align="center"><%= dto.getId() %></td>           
            <td align="center"><%= dto.getVisitcount() %></td>   
            <td align="center"><%= dto.getPostdate() %></td>    
        </tr>
<%
    }
}
%>
    </table>
    <table border="1" width="90%">
        <tr align="center">
        	<td> 
				<!--request.getRequestURI() 내장객체를 통해 현재 페이지 경로명 (호스트부분 제외)을 얻는다.  	 -->
        		<%= BoardPage.pagingStr(totalCnt, pageSize, blockPage, pageNum, request.getRequestURI()) %>   
        	</td>
            <td><button type="button" onclick="location.href='Write.jsp';">글쓰기
                </button></td>
        </tr>
    </table>
</body>

</html>