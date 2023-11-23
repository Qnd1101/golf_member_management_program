<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "java.sql.*" %>
<%@ page import = "DB.DBConnect" %>
<%
	request.setCharacterEncoding("UTF-8");

	String sql = "select substr(regist_month, 1, 4) || '년' || " 
			+"substr(regist_month, 5, 2) || '월' as 수강월, "
			+"me.c_no as 회원번호, c_name as 회원명, class_name as 강의명, class_area as 강의장소, "
			+"'\' || to_char(tuition, 'FM99,999,999') as 수강료, "
			+"grade as 등급 "
			+"from tbl_teacher_202201 th, tbl_member_202201 me, tbl_class_202201 cl "
			+"where th.teacher_code = cl.teacher_code and me.c_no = cl.c_no";
	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보조회</title>
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
	<h2>회원정보조회</h2>
	<table border="1" style="margin-left : auto; margin-right : auto; text-align : center;">
		<tr>
			
			<th>수강월</th>
			<th>회원번호</th>
			<th>회원명</th>
			<th>강의명</th>
			<th>강의장소</th>
			<th>수강료</th>
			<th>등급</th>
			
		</tr>
		<% while(rs.next()) { %>
			<tr>
				<td><%= rs.getString("수강월") %></td>
				<td><%= rs.getString("회원번호") %></td>
				<td><%= rs.getString("회원명") %></td>
				<td><%= rs.getString("강의명") %></td>
				<td><%= rs.getString("강의장소") %></td>
				<td>\ &nbsp<%= rs.getString("수강료") %></td>
				<td><%= rs.getString("등급") %></td>
			</tr>
		<% } %>
	</table>
</section>
<footer>
	<jsp:include page ="layout/footer.jsp"></jsp:include>
</footer>
</body>
</html>