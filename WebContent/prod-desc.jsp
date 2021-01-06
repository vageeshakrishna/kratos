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
	<%
		String name = request.getParameter("pname");
	%>
    <nav>
      <img src="./assets/Logo.svg" alt="kratos-logo" class="logo" />
      <ul>
        <li>log out</li>
      </ul>
    </nav>
    <main>
    <%
				try {
					Class.forName("com.mysql.jdbc.Driver");
					String url = "jdbc:mysql://localhost/kratos";
					String username = "root";
					String password = "root";
					String query = "select * from products where pname='" + name + "'";
					Connection conn = DriverManager.getConnection(url, username, password);
					Statement stmt = conn.createStatement();
					ResultSet rs = stmt.executeQuery(query);
					while (rs.next()) {
				%>
      <img id="prod-back" src="./assets/prod-desc-back.svg" alt="" />
      <div class="prod-quote prod-page">
			<div class="container card-container ">
      <div class="card ">
					<img src=<%=rs.getString("img")%> alt="" />
				</div>
				<h3> <%=rs.getString("pname")%></h3>
				<h3><%=rs.getString("desc")%></h3>
				<h3><%=rs.getString("price")%></h3>
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
      </div></div>
    </main>
  </body>
</html>
