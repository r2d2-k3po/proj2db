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
		   
	span{display:inline-block; 
		 width: 65px;}
		 
	ul {line-height: 1.8em;}
		   
	table{margin: 15px;}
</style>

<script type="text/javascript">
	function validateForm(from) {
		
		
		
		
		
		
	}



</script>

</head>
<body>

	<h2>생산관리 등록 화면</h2>
	
	<fieldset>
		<legend>생산관리 등록</legend>
		
		<form action="/insert.do" method="post" onsubmit="return validateForm(this);">
			<ul>
				<li> <span>제품코드</span> <input type="text" name="code">
				<li> <span>제품이름</span> <input type="text" name="pname">
				<li> <span>제품원가</span> <input type="text" name="cost">
				<li> <span>목표수량</span> <input type="text" name="pnum">
				<li> <span>재고수량</span> <input type="text" name="jnum">
				<li> <span>출고가</span> <input type="text" name="sale">
				<li> <span>그룹이름</span> <select name="gcode">
								<option value="A">컴퓨터</option>
								<option value="B">모바일</option>
								<option value="C">냉장고</option>
							  </select>
			</ul>		
			<button type="submit">등록</button>
			<button onclick="location.href='index.html'">메인화면</button>
		
		</form>
		
		
			
	</fieldset>
</body>
</html>