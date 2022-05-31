<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="common.Person"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL-컬렉션</title>
</head>
<body>
	<h2>List컬렉션</h2>
	<%
	List<Object> aList = new ArrayList<Object>(); //Object기반으로 List컬렉션 생성
		List aList2 = new ArrayList(); // 권장하지는 않는 방법.
		//매개변수(타입)이 없어도 Object기반으로 만들어진다.
	aList.add("청해진"); //문자열객체 리스트에 추가
	aList.add(new Person("장보고",22)); //Person객체 리스트에 추가
//페이지 영역에 리스트 저장 (리스트 속성명이 Ocean)
	pageContext.setAttribute("Ocean", aList); 
	%>
	<ul>
	<!-- 속성명이 Ocean인 리스트 배열이 [인덱스]순서대로 출력 됨 -->
		<li>0번째 요소: ${Ocean[0] }</li> <!-- 문자열객체 출력 -->
		<li>1번째 요소: ${Ocean[1].name },${Ocean[1].age } </li> <!-- Person객체 출력, 멤버변수 age는 게터로 가져옴. -->
		<li>2번째 요소: ${Ocean[2] }</li> <!-- 객체가 존재하지 않음.
			 EL에서는 널포인트익셉션이 발생하지 않아서 아무것도 출력되지 않고 끝. -->
	</ul>
	
	<h2>Map 컬렉션</h2>
	<%
	Map<String, String> map = new HashMap<String, String>(); //맵컬렉션 생성
	map.put("한글","훈민정음"); // 키 한글, 값 훈민정음
	map.put("eng","English"); //키 eng, 값 훈민정음 
	pageContext.setAttribute("King", map); //페이지 영역에 컬렉션 저장(속성명 King)
	%>
	<ul>
		<li>영문key: ${King['eng'] }, ${King["eng"] }, ${King.eng }, </li>
		<!-- 키가 영문이면 세가지 방법 정상 출력, 
				한글인 경우 . 으로는 출력되지 않는다. -->
		<li>한글key: ${King['한글'] }, ${King["한글"] }, \${King.한글 }, </li>
		
		<!-- EL앞에 역슬러시\ 를 추가하면 웹페이지에 문자 그대로 출력된다. -->
		
	</ul>

</body>
</html>