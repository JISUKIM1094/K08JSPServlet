<%@page import="java.net.URLEncoder"%>
<%@page import="fileupload.MyfileDTO"%>
<%@page import="fileupload.MyfileDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>디렉토리의 파일 목록 보기</h2>
	<%
		String saveDirectory= application.getRealPath("/Uploads"); //서버의 물리적 경로
	    File file = new File(saveDirectory); //파일객체 생성
	    File[] fileList = file.listFiles(); //디렉토리의 파일목록 획득하여 배열에 대입
		int fileCnt=1; 
		
		for(File f: fileList){ //파일 객체 하나씩의 이름 획득
	%>
		<li>
			파일명 <%=fileCnt %>: <%=f.getName() %>>
			파일크기: <%=(int)Math.ceil(f.length()/1024.0) %>kb
		</li>
	<%	
		fileCnt++;
		}
	%>
	
	
	
	<h2>DB에 등록된 파일 목록 보기</h2>
	<a href="FileUploadMain.jsp">파일 등록하기</a>
	<%
	MyfileDAO dao = new MyfileDAO();
	List<MyfileDTO> fileLists = dao.myFileList();
	dao.close();
	%>
	<table border='1'>
		<tr>
			<th>No</th><th>이미지</th>
			<th>작성자</th><th>제목</th><th>카테고리</th>
			<th>원본파일명</th><th>저장된 파일명</th>
			<th>작성일</th><th></th>
		</tr>
		<%for(MyfileDTO f: fileLists) {%>
		<tr>
			<td><%=f.getIdx() %></td>
			<td><img src="../Uploads/<%=f.getSfile() %>" width="150" ></td>
			<td><%=f.getName() %></td>
			<td><%=f.getTitle() %></td>
			<td><%=f.getCate() %></td>
			<td><%=f.getOfile() %></td>
			<td><%=f.getSfile() %></td>
			<td><%=f.getPostdate() %></td>
			<td>
			<a href="Download.jsp?oName=<%=URLEncoder.encode(f.getOfile(),"UTF-8")%>&sName=<%= URLEncoder.encode(f.getSfile(),"UTF-8")%>">[다운로드]</a></td>
		</tr>
		<%} %>
		
	</table>
	
	
	
</body>
</html>