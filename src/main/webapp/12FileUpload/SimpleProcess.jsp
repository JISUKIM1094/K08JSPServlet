<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String saveDirectory= application.getRealPath("/Uploads"); //파일이 저장 될 서버의 물리적 경로 (절대경로)
    int maxPostSize= 1024*1000;//업로드 할 파일의 최대용량 설정 (업로드 할 파일이 2개 이상이라도 총 용량에 적용 됨)
    String encoding="UTF-8"; //인코딩 방식 설정
/*
파일명 중복 처리 기본 제공 클래스.
파일명이 중복될 경우 자동으로 인덱싱 처리 해주는 기능을 제공한다.
	ex. "바다.jpg" 가 이미 존재한다면 "바다1.jpg""바다2.jpg""바다3.jpg"으로 
		저장한다. 기존 파일은 침해하지 않는다.
	
*/  DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
    
    try{
// 파일 업로드 클래스.
	// 앞에서 정의 한 인수를 매개변수로 전달하여 객체생성.
	//파일 업로드가 안된다면 앞서 정의 한 인수에 문제가 있는 것.
    	MultipartRequest mr= new MultipartRequest
    			(request,saveDirectory,maxPostSize,encoding,policy); //객체 생성 및 파일 업로드 완료
   	/*위 객체 생성만으로 파일명이 중복되는 부분까지 처리 가능.
  		하지만 파일명이 한글 인 경우 서버에서 인코딩 처리 등에서
  		발생할 수 있는 깨짐현상을 대비하여 
  		영문과 숫자로 사용하는 것이 좋다.*/
    	
    }catch(Exception e){
    	e.printStackTrace();
    	request.setAttribute("errorMsg","파일 업로드 오류");
    	request.getRequestDispatcher("FileUploadMain.jsp").forward(request,response);
    }
    
    %>