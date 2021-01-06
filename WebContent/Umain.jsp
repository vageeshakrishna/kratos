<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1" />
<title>Insert title here</title>
<link rel="stylesheet" href="./css/style.css" />
</head>
<body>
	<%@page import="com.UserDao,com.*,java.util.*,java.sql.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<nav>
		<img src="./assets/Logo.svg" alt="" class="logo" />
		<ul>
			<li>Log Out</li>
		</ul>
	</nav>
	<main class="quote">

		<div class="prod-quote">
			<div class="container card-container">
			<%
				try {
					Class.forName("com.mysql.jdbc.Driver");
					String url = "jdbc:mysql://localhost/kratos";
					String username = "root";
					String password = "root";
					String query = "select * from products where category='Gear'";
					Connection conn = DriverManager.getConnection(url, username, password);
					Statement stmt = conn.createStatement();
					ResultSet rs = stmt.executeQuery(query);
					while (rs.next()) {
				%>
				<span class="arrow-left" id="left" onclick="scrollleft(gear)"><</span>
				<span class="arrow-right" id="right">></span>
				
				<a href = "prod-desc.jsp?pname=<%=rs.getString("pname")%>"><div class="card">
					<img src=<%=rs.getString("img")%> alt="" />
				</div></a>
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

			</div>
		</div>
		<div class="prod-quote">
			<div class="container card-container">
				<span class="arrow-left" id="left"><</span> <span
					class="arrow-right" id="right">></span>
				<%
				try {
					Class.forName("com.mysql.jdbc.Driver");
					String url = "jdbc:mysql://localhost/kratos";
					String username = "root";
					String password = "root";
					String query = "select * from products where category='Weights'";
					Connection conn = DriverManager.getConnection(url, username, password);
					Statement stmt = conn.createStatement();
					ResultSet rs = stmt.executeQuery(query);
					while (rs.next()) {
				%>
				<a href = "prod-desc.jsp?pname=<%=rs.getString("pname")%>"><div class="card">
					<img src=<%=rs.getString("img")%> alt="" />
				</div></a>
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

			</div>
		</div>
		<div class="prod-quote">
			<div class="container card-container" id="cardio">
				<span class="arrow-left" id="left" onclick="scrollleft('cardio')"><</span>
				<span class="arrow-right" id="right" onclick="scrollright('cardio')">></span>
				<%
				try {
					Class.forName("com.mysql.jdbc.Driver");
					String url = "jdbc:mysql://localhost/kratos";
					String username = "root";
					String password = "root";
					String query = "select * from products where category='Cardio'";
					Connection conn = DriverManager.getConnection(url, username, password);
					Statement stmt = conn.createStatement();
					ResultSet rs = stmt.executeQuery(query);
					while (rs.next()) {
				%>
				<a href = "prod-desc.jsp?pname=<%=rs.getString("pname")%>"><div class="card">
					 <img
						src=<%=rs.getString("img")%> alt="" />

				</div></a>
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

			</div>
		</div>
	</main>
	<img src="./assets/Rectangle 45.svg" alt="" class="path top" />
	<img src="./assets/Rectangle 44.svg" alt="" class="path bottom" />
	<script src="./js/app.js">
		
	</script>

	<script>
		function scrollleft(b) {
			type = document.getElementById(b);
			type.scrollBy(-500, 0);
		}
		function scrollright(b) {
			type = document.getElementById(b);
			type.scrollBy(500, 0);
		}
	</script>
</body>
</html>
