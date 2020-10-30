<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>


<%
    
    String username = request.getParameter("username");
    String name = request.getParameter("fullname");
    String password = request.getParameter("password");

Connection connection = null;
try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
        Statement stat = con.createStatement();

    String query = "CREATE TABLE users (username VARCHAR(20), name VARCHAR(20), password VARCHAR(20));";
    stat.executeUpdate(query);
    out.println("Table users create sucessfully.");

    query = "insert into users(username, name, password) values ('"+ username + "', '"+ name + "', '"+ password + "');";
    stat.executeUpdate(query);
    out.println("user added sucessfully </br><h2><a href = \"login.jsp\"> Login</a> </h2>.");
}
catch (Exception e)
{
    out.println("Error: " + e.getLocalizedMessage());  
    e.printStackTrace();
}
%>
