<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "java.sql.*" %>
<%@ page import = "DB.DBConnect" %>
<%
	request.setCharacterEncoding("UTF-8");

	String sql = "select teacher_code as 강사코드, " 
			+ "teacher_name as 강사명, " 
			+"class_name as 강의명, "
			+"to_char(class_price, 'FM99,999,999') as 수강료, "
			+"substr(teacher_regist_date, 1, 4) || '년' || " 
			+"substr(teacher_regist_date, 5, 2) || '월' || "
			+"substr(teacher_regist_date, 7, 2) || '일' as 강사자격취득일 "
			+"from tbl_teacher_202201";
	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>
<html>
<head>
<meta charset="UTF-8">
<title>강사조회</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<header>
	<jsp:include page ="layout/header.jsp"></jsp:include>
</header>
<nav>
	<jsp:include page ="layout/nav.jsp"></jsp:include>
</nav>
<section class="section">
	<h2>강사조회</h2>
	<table border="1" style="margin-left : auto; margin-right : auto; text-align : center;">
		<tr>
			<th>강사코드</th>
			<th>강사명</th>
			<th>강의명</th>
			<th>수강료</th>
			<th>강사자격취득일</th>
		</tr>
		<% while(rs.next()) { %>
			<tr>
				<td><%= rs.getString("강사코드") %></td>
				<td><%= rs.getString("강사명") %></td>
				<td><%= rs.getString("강의명") %></td>
				<td>\ &nbsp<%= rs.getString("수강료") %></td>
				<td><%= rs.getString("강사자격취득일") %></td>
			</tr>
		<% } %>
	</table>
</section>
<footer>
	<jsp:include page ="layout/footer.jsp"></jsp:include>
</footer>
</body>
</html>