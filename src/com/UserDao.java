package com;

import java.sql.*;

public class UserDao {

	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kratos", "root", "root");
		} catch (Exception e) {
			System.out.println(e);
		}
		return con;
	}

	public static int adduser(User u) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("insert into users(name,email,address,password) values(?,?,?,?)");
			ps.setString(1, u.getName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getAddress());
			ps.setString(4,u.getPassword());
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int addBill(User u) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("insert into users(pname,desc,price,img) values(?,?,?,?)");
			ps.setString(1, u.getPname());
			ps.setString(2, u.getDesc());
			ps.setInt(3, u.getPrice());
			ps.setString(4, u.getImg());
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	public static int addProduct(User u) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("insert into product (pname,desc,price,quantity,img,category) values(?,?,?,?,?,?)");
			ps.setString(1, u.getPname());
			ps.setString(2, u.getDesc());
			ps.setInt(3, u.getPrice());
			ps.setInt(4, u.getQuantity());
			ps.setString(5, u.getImg());
			ps.setString(6, u.getCategory());
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	public static int addUserDefect(User u) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("insert into defectreport(prodname,defectdesc) values(?,?)");
			ps.setString(1, u.getPname());
			ps.setString(2, u.getDefectdesc());
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	public static int acceptUserDefect(String pname,String defectdesc) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("insert into resolveddefect values('"+ pname +"','"+ defectdesc +"')");
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	public static int rejectUserDefect(String pname,String defectdesc) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("insert into rejecteddefect values('"+ pname +"','"+ defectdesc +"')");
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	public static int removeDefect(String pname) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("delete from defectreport where prodname='"+pname+"'");
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	public static int addcontact(User u) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("insert into contact(email) values(?)");
			ps.setString(1, u.getEmail());
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
}
