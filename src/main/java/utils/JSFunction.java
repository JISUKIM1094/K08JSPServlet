package utils;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;

public class JSFunction {
//Javascript 함수를 통해 
	
	//경고창을 띄우고 원하는 페이지로 이동한다.
	public static void alertLocation(String msg, String url, JspWriter out) {
	    //Java클래스에서는 JSP 내장객체 직접사용은 불가능.	매개변수로 전달받아 사용한다.
		try {// try-catch문 없으면 에러발생
	        String script = ""  
						  + "<script>"
						  + "    alert('" + msg + "');"
						  + "    location.href='" + url + "';"
						  + "</script>";
	    //화면에 문자열 출력하기위해 out 내장객체를 JspWriter 타입으로 받았다.
	        out.println(script); 
	    }catch (Exception e) {}
	}
	//경고창을 띄우고 이전페이지로 이동한다.
	public static void alertBack(String msg, JspWriter out) {
	    try {
	        String script = ""
						  + "<script>"
						  + "    alert('" + msg + "');"
						  + "    history.back();"
						  + "</script>";
			out.println(script);
	    }catch (Exception e) {}
    }
	public static String alertMsg(String msg, JspWriter out) {
		String script="";
		try {
	         script = ""  
						  + "<script>"
						  + "    alert('" + msg + "');"
						  + "</script>";
	        out.println(script); 
	    }catch (Exception e) {}
		return script;
	}
	
	
// 위 메서드는 JSP에서 out내장 객체를 통해 JS함수를 실행한다.
// 아래 메서드는 서블릿에서 JS함수를 실행 하기 위해
	//resp 객체를 받아와서 컨텐츠 타입 설정 후 JS함수를 사용하여 출력물을 작성한다.
	
	
	//서블릿용
		//13Servlet DirectServletPrint.jsp 에서 배웟따.
	public static void alertLocation(HttpServletResponse resp, String msg, String url) {
		try {
			resp.setContentType("text/html;charset=UTF-8"); //컨텐츠 타입 설정
	        PrintWriter writer = resp.getWriter(); 
	        //PrintWriter객체를 통해 스크립트를 서블릿에서 직접 출력한다.
			String script = ""  
						  + "<script>"
						  + "    alert('" + msg + "');"
						  + "    location.href='" + url + "';"
						  + "</script>";
			writer.print(script);
		}catch (Exception e) {}
	}
	public static void alertBack(HttpServletResponse resp, String msg) {
	    try {
			resp.setContentType("text/html;charset=UTF-8"); 
	        PrintWriter writer = resp.getWriter();
	        String script = ""
						  + "<script>"
						  + "    alert('" + msg + "');"
						  + "    history.back();"
						  + "</script>";
			writer.print(script);
	    }catch (Exception e) {}
    }
	
	
}
