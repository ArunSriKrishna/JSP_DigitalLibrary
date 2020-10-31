<%-- 
    Document   : fetch_user
    Author     : Vishwa Prasad
--%>
<%-- 
    Document   : fetch_user (Session)
    Author     : Vinay M
--%>


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
    String password = request.getParameter("password");
    
    
    String query = "";
    
    Statement stat = null;
    Connection conn = null;
    
try 
{
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
        stat = conn.createStatement();
        
        if(conn!= null) 
        {
           ResultSet rs=stat.executeQuery("select * from users where username='"+ username +"' and password='"+ password +"'"); 
        
        rs.next();
            if(rs.getString("password").equals(password)&&rs.getString("username").equals(username))
            {
                out.println("<h2 align = \"center\">Sucessfully Logged in! <a href = \"library.jsp\"> Continue</a> </h2>"); 
                
                session.setAttribute("loged", 1); //Author     : Vinay M
                session.setAttribute("username", username); 
                
            }
        }
                

}
catch (Exception e)
{
    out.println("<h2 align = \"center\"> Error: " + e.getLocalizedMessage() + " <a href = \"signin.jsp\">Try again?</a> </h2>");  
}

%>
