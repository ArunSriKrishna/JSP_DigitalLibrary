<head>
            <link rel="stylesheet" href="style.css">
</head>
    <body>
        <div class = "header">
            <img src ="./icon.png">
            <h1 align ="center">Digital Library</h1>
        </div>
    </body>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>


<%
    
    String username = request.getParameter("username");
    String name = request.getParameter("fullname");
    String password = request.getParameter("password");
    String query = "";
    
    Statement stat = null;
    Connection connection = null;
    
try {
    
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
        stat = con.createStatement();

        /*
        TODO: Check if table already exists
           query = "CREATE TABLE users (username VARCHAR(20), name VARCHAR(20), password VARCHAR(20));";
           stat.executeUpdate(query);
           out.println("Table users create sucessfully.");
       */

}
catch (Exception e)
{
    out.println("Error: " + e.getLocalizedMessage());  
}

finally
{
    query = "insert into users(username, name, password) values ('"+ username + "', '"+ name + "', '"+ password + "');";
    stat.executeUpdate(query);
    out.println("<h2 align = \"center\">Registration Successful! You can now, <a href = \"signin.jsp\"> Sign in</a> </h2>.");   
}
%>
