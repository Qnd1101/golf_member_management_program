<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "java.sql.*" %>
<%@ page import = "DB.DBConnect" %>
<%
	request.setCharacterEncoding("UTF-8");

	String sql = "select th.teacher_code as 강사코드, " 
			+ "class_name as 강의명, "
			+"teacher_name as 강사명, " 
			+"'\' || to_char(sum(tuition), 'FM99,999,999') as 총매출 "
			+"from tbl_teacher_202201 th, tbl_member_202201 me, tbl_class_202201 cl "
			+"where th.teacher_code = cl.teacher_code and me.c_no = cl.c_no "
			+"group by th.teacher_code, class_name, teacher_name "
			+"order by 강사코드";
	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>
<html>
<head>
<meta charset="UTF-8">
<title>강사매출현황</title>
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
	<h2>강사매출현황</h2>
	<table border="1" style="margin-left : auto; margin-right : auto; text-align : center; width: 600px; ">
		<tr>
			<th>강사코드</th>
			<th>강의명</th>
			<th>강사명</th>
			<th>총매출</th>
		</tr>
		<% while(rs.next()) { %>
			<tr>
				<td><%= rs.getString("강사코드") %></td>
				<td><%= rs.getString("강의명") %></td>
				<td style="text-align : right;"><%= rs.getString("강사명") %></td>
				<td style="text-align : right;">\ &nbsp<%= rs.getString("총매출") %></td>
			</tr>
		<% } %>
	</table>
</section>
<footer>
	<jsp:include page ="layout/footer.jsp"></jsp:include>
</footer>
</body>
</html>