<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우선생산제품</title>
<style>
	button{font-weight: bold;
		   width: 70px;
		   height: 30px;
		   margin: 3px;
		   box-shadow: 1px 1px;}
		   
	table{margin: 15px;}
</style>
</head>
<body>

	<h2>우선 생산 제품 화면</h2>
	
	<fieldset>
		<legend>우선 생산 제품</legend>
		
			<table border="1">
				<tr>
					<th>제품코드</th>
					<th>제품이름</th>
					<th>생산필요수량</th>
				</tr>					
				<c:forEach items="${plist}" var="pitem">
				<tr>
					<td align="center">${pitem.code}</td>
					<td>${pitem.pname}</td>
					<td align="right">${pitem.pnum-pitem.jnum}</td>			
				</tr>
				</c:forEach>
			</table>

			<button onclick="location.href='index.html'">메인화면</button>
	</fieldset>
</body>
</html>