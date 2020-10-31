<%-- 
    Document   : reader
    Author     : Arun Sri Krishna
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <div class = "header">
            <img src ="./icon.png">
            <h1 align ="center">Digital Library</h1>
        </div>
        
        <h1 align = center> Reader </h1>
        <% 
            try
            {
                String logged = session.getAttribute("loged").toString(); 
                if(logged.equals("1"))
                {
                    String book_id = request.getParameter("book_id");
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
                    Statement statement = conn.createStatement();

                    ResultSet resultset = statement.executeQuery("select book_content from books where book_id = "+ book_id);

                           resultset.next();
                           out.print("<div class = \"page\">" + resultset.getString(1) + "<br><br><button onclick=\"location.href='library.jsp'\">Close Book</button></div>");

                }
                
            }
            catch(Exception e)
            {
                out.println("<h2 align = \"center\"> Error: " + e.getLocalizedMessage());  
                out.println("<h2 align = \"center\">Please Log in to acess the Book, <a href = \"signin.jsp\"> Sign in</a> </h2>."); 
                    
            }        
        %>
    </body>
</html>