<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>생산관리조회수정</title>
<style>
	button{font-weight: bold;
		   width: 70px;
		   height: 30px;
		   margin: 3px;
		   box-shadow: 1px 1px;}
		   
	span{display:inline-block; 
		 width: 65px;}
		 
	ul {line-height: 1.8em;}		   
</style>

<script type="text/javascript">
	function validateForm(form) {
		if (form.code.value == "") {
			alert("제품코드를 입력하세요.");
			form.code.focus();
			return false;
	}
</script>

</head>
<body>

	<h2>생산관리 조회 &amp; 수정 화면</h2>
	
	<fieldset>
		<legend>생산관리 조회</legend>
		
		<form method="post" name="form" onsubmit="return validateForm(this);">
			<ul>
				<li> <span>제품코드</span> <input type="text" name="code" 
					<c:if test="${result eq 2}">value="${pdto.code}"</c:if>>
				<li> <span>제품이름</span> <input type="text" name="pname" 
					<c:if test="${result eq 2}">value="${pdto.pname}"</c:if>>
				<li> <span>제품원가</span> <input type="text" name="cost" 
					<c:if test="${result eq 2}">value="${pdto.cost}"</c:if>>
				<li> <span>목표수량</span> <input type="text" name="pnum"
					<c:if test="${result eq 2}">value="${pdto.pnum}"</c:if>>
				<li> <span>재고수량</span> <input type="text" name="jnum"
					<c:if test="${result eq 2}">value="${pdto.jnum}"</c:if>>
				<li> <span>출고가</span> <input type="text" name="sale"
					<c:if test="${result eq 2}">value="${pdto.sale}"</c:if>>
				<li> <span>그룹이름</span> <select name="gcode">
								<option value="A" <c:if test="${pdto.gcode eq 'A'}">selected</c:if>>컴퓨터</option>
								<option value="B" <c:if test="${pdto.gcode eq 'B'}">selected</c:if>>모바일</option>
								<option value="C" <c:if test="${pdto.gcode eq 'C'}">selected</c:if>>냉장고</option>
							  </select>
			</ul>		
			<input type="submit" onclick="javascript: form.action='/select.do';" value=" 조 회 "/>
			<input type="submit" onclick="javascript: form.action='/update.do';" value=" 수 정 "/>
			<input type="submit" onclick="javascript: form.action='/delete.do';" value=" 삭 제 "/>
			
			
			<button type="button" onclick="location.href='index.html'">메인화면</button>		
		</form>		
			
	</fieldset>		
	${result}
	
	<c:if test="${result eq 1}">
		<script>alert("수정 또는 삭제를 성공하였습니다!");</script>
	</c:if>
	
	<c:if test="${result eq 0}">
		<script>alert("수정 또는 삭제 과정에서 문제가 발생하였습니다.");</script>
	</c:if>
	
</body>
</html>