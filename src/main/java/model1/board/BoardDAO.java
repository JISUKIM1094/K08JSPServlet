package model1.board;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

import common.JDBConnect;

public class BoardDAO extends JDBConnect{
	public BoardDAO(ServletContext application) { //DAO클래스 생성자
		super(application); //부모클래스의 생성자 호출을 통해 DB연결
	}
	
	//board테이블에 저장 된 게시물 개수를 카운트하여 목록 출력 시 게시물의 순번 출력
	public int selectCount(Map<String, Object> map) { // 검색을 위해 매개변수는 Map컬렉션으로 선언했다.
		// String: 셀렉트 타입에 있는 제목/내용 중에 선택 된 하나. searchField
		// Object: 검색어. searchWord 
		
		int totalCnt =0;
		String query = "SELECT count(*) FROM board "; //검색어 없을 때 쿼리문
		if(map.get("searchWord") !=null) { //검색어 있을 때 조건부로 WHERE절 추가
			query += " WHERE " +map.get("searchField") + "" 
					+ " LIKE '" +map.get("searchWord")  +"%'";
		}
		try { 
			stmt = con.createStatement(); //정적쿼리문이므로 정적객체로 실행
			//동적 쿼리문: 
			rs= stmt.executeQuery(query);  
			//count(*)를 통한 쿼리문은 항상 null값이 없으므로 (0~정수) if문이 필요없다.
			rs.next(); //결과를 한 행 읽어온다.
			totalCnt = rs.getInt(1); //결과값 변수에 저장
		}catch (Exception e) {
			System.out.println("게시물 수 구하는 중 예외발생!");
			e.printStackTrace();
		}
		return totalCnt;
	}
	//목록에 출력 할 게시물을 오라클로부터 추출하기위한 쿼리문을 실행한다.
	public List<BoardDTO> selectList(Map<String, Object> map) {
		List<BoardDTO> bbs = new Vector<BoardDTO>();
		List<BoardDTO> bbs2 = new ArrayList<BoardDTO>();
		//select 한 게시물의 목록은 다수의 레코드가 포함되므로
			//이를 저장하기위해 순서를 보장하는 List계열의 컬렉션을 사용한다.
		//Set컬렉션은 순서를 보장하지 못하므로 게시판 목록을 출력하는 용도로는 사용할 수 없다.
		
		
		String query = "SELECT * FROM board ";
		//목록에 출력할 게시물을 추출하기 위한 쿼리문으로, 최근게시물 부터 노출을위해 항상 일련번호(작성순)의 역순으로 정렬.
		if(map.get("searchWord") !=null) {
			query += " WHERE " +map.get("searchField") + "" 
					+ " LIKE '" +map.get("searchWord")  +"%'";
		}
		query += "ORDER BY num DESC";
		
		try {
			stmt = con.createStatement();
			rs= stmt.executeQuery(query); 
			
			while(rs.next()) {// 추출 된 결과에 따라 갯수만큼 반복.
				// 레코드를 하나씩 읽어서 추출 후 DTO객체에 저장하기
				
				BoardDTO dto = new BoardDTO(); //DTO 객체 생성
				
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));
				
				bbs.add(dto); // 레코드 List컬렉션에 추가하기 
				
			}
		}catch (Exception e) {
			System.out.println("게시물 조회 중 예외발생!");
			e.printStackTrace();
		}
		return bbs; //List.jsp 로 컬렉션 반환
	}
}
