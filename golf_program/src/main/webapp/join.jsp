<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강신청</title>
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript">
	function checkValue() {
		if(!document.data.resist_month.value){
			alert("수강월이 입력되지 않았습니다!");
			data.resist_month.focus();
			return false;
		}else if(!document.data.c_name.value){
			alert("회원명이 선택되지 않았습니다!");
			document.data.c_name[0].focus();
			return false;
		}else if(!document.data.class_area.value){
			alert("강의장소가 입력되지 않았습니다!");
			data.class_area.focus();
			return false;
		}else if(!document.data.teacher_code.value){
			alert("강의명이 선택되지 않았습니다!");
			document.data.teacher_code[0].focus();
			return false;
		}
		
		alert("수강신청이 정상적으로 완료되었습니다!");
		return true;
	}
	
	function func_change1() {
		document.data.tuition.value = "";
		document.data.teacher_code.options[0].selected = true;
		
		document.data.c_no.value = document.data.c_name.value;
	}
	
	function func_change2() {
		var price = document.data.teacher_code.value * 1000;
		var c_no = document.data.c_no.value; 
		
		if(parseInt(c_no) >= 20000) price *= 0.5;
		
		document.data.tuition.value = price;
	}
		
	function refe() {
		alert("정보를 지우고 처음부터 다시 입력합니다!");
		return location.href='join.jsp';
	}
</script>
</head>
<body>
<header>
	<jsp:include page ="layout/header.jsp"></jsp:include>
</header>
<nav>
	<jsp:include page ="layout/nav.jsp"></jsp:include>
</nav>
<section class = "section">
	<h2>수강신청</h2>
	<form action="join_p.jsp" method="post" name="data" onsubmit="return checkValue()">
		<table border="1" style="margin-left : auto; margin-right : auto; text-align : left;">
			<tr>
				<th>수강월</th>
				<td><input type="text" name="resist_month">2022년03월&nbsp예)202203</td>
			</tr>
			<tr>
				<th>회원명</th>
				<td>
					<select name="c_name" onchange="func_change1();" style="width : 100px;">
						<option value="">회원명
						<option value="10001">홍길동</option>
						<option value="10002">장발장</option>
						<option value="10003">임꺽정</option>
						<option value="20001">성춘향</option>
						<option value="20002">이몽룡</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>회원번호</th>
				<td><input type="text" name="c_no" readonly></td>
			</tr>
			<tr>
				<th>강의장소</th>
				<td><input type="text" name="class_area"></td>
			</tr>
			<tr>
				<th>강의명</th>
				<td>
					<select name="teacher_code" onchange="func_change2();">
						<option value="">강의신청</option>
						<option value="100">초급반</option>
						<option value="200">중급반</option>
						<option value="300">고급반</option>
						<option value="400">심화반</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>수강료</th>
				<td><input type="text" name="tuition">원</td>
			</tr>
			<tr>
				<td colspan="3" style="text-align:center;">
					<input type="submit" value="수강신청">
					<input type="button" value="다시쓰기" onclick="refe()">
					<input type="button" value="강사조회" onclick="location.href='tc_list.jsp'">
				</td>
			</tr>
		</table>
	</form>
</section>
<footer>
	<jsp:include page ="layout/footer.jsp"></jsp:include>
</footer>
</body>
</html>