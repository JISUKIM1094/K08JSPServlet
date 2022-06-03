<%@page import="fileupload.MyfileDAO"%>
<%@page import="fileupload.MyfileDTO"%>
<%@page import="java.util.Date"%>
<%@page import="java.io.File"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    String saveDirectory= application.getRealPath("/Uploads"); //파일이 저장 될 서버의 물리적 경로 (절대경로)
    int maxPostSize= 1024*1000;//업로드 할 파일의 최대용량 설정 (업로드 할 파일이 2개 이상이라도 총 용량에 적용 됨)
    String encoding="UTF-8"; //인코딩 방식 설정
    
    try{// 파일 업로드 클래스.
    	// 앞에서 정의 한 인수를 매개변수로 전달하여 객체생성.
		//파일 업로드가 안된다면 앞서 정의 한 인수에 문제가 있는 것.
		MultipartRequest mr= new MultipartRequest
				(request,saveDirectory,maxPostSize,encoding); 
    	//객체 생성 및 파일 업로드 완료 
    	
    	String fileName= mr.getFilesystemName("attachedFile"); //mr객체를 통해 서버에 저장 된 파일이름 획득
    	String ext= fileName.substring(fileName.lastIndexOf(".")); //파일명에서 확장자 앞 .(닷)의 인덱스를 통해 확장자획득
    	String now= new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date()); //현재날짜,시간(초의 밀리세컨즈 까지 이용) 으로 파일이름 생성
    	String newFileName= now+ext; //파일이름과 확장자를 합하여 파일명 생성
    	
    	//서버에 저장 된 파일명을 새로운 파일명으로 변경한다.
    	File oldfile= new File(saveDirectory+ File.separator + fileName); //서버의 물리적 경로 + 파일구분자("/" or "\") + 기본 파일명
    	File newfile= new File(saveDirectory+ File.separator + newFileName); //
    	oldfile.renameTo(newfile);  
    	
    	//파일을 제외한 나머지 폼값을 받는다. 단 이때 request 내장객체가 아니라
    		//mr객체를 통해 받을 수 있다.
    		//폼값을 얻는 메서드 명은 동일하다.getParameter() getParameterValues()
    	String name = mr.getParameter("name");
    	String title = mr.getParameter("title");
    	String[] cateArr= mr.getParameterValues("cate");
    	
    	StringBuffer cateBuf= new StringBuffer(); 
    	if(cateArr ==null) cateBuf.append("선택없음");
    	else {
    		for(String s: cateArr) cateBuf.append(s+",");
    	}
    	
    	//DB처리
    	MyfileDTO dto = new MyfileDTO();
		dto.setName(name);
		dto.setTitle(title);
		dto.setCate( cateBuf.toString() );
		dto.setOfile( fileName );
		dto.setSfile( newFileName );
    	
		MyfileDAO dao = new MyfileDAO();
		dao.insertFile(dto);
		dao.close();
		
    	//파일 업로드 성공 시 파일목록으로 이동
    	response.sendRedirect("FileList.jsp");
    }catch(Exception e){
    	e.printStackTrace();
    	//파일 업로드 실패 시 request영역에 errorMessage= "파일 업로드 오류"를 저장하고 메인으로 포워드 한다.
    	request.setAttribute("errorMessage","파일 업로드 오류");
    	request.getRequestDispatcher("FileUploadMain.jsp").forward(request, response);
    }
    
    %>