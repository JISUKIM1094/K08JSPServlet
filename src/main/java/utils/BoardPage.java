package utils;

public class BoardPage {
	public String pagingStr(int totalCnt, int pageSize, int blockPage, int pageNum, String reqUrl) {
		String pagingStr="";
		int totalPages=(int)(Math.ceil(((double)totalCnt / pageSize)));
		int pageTemp= (((pageNum-1)/blockPage)*blockPage)+1;
		if(pageTemp !=1) {
			pagingStr +="<a href=' "+reqUrl+"?pageNum=1'>[첫페이지]</a>";
			pagingStr += "&nbsp;";
			pagingStr +="<a href=' "+reqUrl+"?pageNum="+ (pageTemp-1) + "'>[이전 블록]</a>";
		}
		int blockCnt =1;
		while(blockCnt <= blockPage && pageTemp <=totalPages) {
			if(pageTemp == pageNum) pagingStr += "&nbsp;" + pageTemp+ "&nbsp;";
			else pagingStr += "&nbsp; <a href='" +reqUrl+"?pageNum="+pageTemp + "'>"+pageTemp+"</a>&nbsp;";
		}
		pageTemp++;
		blockCnt++;	
		
		if(pageTemp <= totalPages) {
			pagingStr +="<a href=' "+reqUrl+"?pageNum=" +pageTemp + "'>[다음 블록]</a>";
			pagingStr += "&nbsp;";
			pagingStr +="<a href=' "+reqUrl+"?pageNum="+totalPages + "'>[마지막 페이지]</a>";
		
		}
		return pagingStr;
	}
}
