package common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

//JNDI(Java Naming Directory Interface) : 디렉토리 서비스에서 제공하는 데이터 및 객체를 찾아서 참고(lookup)하는 API
	//쉽게말하면 외부에 있는 객체를 이름으로 찾아오기 위한 기술.
//DBCP(Database Connection Pool- 커넥션풀) : DB와 연결 된 커넥션 객체를 미리 만들어 풀에 저장 해 뒀다가 필요할 때 가져다 쓰고 반납하는 기법
	//DB에 부하를 줄이고 자원을 효율적으로 관리할 수 있다.

public class DBConnPool {
	public Connection con; //연결
	public Statement stmt; //쿼리실행
	public PreparedStatement psmt;
	public ResultSet rs; //결과값 반환
	
	public DBConnPool() {
		///Servers/Tomcat v9.0 Server at localhost-config/context.xml
		///Servers/Tomcat v9.0 Server at localhost-config/server.xml
		
		try {
			Context initCtx = new InitialContext(); //Context 객체생성
			//.lookup("") 앞에서 참조한 객체를 통해 JNDI서비스 구조의 초기 Root디렉토리를 얻어온다.
			//여기서 얻어오는 톰캣의 루트 디렉토리명은 이미 정해져있으므로 그대로 사용한다. 
			Context ctx = (Context)initCtx.lookup("java:comp/env"); // 정해져 있는 별칭. 톰캣의 위치 
			DataSource source = (DataSource)ctx.lookup("dbcp_myoracle"); //sever.xml에 등록된 네이밍을 lookup하여 DB에 연결할 정보를 가지고 있는 DataSource를 얻어온다. 
			con = source.getConnection();// 커넥션풀에 생성해 놓은 커넥션 객체를 가져다가 사용한다.
			System.out.println("DB 커넥션 풀 연결 성공");
		}catch (Exception e) {
			System.out.println("DB 커넥션 풀 연결 실패");
			e.printStackTrace();
		}
	}  
	
	public void close() { //사용 끝난 객체를 Pool에 반납. 객체의 소멸이 아님.
		//
		
		try {  
			if( rs != null ) rs.close();
			if( stmt != null ) stmt.close();
			if( psmt != null ) psmt.close();
			if( con != null ) con.close();
			
			System.out.println("Pool자원반납");
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	} 
}
