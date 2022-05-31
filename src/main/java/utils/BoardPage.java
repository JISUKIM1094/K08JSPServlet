package utils;

public class BoardPage {
//총 게시물 개수 //한 페이지의 게시물 개수 //한 블럭당 출력 페이지 개수 
		//현재 페이지 번호 (최초 진입 시1) //게시판 목록을 실행 한 JSP파일의 경론
	public static String pagingStr(int totalCnt, int pageSize, int blockPage, 
			int pageNum, String reqUrl) {
		String pagingStr="";
		int totalPages=(int)(Math.ceil(((double)totalCnt / pageSize))); //전체 페이지수 계산
		
		 //[이전 블록] 바로가기 링크 
		int pageTemp= (((pageNum-1)/blockPage)*blockPage)+1;
		
		if(pageTemp !=1) { //첫 페이지가 아닐 때 출력
			pagingStr +="<a href='"+reqUrl+"?pageNum=1'>[첫페이지]</a>";
			pagingStr += "&nbsp;";
			pagingStr +="<a href='"+reqUrl+"?pageNum="+ (pageTemp-1) + "'>[이전 블록]</a>";
		}
		//각 페이지 번호로 바로가기 링크 출력
		int blockCnt =1;		
		while(blockCnt <= blockPage && pageTemp <= totalPages) {
			if(pageTemp == pageNum)  pagingStr += "&nbsp;" + pageTemp+ "&nbsp;"; //현재페이지에는 링크없음
			else pagingStr += "&nbsp;<a href='" +reqUrl+"?pageNum="+pageTemp + "'>"+pageTemp+"</a>&nbsp;";
			pageTemp++;
			blockCnt++;	
		}
		
		if(pageTemp <= totalPages) { //다음 블럭 바로가기 링크 출력
			pagingStr +="<a href=' "+reqUrl+"?pageNum=" +pageTemp + "'>[다음 블록]</a>";
			pagingStr += "&nbsp;";
			pagingStr +="<a href=' "+reqUrl+"?pageNum="+totalPages + "'>[마지막 페이지]</a>";
		
		}
		return pagingStr;
	}
}
