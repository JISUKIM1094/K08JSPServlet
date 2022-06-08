package model2.mvcboard;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;
import model1.board.BoardDTO;
//모델2 방식의 자료실형 게시판에서 사용 할 DAO클래스 생성

public class MVCBoardDAO extends DBConnPool{ //DB연결은 DBCP(커넥션풀) 을 사용한다.
	public MVCBoardDAO() {
		super(); //부모클래스의 기본생성자 호출을 통해 DB연결
	}
	//mvcboard 테이블에 저장 된 게시물 개수를 카운트하여 목록 출력 시 게시물의 순번 출력
		//목록의 페이징 처리나 게시물의 가상번호 부여에 사용된다.
	public int selectCount(Map<String, Object> map) { // 검색을 위해 매개변수는 Map컬렉션으로 선언했다.
		// String: 셀렉트 타입에 있는 제목/내용 중에 선택 된 하나. searchField
		// Object: 검색어. searchWord 
			
		int totalCnt =0;
		String query = "SELECT COUNT(*) FROM mvcboard ";
		if(map.get("searchWord") !=null) {//검색어 있을 경우 조건부로 WHERE절 추가 
			query +=" WHERE "+map.get("searchField")+" "+" LIKE '"+map.get("searchWord")+"%'";
		}
		try { 
			stmt = con.createStatement(); //정적쿼리문이므로 정적객체로 실행
			rs= stmt.executeQuery(query);
			//count(*)를 통한 쿼리문은 항상 null값이 없으므로 (0~정수) if문이 필요없다.
			
			rs.next(); //결과를 한 행 읽어온다.
			totalCnt = rs.getInt(1);
		}catch (Exception e) {
			System.out.println("게시물 수 구하는 중 예외발생!");
			e.printStackTrace();
		}
		return totalCnt;
	}

//8. 페이징처리
	public List<MVCBoardDTO> selectListPage(Map<String, Object> map) {
		List<MVCBoardDTO> board = new Vector<MVCBoardDTO>();
/*
		String query = " SELECT * FROM "
				+ " (SELECT Tb.*, ROWNUM rNum FROM "
				+ " (SELECT * FROM mvcboard ";
		if(map.get("searchWord") !=null) { //검색어 있는 경우 쿼리에 적용
			query += " WHERE " +map.get("searchField")
					+ " LIKE '%" +map.get("searchWord")  +"%' ";
		}
		query += " ORDER BY idx DESC ) Tb) "//정렬쿼리
				+ " WHERE rNum BETWEEN ? AND ? "; 
					//rNum의 범위 -> 페이지 구간 
		
		try {
			psmt = con.prepareStatement(query);
	/*인파라미터 설정: 
		JSP에서 해당 페이지에 출력 할 게시물의 구간을 계산 한 후 
		Map컬렉션에 저장하고 DAO로 전달하면
		해당 값으로 쿼리문이 완성된다.
		//	psmt.setString(1, map.get("start").toString());
		//	psmt.setString(2, map.get("end").toString());
			rs= psmt.executeQuery(); 
			while(rs.next()) {
				MVCBoardDTO dto = new MVCBoardDTO();
				
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
			    dto.setContent(rs.getString(4));
			    dto.setPostdate(rs.getDate(5));
			    dto.setOfile(rs.getString(6));
			    dto.setSfile(rs.getString(7));
			    dto.setDowncount(rs.getInt(8));
			    dto.setPass(rs.getString(9));
			    dto.setVisitcount(rs.getInt(10));
				
				bbs.add(dto); // 반환할 결과 목록을 List컬렉션에 추가하기 
			}
		}catch (Exception e) {
			System.out.println("게시물 조회 중 예외발생!");
			e.printStackTrace();
		}
		return bbs; //List.jsp 로 컬렉션 반환
	}
*/	
	/*
	모델1 방식에서는 board테이블 및 BoardDTO클래스를 사용했지만
	모델2 방식에서는 mvcboard테이블 및 MVCBoardDTO클래스를 사용하므로 
	해당 코드만 수정하면 된다. 
	
	모델2 방식의 게시판 목록에 대한 페이징 처리 쿼리문 실행
	 */
        
        String query = "SELECT * FROM ( "
        			+ "    SELECT Tb.*, ROWNUM rNum FROM ( "
                    + "        SELECT * FROM mvcboard ";
        if (map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchField")
                   + " LIKE '%" + map.get("searchWord") + "%' ";
        }        
        query += "      	ORDER BY idx DESC "
               + "     ) Tb "
               + " ) "
               + " WHERE rNum BETWEEN ? AND ?";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, map.get("start").toString());
            psmt.setString(2, map.get("end").toString());
            rs = psmt.executeQuery();
            while (rs.next()) {
                MVCBoardDTO dto = new MVCBoardDTO();
                dto.setIdx(rs.getString(1));
                dto.setName(rs.getString(2));
                dto.setTitle(rs.getString(3));
                dto.setContent(rs.getString(4));
                dto.setPostdate(rs.getDate(5));
                dto.setOfile(rs.getString(6));
                dto.setSfile(rs.getString(7));
                dto.setDowncount(rs.getInt(8));
                dto.setPass(rs.getString(9));
                dto.setVisitcount(rs.getInt(10));
                board.add(dto);
            }
        } 
        catch (Exception e) {
            System.out.println("게시물 조회 중 예외 발생");
            e.printStackTrace();
        }
        return board;
    }	
	
//3. 사용자가 입력한 내용 insert	
	public int insertWrite(MVCBoardDTO dto) {
		int result =0;
		try{
			String query =
			"INSERT INTO mvcboard (idx, name, title, content, ofile, sfile, pass)"
			+ " VALUES (seq_board_num.nextval, ?, ?, ?, ?, ?, ?)";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOfile()); //원본파일명
			psmt.setString(5, dto.getSfile()); //서버에 저장할 파일명
			psmt.setString(6, dto.getPass()); //비회원제 게시판이므로 수정, 삭제를 위한 인증에 사용됨
			result = psmt.executeUpdate(); 
		}catch (Exception e) {
			System.out.println("게시물 입력 중 예외발생");
			e.printStackTrace();
		}
		return result;
	}
	
//4. 글 클릭했을 때 내용 보기	
	public MVCBoardDTO selectView(String idx) { //매개변수로 전달 된 일련번호 idx를 통해 하나의 레코드 조회
		MVCBoardDTO dto = new MVCBoardDTO(); 
		String query = "SELECT * FROM mvcboard WHERE idx=?";
		try {
			//쿼리 실행을 위한 객체 생성 및 인파라미터 설정
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			rs= psmt.executeQuery();
			//조회된 레코드가 있을 때 DTO객체에 각 컬럼 값 지정
			if(rs.next()) { 
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setOfile(rs.getString(6));
				dto.setSfile(rs.getString(7));
				dto.setDowncount(rs.getInt(8));
				dto.setPass(rs.getString(9));
				dto.setVisitcount(rs.getInt(10));
			}
		}catch(Exception e){
			System.out.println("게시물 상세보기 중 예외발생");
			e.printStackTrace();
		}
		return dto;//조회 된 레코드 DTO객체로 반환
	}	
	
//5. 조회수증가
	public void updateVistiCount(String idx) {// 주어진 일련번호 idx에 해당하는 게시물의 조회수를 1증가 시킨다.
		String query="UPDATE mvcboard SET visitcount = visitcount+1 WHERE idx=?";
		
		try{
			psmt = con.prepareStatement(query);
			psmt.setString(1,idx);
			psmt.executeQuery();
			
		}catch (Exception e) {
			System.out.println("조회수 증가 중 예외발생");
			e.printStackTrace();
		}
	}
	
// 파일 다운로드 수 증가
	public void downCountPlus(String idx) {
		String sql="UPDATE mvcboard SET downcount = downcount+1 WHERE idx=?";
		
		try{
			psmt = con.prepareStatement(sql);
			psmt.setString(1,idx);
			psmt.executeQuery();
			
		}catch (Exception e) {
			System.out.println("다운로드 카운트 수 증가 중 예외발생");
			e.printStackTrace();
		}
	}
	
//수정, 삭제 할 때 비번검증	
	public boolean confirmPassword(String pass, String idx) {
		boolean isCorr = true;
		try {
			String sql=" SELECT COUNT(*) FROM mvcboard WHERE pass=? AND idx=?";
			psmt=con.prepareStatement(sql);
			psmt.setString(1,pass);
			psmt.setString(2,idx);
			rs=psmt.executeQuery();
			rs.next();
			if(rs.getInt(1)==0) isCorr=false;
		} catch (Exception e) {
			isCorr=false;
			e.printStackTrace();
		}
		return isCorr;
	}
	
//게시물 삭제	
	public int deletePost(String idx) {
		int result=0;
		try {
			String query=" DELETE FROM mvcboard WHERE idx=? ";
			psmt=con.prepareStatement(query);
			psmt.setString(1,idx);
			result=psmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("게시물 삭제 중 예외발생");
			e.printStackTrace();
		}
		return result;
	}
	
// 게시물 수정
	 public int updatePost(MVCBoardDTO dto) {
		int result =0;
		try{
			String query =" UPDATE mvcboard SET name=? ,title=? ,content=? ,ofile=? , sfile=? WHERE idx=? and pass=? ";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOfile()); //원본파일명
			psmt.setString(5, dto.getSfile()); //서버에 저장할 파일명
			psmt.setString(6, dto.getPass()); //비회원제 게시판이므로 수정, 삭제를 위한 인증에 사용됨
			result = psmt.executeUpdate(); 
		}catch (Exception e) {
			System.out.println("게시물 수정 중 예외발생");
			e.printStackTrace();
		}
		return result;
	}
}