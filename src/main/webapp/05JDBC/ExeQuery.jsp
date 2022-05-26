<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC</title>
</head>
<body>

	<h2> 회원 목록 조회 테스트 (executeQuery() ) 사용 </h2>
<%
	JDBConnect jdbc = new JDBConnect();
	
	String sql = "SELECT id, pass, name, regidate FROM member"; 
	Statement stmt = jdbc.con.createStatement(); //정적쿼리 실행
	
	ResultSet rs = stmt.executeQuery(sql);
	//행에 변화를 주는 update, delete, insert 쿼리문은 executeUpdate()를 사용한다.
	// 주지 않는 쿼리문은 executeQuery()
	
	while(rs.next()){ //반환 받은 결과의 갯수만큼 반복하여 출력
		String id = rs.getString(1); // 레코드의 컬럼에 인덱스로 접근
		String pw = rs.getString(2);
		String name = rs.getString("name"); // 레코드의 컬럼에 컬럼명으로 접근
		java.sql.Date regidate = rs.getDate("regidate");
		
		out.println(String.format("%s %s %s %s", id, pw, name, regidate)+ "<br>" );
	}
	jdbc.close();
%>
</body>
</html>