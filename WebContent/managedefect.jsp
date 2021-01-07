<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1" />
<title>Insert title here</title>
<link rel="stylesheet" href="./css/admin/adminmain.css" />
</head>
<body>
	<%@page import="com.UserDao,com.*,java.util.*,java.sql.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<nav class="admin-nav">
      <img src="./assets/Logo.svg" alt="" class="logo" />
      <ul class="nav-link">
        <a href="./managedefect.jsp"><li class="link">Manage Defect</li></a>
        <a href="./resolveddefectlist.jsp"
          ><li class="link">Resolved Defect List</li></a
        >
        <a href="./rejectdefect.jsp"
          ><li class="link">Rejected Defect List</li></a
        >
        <a href="./index.html"><li class="link">Log Out</li></a>
      </ul>
    </nav>
	<section class="container">
		<div class="tabledefect">
			<table class="flatTable">
				<tr class="titleTr">
					<td class="titleTd">Defect Items Report</td>
					<td class="titleTd" colspan="5"></td>
				</tr>
				<tr class="headingTr">
					<td>Product Name</td>
					<td>Defect Description</td>
					<td>Accept</td>
					<td>Reject</td>
					<td></td>
				</tr>
				<%
				try {
					Class.forName("com.mysql.jdbc.Driver");
					String url = "jdbc:mysql://localhost/kratos";
					String username = "root";
					String password = "root";
					String query = "select * from defectreport";
					Connection conn = DriverManager.getConnection(url, username, password);
					Statement stmt = conn.createStatement();
					ResultSet rs = stmt.executeQuery(query);
					while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getString("prodname")%></td>
					<td><%=rs.getString("defectdesc")%></td>
					<td><a href = "acceptdefect.jsp?pname=<%=rs.getString("prodname")%>&defectdesc=<%=rs.getString("defectdesc")%>"><img src="./assets/checkmark.svg"></a></td>
					<td><a href = "rejectdefect.jsp?pname=<%=rs.getString("prodname")%>&defectdesc=<%=rs.getString("defectdesc")%>"><img src="./assets/cancel.svg"></a>
					<td>
				</tr>

				<%
				}
				%>
				<%
				rs.close();
				stmt.close();
				conn.close();
				} catch (Exception e) {
				e.printStackTrace();
				}
				%>

			</table>
		</div>
	</section>
</body>
</html>
