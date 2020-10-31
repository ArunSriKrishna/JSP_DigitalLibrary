
<%@page import="java.sql.DatabaseMetaData"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%-- 
    Document   : library
    Author     : Arun Sri Krishna
--%>
<%-- 
    Document   : library (ResultSet)
    Author     : Soundarya
--%>
<%-- 
    Document   : library (Session)
    Author     : Vinay M
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
                <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <div class = "header">
        <img src ="./icon.png">
        <h1 align ="center">Digital Library</h1>
        
        <% 
            
            String logged = "0";
            String username = "";
            

            try
            {
                logged = session.getAttribute("loged").toString(); 
                username = session.getAttribute("username").toString();
                out.print("<h3 align = \"right\">Welcome, "+ username + "</h3>");
            }

            catch(Exception e)
            {
                out.println("<h2 align = \"center\">Please Log in to acess the Library, <a href = \"signin.jsp\"> Sign in</a> </h2>."); 
            }
            
        %>
        </div>
        <div class ="dashboard">
            
                 <%  
                     if(logged.equals("1"))
                     {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
                        Statement statement = conn.createStatement();
                        String query = "";
                        if(conn!= null) 
                        {
                            DatabaseMetaData dbm = conn.getMetaData();
                            ResultSet tables = dbm.getTables(null, null, "books", null);
                            if (tables.next()) 
                            {
                                
                            }
                            else
                            {
                               query = "CREATE TABLE books (book_id INTEGER, book_name VARCHAR(20), book_author VARCHAR(20), book_content VARCHAR(1000));";
                               statement.executeUpdate(query);
                            }
                            ResultSet resultset = statement.executeQuery("select * from books");

                            while(resultset.next())
                            {
                               out.print("<div class=\"card\"> <h3> Book Title: "+ resultset.getString(2) +" </h2><h3> Book Author: "+ resultset.getString(3) +"</h2> <button onclick=\"location.href='reader.jsp?book_id="+ resultset.getString(1) +"'\" class=\"button\">Read Book</button></div>");
                            }
                        
                        }
                     }
                 %>

        </div>
        
        
    </body>
</html>
