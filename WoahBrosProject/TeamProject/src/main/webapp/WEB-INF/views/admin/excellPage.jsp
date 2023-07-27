<%@ page language="java" contentType="application/vnd.ms-excel;charset=utf-8" pageEncoding="utf-8"%>
<%@page import="com.edu.teamproject.domain.Adopt"%>
<%@page import="java.util.List"%>
<%
	List<Adopt> adoptList = (List) request.getAttribute("adoptList");
//디폴트 파일명 지정
   response.setHeader("Content-Disposition","attachment;filename=member.xls");
   response.setHeader("Content-Description", "JSP Generated Data");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>엑셀파일변환</title>
</head>
<body bgcolor=white>
	<table border=1>
		<tr bgcolor="#CACACA">
			<th>종류</th>
			<th>이름</th>
			<th>나이</th>
			<th>등록일</th>
			<th>입양진행상태</th>
		</tr>
		<% for (int a = 0; a < adoptList.size(); a++) { %>
		<% Adopt adopt = adoptList.get(a); %>
		<tr>
			<td><%=adopt.getType()%></td>
			<td><%=adopt.getName()%></td>
			<td><%=adopt.getAge()%></td>
			<td><%=adopt.getRegdate()%></td>
			<%if( adopt.getStatus()==1 ){%>
				<td>입양완료</td>
			<%}else{%>
				<td>입양중</td>
			<%}%>
		</tr>
		<% } %>
	</table>
</body>
</html>