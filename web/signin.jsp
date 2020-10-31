<%-- 
    Document   : signin
    Author     : Vishwa Prasad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign in</title>
        <link rel="stylesheet" href="style.css">
    </head>

    <body>
        
        <div class = "header">
            <img src ="./icon.png">
            <h1 align ="center">Digital Library</h1>
        </div>            
        
        <h1 align = center> Sign-in </h1>        
        
                <form action="fetch_user.jsp" method="post">
			<table style = "padding: 20px;" align="center">

				<tr>
					<td>Username</td>
					<td><input type="text" name="username" required/></td>
				</tr>
                             
				<tr>
					<td>Password</td>
					<td><input type="password" name="password" required/></td>
				</tr>

                                <tr>
                                        <td><input type="submit" value="Submit" style = "padding: 10px;"/></td>
                                </tr>
                        </table>
                </form>     
    </body>
</html>
