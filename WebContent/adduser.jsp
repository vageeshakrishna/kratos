<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="com.UserDao"%>
<%@page import="com.SendEmail"%>
	<jsp:useBean id="u" class="com.User"></jsp:useBean>
	<jsp:setProperty property="*" name="u" />
<%
		String email = request.getParameter("email");
		SendEmail mail = new SendEmail();
		mail.send(email);
	%>
	<%
		int i = UserDao.adduser(u);
		if (i > 0) {
			response.sendRedirect("Umain.jsp");
		} else {
			response.sendRedirect("signup.html");
		}
	%>
	
</body>
</html>