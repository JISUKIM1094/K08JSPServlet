package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletContext;

public class JDBConnect { 
	//JDBC를 위한 멤버변수 선언
	public Connection con; //연결
	public Statement stmt; //쿼리실행
	public PreparedStatement psmt;
	public ResultSet rs; //결과값 반환

	public JDBConnect() { //기본 생성자
		try { //오라클 드라이버 로드, 커넥션 url생성, 계정 id/pass
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "musthave";
			String pass = "1234";
			con = DriverManager.getConnection(url,id,pass); //오라클 DB연결
			
//복붙해서 갖고오느라 con을 지역변수로 만들어버림 ㅜㅜ 이렇게 되면 Null에러 뜸~! 			
			
			if(con!=null)
				System.out.println("Oracle 연결성공");
			else System.err.println("Oracle 연결 실패");
			
		}catch(Exception e) {
			System.out.println("Oracle 연결시 예외발생");
			e.printStackTrace();
		}
	}
////////////////////////////////////////////////////////////////	
//일일이 변수 지정.. 
//jsp에서는 생성자만 호출하고 여기서 하드코딩
////////////////////////////////////////////////////////////////
	
	
	public void close() { //자원 반납
		try { //객체가 존재할 때 각각 자원 반납 
			if( rs != null ) rs.close();
			if( stmt != null ) stmt.close();
			if( psmt != null ) psmt.close();
			if( con != null ) con.close();
			
			System.out.println("JDBC 자원 해제");
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	} 
	
	
	//인자생성자1
	public JDBConnect(String driver, String url, String id, String pass) {
		try {
			Class.forName(driver); //DB 드라이버 로드
			con = DriverManager.getConnection(url,id,pass); //DB연결
			System.out.println("DB연결 성공 -인수생성자1");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
////////////////////////////////////////////////////////////////
//값을 받아와서 처리.. 
//jsp에서 내장객체인 application의 변수값을 일일이 얻어서 넘겨주느라 엄청 길다. 
	//- JSP는 내장객체에 직접접근
//여기서 하드코딩은 없음, 정보는 모두 web.xml에 저장 했다.
////////////////////////////////////////////////////////////////
	
	
	//인자생성자2			
	public JDBConnect(ServletContext application) { //JSP에서는 내장객체를 즉시 사용 할 수 있지만 Java에서는 매개변수를 통해 접근 가능하다.
//DB연결은 매우 빈번히 반복되는 작업이므로 메서드로 지정해둔다.  
		try {
			String driver = application.getInitParameter("OracleDriver");
			Class.forName("oracle.jdbc.OracleDriver");
			String url = application.getInitParameter("OracleURL");
			String id = application.getInitParameter("OracleId");
			String pwd = application.getInitParameter("OraclePwd");
			con = DriverManager.getConnection(url,id,pwd); //오라클 DB연결
			
			if(con!=null)
				System.out.println("DB연결 성공 -인수생성자2");
			else System.err.println("Oracle 연결 실패");
			
		}catch(Exception e) {
			System.out.println("Oracle 연결시 예외발생");
			e.printStackTrace();
		}
	} 
}
////////////////////////////////////////////////////////////////
//1+2! jsp에서는 내장객체인 application만 보내준다. 
	//- Java는 내장객체에 간접 접근 
//여기서 하드코딩은 없음, 정보는 모두 web.xml에 저장 했다.
////////////////////////////////////////////////////////////////

