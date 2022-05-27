package membership;
//데이터만 저장 클래스
/* DTO =Data Transfer Object
  	JSP와 Java파일간 데이터 전달을 위한 객체. 
  	자바빈 규약에 의해 제작한다.
*/
public class MemberDTO { //멤버변수 -private, 멤버메서드-getter,setter 생성, 기본생성자는 별로 작성 하지 않으면 자동 생성됨.
	
	//member 테이블 컬럼과 동일하게 생성.
	private String id;
	private String pass;
	private String name;
	private String regidate;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id= id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRegidate() {
		return regidate;
	}
	public void setRegidate(String regidate) {
		this.regidate = regidate;
	}
	
}//스프링에서는 어마어마한 기능을 한다~!
