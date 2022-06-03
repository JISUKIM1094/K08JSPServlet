package utils;

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
	
}
