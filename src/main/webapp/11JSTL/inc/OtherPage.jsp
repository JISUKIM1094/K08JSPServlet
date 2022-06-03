<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h4>otherPage.jsp</h4>
<ul>
	<!-- 리퀘스트영역에 저장 된 변수값 -->
	<li>저장된 값: ${requestVar }</li>
	<!-- param태그를 통해 전달 된 파라미터  -->
	<li>매개변수1: ${param.user_param1 }</li>
	<li>매개변수2: ${param.user_param2 }</li>
</ul>