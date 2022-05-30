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

	
	
	
	
//1. board테이블에 저장 된 게시물 개수를 카운트하여 목록 출력 시 게시물의 순번 출력

	public int selectCount(Map<String, Object> map) { 
	// 검색을 위해 매개변수는 Map컬렉션으로 선언했다.
	// String: 셀렉트 타입에 있는 제목/내용 중에 선택 된 하나. searchField
	// Object: 검색어. searchWord 
		
		int totalCnt =0;
		String query = "SELECT count(*) FROM board ";
		//검색어 있을 때 조건부로 WHERE절 추가
		if(map.get("searchWord") !=null) { 
			query += " WHERE " +map.get("searchField") + "" 
					+ " LIKE '" +map.get("searchWord")  +"%'";
		}
		try { 
			stmt = con.createStatement(); //정적쿼리문이므로 정적객체로 실행
			//동적 쿼리문: prepareStatement();
			rs= stmt.executeQuery(query); //
			//count(*)를 통한 쿼리문은 항상 null값이 없으므로 (0~정수) if문이 필요없다.
			
//결과를 한 행 읽어온다.
			rs.next(); 
			totalCnt = rs.getInt(1); //결과값 변수에 저장

		}catch (Exception e) {
			System.out.println("게시물 수 구하는 중 예외발생!");
			e.printStackTrace();
		}
		return totalCnt;
	}
	
	
//2. 검색결과를 목록에 출력 할 게시물 추출
	public List<BoardDTO> selectList(Map<String, Object> map) {
		List<BoardDTO> bbs = new Vector<BoardDTO>();
		//List<BoardDTO> bbs2 = new ArrayList<BoardDTO>();
	//select 한 게시물의 목록은 다수의 레코드가 포함되므로
	//이를 저장하기위해 순서를 보장하는 List계열의 컬렉션을 사용한다.
		//Set컬렉션은 순서를 보장하지 못하므로 게시판 목록을 출력하는 용도로는 사용할 수 없다.
		
		
		String query = "SELECT * FROM board ";
		//목록에 출력할 게시물을 추출하기 위한 쿼리문으로, 최근게시물 부터 노출을위해 항상 일련번호(작성순)의 역순으로 정렬.
		if(map.get("searchWord") !=null) {
			query += " WHERE " +map.get("searchField") + "" 
					+ " LIKE '%" +map.get("searchWord")  +"%'";
		}
		query += "ORDER BY num DESC";
		
		try {
			stmt = con.createStatement();
			rs= stmt.executeQuery(query); 
			
			// 추출 된 결과에 따라 갯수만큼 반복.
			while(rs.next()) {
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
	
 //3. 사용자가 입력한 내용 insert	
	public int insertWrite(BoardDTO dto) {
		int result =0; //입력 결과를 확인하기 위한 변수
		try{
			//인파라미터가 있는 동적쿼리문 작성, 사용자 입력에 따라 달라짐
			String query =
			"INSERT INTO board (num,title,content,id,visitcount)"
			+ " VALUES (seq_board_num.nextval, ?, ?, ?, 0)";
			
			psmt = con.prepareStatement(query); //동적쿼리문 실행을 위한 동적객체 생성
			//인파라미터 설정
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getId());
			//쿼리문 실행
			result = psmt.executeUpdate(); 
		}catch (Exception e) {
			System.out.println("게시물 입력 중 예외발생");
			e.printStackTrace();
		}
		return result;
	}
	
//4. 글 클릭했을 때 내용 보기	
	public BoardDTO selectView(String num) { //상세보기
		BoardDTO dto = new BoardDTO();
		//매개변수로 전달 된 일련번호에 해당하는 게시물 인출
		//name을 출력하기 위해 테이블 조인
		String query = "SELECT B.*, M.name FROM board B"
				+ "    INNER JOIN member M "
				+ "    ON B.id=M.id "
				+ "    WHERE num=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			rs= psmt.executeQuery();
			//중복 데이터가 없으므로 if문 처리
			//게시판 목록처럼 여러개의 레코드를 가져온다면 while문 사용
			if(rs.next()) {//DTO에 레코드 내용 추가
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));//getdate()
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString(6));
				dto.setName(rs.getString("name"));
			}
		}catch(Exception e){
			System.out.println("게시물 상세보기 중 예외발생");
			e.printStackTrace();
		}
		return dto;
	}
	
//5.   조회수증가
	public void updateVistiCount(String num) {
		//visitcount가 number 타입이므로 연산가능, +1
		String query="UPDATE board SET visitcount = visitcount+1 WHERE num=?";
		
		try{
			psmt = con.prepareStatement(query);
			psmt.setString(1,num);
			psmt.executeQuery();
			
		}catch (Exception e) {
			System.out.println("조회수 증가 중 예외발생");
			e.printStackTrace();
		}
	}

//6. 게시물  수정하기
	public int updateEdit(BoardDTO dto) {
		int result =0; 
		try{
			
			String query =
			"UPDATE board SET title=?, content=? WHERE num=? ";
			
			psmt = con.prepareStatement(query); //동적쿼리문 실행을 위한 동적객체 생성
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getNum());
			result = psmt.executeUpdate(); //수정 된 행의 갯수 반환
		}catch (Exception e) {
			System.out.println("게시물 입력 중 예외발생");
			e.printStackTrace();
		}
		return result;
	}
	
//7. 게시물 삭제하기
	public int deletePost(BoardDTO dto) {
		int result =0; 
		try{
			String query =
			"DELETE FROM board WHERE num=? ";
			
			psmt = con.prepareStatement(query); //동적쿼리문 실행을 위한 동적객체 생성
			psmt.setString(1, dto.getNum());
			result = psmt.executeUpdate(); //삭제 된 행의 갯수 반환
		}catch (Exception e) {
			System.out.println("게시물 삭제 중 예외발생");
			e.printStackTrace();
		}
		return result;
	}


//8. 페이징처리
	public List<BoardDTO> selectListPage(Map<String, Object> map) {
		List<BoardDTO> bbs = new Vector<BoardDTO>();
/*
SELECT * FROM --서브쿼리3
(SELECT tb.* , rownum rN from --서브쿼리2
    (SELECT * from board order by num desc) tb)  --서브쿼리1
        where rN>=1 and rN<=10;
*/		
		String query = " SELECT * FROM "
				+ " (SELECT Tb.*, ROWNUM rNum FROM "
				+ " (SELECT * FROM board ";
		if(map.get("searchWord") !=null) { //검색어 있는 경우 쿼리에 적용
			query += " WHERE " +map.get("searchField") + "" 
					+ " LIKE '%" +map.get("searchWord")  +"%'";
		}
		query += " ORDER BY num DESC ) Tb) "//정렬쿼리
				+ " WHERE rNum BETWEEN ? AND ? "; 
					//rNum의 범위 -> 페이지 구간 
		
		try {
			psmt = con.prepareStatement(query);
	/*인파라미터 설정: 
		JSP에서 해당 페이지에 출력 할 게시물의 구간을 계산 한 후 
		Map컬렉션에 저장하고 DAO로 전달하면
		해당 값으로 쿼리문이 완성된다.*/
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs= psmt.executeQuery(); 
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));
				
				bbs.add(dto); // 반환할 결과 목록을 List컬렉션에 추가하기 
			}
		}catch (Exception e) {
			System.out.println("게시물 조회 중 예외발생!");
			e.printStackTrace();
		}
		return bbs; //List.jsp 로 컬렉션 반환
	}
	

}
