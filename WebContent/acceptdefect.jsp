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
	<jsp:useBean id="u" class="com.User"></jsp:useBean>
	<jsp:setProperty property="*" name="u" />
	<%
	String pname=request.getParameter("pname");
	String defectdesc = request.getParameter("defectdesc");
		int i = UserDao.acceptUserDefect(pname,defectdesc);
		if (i > 0) {
			response.sendRedirect("managedefect.jsp");
			UserDao.removeDefect(pname);
		} else {
			response.sendRedirect("signup.html");
		}
		
	%>

</body>
</html>