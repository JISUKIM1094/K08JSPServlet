<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 지시어는 파일마다 어디든지 꼬옥 있어야 한다. 없으면 오류-->
<%-- 바로이게 JSP주석! HTML주석은 누구나 다 보니까 조심하세요 --%>
<%
LocalDate today = LocalDate.now(); //오늘
LocalDateTime tomorrow = LocalDateTime.now().plusDays(1); //내일
%>