<%-- 
    Document   : register
    Created on : 30 Oct, 2020, 7:59:18 PM
    Author     : Nagashree MK
--%>

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
        
        <h1 align = center> Register </h1>
        
                <form action="add_user.jsp" method="post">
			<table style = "padding: 20px;" align="center">

				<tr>
					<td>Username</td>
					<td><input type="text" name="username" required/></td>
				</tr>
                                
                                <tr>
					<td>Name</td>
					<td><input type="text" name="fullname" required/></td>
				</tr>
                                
				<tr>
					<td>Password</td>
					<td><input type="password" name="password" required/></td>
				</tr>
                                <tr>
					<td>Confirm Password</td>
					<td><input type="password" name="confirmpassword" required/></td>
				</tr>
                                
                                <tr>
                                        <td><input type="submit" value="Submit" style = "padding: 10px;"/></td>
                                </tr>
                        </table>
                </form>

    </body>
</html>
