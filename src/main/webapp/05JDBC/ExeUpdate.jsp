<%@page import="common.JDBConnect"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC -insert</title>
</head>
<body>
	<h2>회원 추가 테스트 -executeUpdate() 사용</h2>
<%
	JDBConnect jdbc = new JDBConnect(); //JDBC를 통해 DB연결

	//입력 할 회원데이터, 쿼리문 준비 -하드코딩
	String id= "test2";
	String pass= "1111";
	String name= "회원1";
  	String sql = "INSERT INTO member VALUES ( ? , ? , ? , sysdate )";
 
  	
  	PreparedStatement psmt = jdbc.con.prepareStatement(sql); //동적쿼리 실행
  	
  	//인파라미터 설정
  	psmt.setString(1, id); //DB이므로 인덱스 1부터!!!
  	psmt.setString(2, pass);
  	psmt.setString(3, name);
  	
  	int inResult = psmt.executeUpdate(); 
  	//행에 변화를 주는 update, delete, insert 쿼리문은 executeUpdate()를 사용한다. 
  	out.println(inResult+"행 입력.");
  	
  	jdbc.close(); //자원해제- 객체 소멸
 %>	

</body>
</html>