package com;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Loginprocess
 */
@WebServlet("/Loginprocess")
public class Loginprocess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Loginprocess() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uid = request.getParameter("email");
		String pwd = request.getParameter("password");
		if (uid.equals("admin@admin") && pwd.equals("pass") || uid.equals("zod@admin") && pwd.equals("krypton")) {
			response.sendRedirect("AMain.jsp");
		} else {
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kratos", "root", "root");
				String sql = "select * from users where email=? and password=?";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, uid);
				ps.setString(2, pwd);
				ResultSet rs = ps.executeQuery();
				if (rs.next()) {
					response.sendRedirect("Umain.jsp");
				} else {
					response.sendRedirect("login.html");
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}

		}
	}

}