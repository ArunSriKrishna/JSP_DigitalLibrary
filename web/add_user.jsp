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
    String confirmpassword = request.getParameter("confirmpassword");
    String query = "";
    
    Statement stat = null;
    Connection conn = null;
    
try {
    
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
        stat = conn.createStatement();

        //function to check if the table already exists
        if(conn!= null) 
        {
            DatabaseMetaData dbm = conn.getMetaData();
            ResultSet tables = dbm.getTables(null, null, "users", null);
            if (tables.next()) 
            {
               query = "DROP TABLE users;";
               stat.executeUpdate(query);
               
               query = "CREATE TABLE users (username VARCHAR(20), name VARCHAR(20), password VARCHAR(20));";
               stat.executeUpdate(query);
            }

            else
            {
               query = "CREATE TABLE users (username VARCHAR(20), name VARCHAR(20), password VARCHAR(20));";
               stat.executeUpdate(query);
            }
        }
    //function to check the verify password matches
    if(confirmpassword.equals(password))   
    {
        query = "insert into users(username, name, password) values ('"+ username + "', '"+ name + "', '"+ password + "');";
        if(conn!= null)
        stat.executeUpdate(query);

        out.println("<h2 align = \"center\">Registration Successful! You can now, <a href = \"signin.jsp\"> Sign in</a> </h2>.");  
    }
    else
    {
        out.println("<h2 align = \"center\"> Error: Passwords do not match! <a href = \"register.jsp\">Try again?</a> </h2>"); 
    }
        

}
catch (Exception e)
{
    out.println("<h2 align = \"center\"> Error: " + e.getLocalizedMessage() + " <a href = \"register.jsp\">Try again?</a> </h2>");  
}

%>
