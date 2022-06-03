package el;

public class MyELClass {
	public String getGender(String jumin) { //주민등록번호 뒷자리 첫번째 숫자로 성별 판단 메서드
		String returnStr="";
		int beginIdx= jumin.indexOf("-")+1; //입력된 문자열중 '-' 다음 문자의 인덱스 획득
		String genderStr= jumin.substring(beginIdx, beginIdx+1); //인덱스에 해당하는 문자 1개 획득
		int genderInt = Integer.parseInt(genderStr); //정수로 변경
		//성별판단
		if(genderInt ==1 || genderInt ==3) returnStr="남자";
		else if(genderInt ==2 || genderInt ==4) returnStr="여자";
		else returnStr ="주민번호 오류";
		return returnStr;
	}
	
	
	public static boolean isNumber(String value) { //문자열이 숫자로 이루어져 있는 지 판단 메서드
		char[] chArr =value.toCharArray(); //문자열을 문자배열로 변경
		for(int i=0; i<chArr.length; i++) { //문자 하나하나를 숫자인 지 판단
			if( !(chArr[i]>='0' && chArr[i]<='9')) return false; 
		}
		return true;
	}
	
	public static String showGugudan(int limitDan) {// 매개변수로 전달 된 숫자단까지의 구구단 출력
		//문자열의 변경이 많은 경우 버퍼클래스를 사용하는 것이 유리하다.
		// String클래스는 문자열 변경시 매번 새로운 메모리를 할당하므로 낭비가 심하다.
		StringBuffer sb= new StringBuffer(); 
		try {
			sb.append("<table border='1'>");
			for(int i=0; i<limitDan; i++) {
				sb.append("<tr>");
				for(int j=0;j<=9;j++) 
					sb.append("<td>"+i+"*"+j+"="+(i*j) +"</td>");
				sb.append("</tr>");
			}
			sb.append("</table>");
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return sb.toString();
	}
	
}
