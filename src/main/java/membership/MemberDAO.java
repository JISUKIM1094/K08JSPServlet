package membership;

import javax.servlet.ServletContext;

import common.JDBConnect;

//데이터를 가져와서 처리하는 클래스 JDBC
/* DAO =Data Access Object
	실제 데이터베이스에 접근하여 어러가지 CRUD작업을 하기위한 객체
*/
public class MemberDAO extends JDBConnect{
	public MemberDAO (String drv, String url, String id, String pw) {
		super(drv,url,id,pw);
	}//인자가 4개인 JDBConnect 생성자 호출하여 DB에 연결
	
	public MemberDAO (ServletContext application) {
		super(application); 
	}//인자가 내장객체 application인 생성자 호출해도 무방!
	
	
	public MemberDTO getMemberDTO(String uid, String upass) {
	//매개변수로 받은 Id,Pass가 회원테이블에 존재하는 정보일 때 DTO에 보낸다.
		MemberDTO dto = new MemberDTO(); //DTO객체 생성
		String query = "SELECT * FROM member WHERE id=? AND pass=?";//회원 로그인을 위한 쿼리문
				
		try {//쿼리문 실행을 위한 동적객체 생성 및 인파라미터 설정
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			rs= psmt.executeQuery();
			if(rs.next()) { //반환 된 rs객체를 통해 회원 정보가 있을 때 회원정보 저장
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString(3));
				dto.setRegidate(rs.getString(4));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return dto;			
	}
	

}
