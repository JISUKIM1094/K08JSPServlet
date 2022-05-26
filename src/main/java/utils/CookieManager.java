package utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieManager { //쿠키 생성, 읽기, 삭제 유틸리티 클래스

	public static void makeCookie(HttpServletResponse response, String cName,
            String cValue, int cTime) { // response 내장객체가 필요하므로 매개변수로 받았다.
        Cookie cookie = new Cookie(cName, cValue); //쿠키생성
        cookie.setPath("/"); //해당페이지 전체지정. 특정 경로지정은 흔하지 않다.
        cookie.setMaxAge(cTime);
        response.addCookie(cookie); 
// 매개변수로 전달받은 내장객체를 응답헤더에 추가하여 클라이언트에 전송
    }

    public static String readCookie(HttpServletRequest request, String cName) { // request 내장객체가 필요하므로 매개변수로 받았다.
    	String cookieValue = ""; //쿠키 값 변수 선언 및 초기화  
        Cookie[] cookies = request.getCookies(); // 배열로 쿠키들 읽기
        if (cookies != null) { //쿠키가 존재할 때
            for (Cookie c : cookies) { //쿠키 갯수만큼 반복
                String cookieName = c.getName(); //쿠키이름 획득
                if (cookieName.equals(cName)) //내가 찾는 쿠키와 동일한
                    cookieValue = c.getValue(); //쿠키의 값 획득
            }
        }
        return cookieValue; 
    }

    public static void deleteCookie(HttpServletResponse response, String cName) {
/*쿠키는 삭제를 위한 별도 메서드가 없으므로 빈값과 유효기간을 0으로 설정하면 삭제된다. 
 makeCookie()메서드를 재활용한다.*/    	
        makeCookie(response, cName, "", 0); //쿠키삭제를 위해 시간을 0으로 재생성
        //쿠키 설정 시 미래의 시간으로 설정해야 생성된다. 
    }
}
