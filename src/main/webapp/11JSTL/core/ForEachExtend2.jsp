<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="common.Person"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL -forEach 2</title>
</head>
<body>
	<h4>List컬렉션 사용하기</h4>
	<%//List계열의 컬렉션 생성 및 객체 추가
	LinkedList<Person> lists = new LinkedList<Person>();
	lists.add(new Person("맹사성",34));
	lists.add(new Person("장영실",44));
	lists.add(new Person("신숙주3",54));
	%>
	<!-- set태그로 변수설정 -->
	<c:set var="lists" value="<%=lists %>"></c:set>
	<!-- 확장for문으로 반복출력 -->
	<c:forEach items="${lists }" var="list">
		<li>이름: ${list.name }, 나이: ${list.age }</li>
	</c:forEach>
	
	<h4>Map컬렉션 이용하기</h4>
	<% //순서를 보장하지 않는 Map (Set) 컬렉션.
	Map<String,Person> maps= new HashMap<String,Person>();
	maps.put("1st", new Person("맹사성",34));
	maps.put("2nd", new Person("장영실",44));
	maps.put("3rd", new Person("신숙주",54));
	maps.put("4rd", new Person("신숙주",54));
	maps.put("5rd", new Person("신숙주",54));
	maps.put("6rd", new Person("신숙주",54));
	maps.put("7rd", new Person("신숙주",54));
	maps.put("8rd", new Person("신숙주",54));
	maps.put("9rd", new Person("신숙주",54));
	maps.put("10rd", new Person("신숙주",54));
	%>
	
	<!-- Map컬렉션을 사용하는 데 키값을 별도로 획득하지 않아도 됨.
		객체.key / 객체.value 로 값 출력 -->
	<c:set var="maps" value="<%=maps %>"/>
		<c:forEach items="${maps }" var="map">
			<li>Key=> ${map.key }<br>
				Value=> 이름: ${map.value.name }, 나이: ${map.value.age }</li>
		</c:forEach>
	
	<h4>Java코드로 출력</h4>
	<% //Map컬렉션은 항상 키값을 먼저 얻어와야 한다.
		Set<String> keys= maps.keySet();
		for(String k :keys){ // 키 갯수만큼 반복
			Person p = maps.get(k); //키값으로 해당 객체 획득
			out.print("Key=>"+k+"<br>"); //해당 객체의 키값 출력
			out.print("Value=>"+p.getName()+"," + p.getAge()+ "<br>"); //해당 객체의 이름과 나이 출력
		}
 	//JSTL의 확장for문을 사용하면 훨씬 편리하다.
 		//키값을 별도로 획득해야하 하는 번거로움이 없음
	%>
	
	
</body>
</html>