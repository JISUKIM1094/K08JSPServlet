package fileupload;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;



public class FileUtil {
	//파일 업로드 처리
	public static MultipartRequest uploadFile(HttpServletRequest req, String saveDir, int maxPostSize) {
		try {
			//MultipartRequest(내장객체, 디렉토리 물리적 경로, 업로드 제한 용량, 인코딩방식)
				//객체 생성과 동시에 파일 업로드 완료 됨 
				//업로드 성공 시 객체의 참조값을 반환한다. 실패 시 디렉토리 경로 및 파일용량 확인
			return new MultipartRequest(req, saveDir,maxPostSize, "UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
			return null;		
		}
	}
	
	//파일 다운로드
	public static void download(HttpServletRequest req, HttpServletResponse resp, String dir, String sfileName, String ofileName) {
			//요청내장객체, 응답내장객체, 서버물리적 경로, 서버에 저장된 파일명, 원본파일명
		String sDirectory = req.getServletContext().getRealPath(dir);
		try { // 12FileUpload/Download.jsp
			File file = new File(sDirectory, sfileName); //서버에 저장된 파일을 찾아 file객체 생성 함
			
			//자바입장에서는 일단 읽어와야 되니까 입력 스트림 써야해~!
			InputStream iStream =new FileInputStream(file); //파일을 읽어오는 입력스트림 생성
			//웹브라우저 판단하여 언어 인코딩하여 한글깨짐 방지한다. 
			String client =req.getHeader("User-Agent");
			if (client.indexOf("WOW64") == -1) ofileName = new String(ofileName.getBytes("UTF-8"), "ISO-8859-1"); 
		    else ofileName = new String(ofileName.getBytes("KSC5601"), "ISO-8859-1"); //익스플로러
			//다운로드를 위한 응답 헤더 설정
			resp.reset();
			resp.setContentType("application/octet-stream");
			//원본 파일명으로 변경
			resp.setHeader("Content-Disposition", "attachment; filename=\"" + ofileName+ "\""); 
			resp.setHeader("Content-Length", "" + file.length() );
			// out.clear();  
			
			//응답객체를 통해 새로운 출력 스트림을 생성한다.
			OutputStream oStream = resp.getOutputStream();
			//출력스트림을 통해 파일내용을 출력한다. read=> write
		    byte b[] = new byte[(int)file.length()];
		    int readBuffer = 0;
		    while ( (readBuffer = iStream.read(b)) > 0 ) {
			        oStream.write(b, 0, readBuffer);
			    }
		    
		    iStream.close(); 
		    oStream.close();
		}
		catch (FileNotFoundException e) {
		    System.out.println("파일을 찾을 수 없습니다.");
		}
		catch (Exception e) {
		    System.out.println("예외가 발생하였습니다.");
		}
	}
	
	//파일 삭제
	public static void deleteFile(HttpServletRequest req, String dir, String filename) {
		String sDir = req.getServletContext().getRealPath(dir);//디렉토리 물리적 경로
		File file = new File(sDir+File.separator+filename);//파일객체 생성
		if(file.exists()) file.delete(); //파일이 있으면 삭제
	}
}
