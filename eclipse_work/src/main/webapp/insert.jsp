<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>생산관리등록</title>
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

	<h2>생산관리 등록 화면</h2>
	
	<fieldset>
		<legend>생산관리 등록</legend>
		
			<table border="1">
				<tr>
					<th>그룹이름</th>
					<th>제품코드</th>
					<th>제품이름</th>
					<th>재고수량</th>
				</tr>					
					
				<c:set var="oldGcode" value="z" />
				<c:set var="idx" value="0" />
				
				<c:forEach items="${plist}" var="pitem">
				<tr>
					<c:set var="newGcode" value="${pitem.gcode}" />
					<c:if test="${oldGcode ne newGcode}">
						<td align="center" rowspan="${pmap.get(pitem.gcode)}">${glist[idx].gname}</td>
						<c:set var="idx" value="${idx+1}" />
					</c:if>
					<c:set var="oldGcode" value="${newGcode}" />
					<td align="center">${pitem.code}</td>
					<td>${pitem.pname}</td>
					<td align="right">${pitem.jnum}</td>			
				</tr>
				</c:forEach>
			</table>

			<button onclick="location.href='index.html'">메인화면</button>
	</fieldset>
</body>
</html>