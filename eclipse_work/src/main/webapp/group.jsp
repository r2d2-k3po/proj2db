<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그룹별재고수량</title>
<style>
	button{font-weight: bold;
		   width: 70px;
		   height: 30px;
		   margin: 3px;
		   box-shadow: 1px 1px;}
</style>
</head>
<body>

	<h2>그룹별 재고 수량 화면</h2>
	
	<fieldset>
		<legend>그룹별 재고 수량</legend>
		
			<table>
				<c:forEach items="${plist}" var="item">
				<tr>
					<td>${item.code}</td>
					<td>${item.pname}</td>
					<td>${item.cost}</td>
					<td>${item.pnum}</td>
					<td>${item.jnum}</td>
					<td>${item.sale}</td>
					<td>${item.gcode}</td>				
				</tr>
				</c:forEach>
			</table>

			<button onclick="location='index.html'">메인화면</button>
	</fieldset>
</body>
</html>