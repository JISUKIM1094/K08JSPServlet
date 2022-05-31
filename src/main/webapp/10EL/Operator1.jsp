<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    int num1=3; //일반변수 선언
    
    //페이지 영역에 저장 된 변수
    pageContext.setAttribute("num2", 4);
    pageContext.setAttribute("num3", "5");
    pageContext.setAttribute("num4", "8");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 연산자</title>
</head>
<body> 
	<h3>변수선언 및 할당</h3>
	스크립틀릿에서 선언 한 변수: ${num1 } <!-- 스크립트에서 선언 한 변수는 EL에서 출력할 수 없다. --><br>
	<!-- EL / JSTL은 영역에서 저장 된 속성들을 이용해서 연산하거나 출력한다. -->
	page영역에서 저장한 변수: ${num2 }<br>
	<!-- 톰캣8 이후 버전부터 EL에서 변수할당 가능.  -->
	변수 할당 및 즉시 출력 : ${num1=7 }<!-- 변수할당하면 즉시 출력 됨. --> <br>
	변수 할당 및 별도 출력 : ${num2=8;'' } => ${num2 } <!-- 할당문 뒤에 ;'' 추가하면 즉시출력 안됨 --><br>
	<!-- 이렇게는 거의 쓰는 경우가 없고, JSTL에서 할당한다. -->
	num1 =${num1 },  num2 =${num2 },  num3 =${num3 },  num4 =${num4 } 
	
	<h3>산술연산자</h3>
	num1+num2: ${num1+num2 }<br>
	num1-num2: ${num1-num2 }<br>
	num1*num2: ${num1*num2 }<br>
	num1/num2: ${num1/num2 }<br>
	<!-- 나눗셈 / div , 
		형변환이 자동으로 되어 정수끼리의 연산에서 실수의 결과가 나온다. -->
	num3 div num4: ${num3 div num4 }<br>
	<!-- 나머지 % mod -->
	num3%num4: ${num3%num4 }<br>
	num3 mod num4: ${num3 mod num4 }<br>
	
	<h3> +연산자는 덧셈만 가능</h3>+가 나오면 무조건 숫자 연산을 하려고 한다 <br><br>
	<!--  "" 문자열에 들어가있어도 숫자로 형변환되어 연산한다. -->
	num1+"34": ${num1+"34" }<br>
	<!-- 덧셈은 숫자만!! -->
	num1+"이십": \${num1+"이십" } <!-- NumberFormatException 발생! --><br>
	"삼십"+ "tktlq": \${"삼십"+ "tktlq" }
	<!-- 문자열 연결 -->
	<h3> 문자열 연결은 + 필요없이 </h3>
	 \${"삼십"}\${"사십"} => ${"삼십"} ${"사십"}
	
	
	<h3>비교 연산자</h3>
	num4 > num3: ${num4 > num3 }, ${num4 gt num3 } <br>
	num1 < num3: ${num1 lt num3 } <br>
	num2 >= num4: ${num2 ge num4 } <br>
	num1 == num4: ${num1 eq num4 } <br>
	
	<h2>논리 연산자</h2>
	num3 <= num4 && num2 == num4 : ${num3 le num4 and num2 eq num4 }<br>
	num3 >= num4 || num3 != num4 : ${num3 ge num4 or num3 ne num4 }




</body>
</html>