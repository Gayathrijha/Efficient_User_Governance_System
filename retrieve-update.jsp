<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <%@ page import="java.sql.*" %>
        <%@ page import="java.io.*" %>
            <%@page import="java.sql.DriverManager"%>
                <%@page import="java.sql.ResultSet"%>
                    <%@page import="java.sql.Statement"%>
                        <%@page import="java.sql.Connection"%>
                            <%
String fname  = request.getParameter("fname");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "student";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
                                <html>

                                <body>
                                    <h1>Retrieve data </h1>
                                    <table border="1">
                                        <tr>
                                            <td>F_name</td>
                                            <td>L_name</td>
                                            <td>Email</td>
                                            <td>Password</td>
                                            <td>update</td>
                                        </tr>
                                        <%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from users";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
                                            <tr>
                                                <td>
                                                    <%=resultSet.getString("fname") %>
                                                </td>
                                                <td>
                                                    <%=resultSet.getString("lname") %>
                                                </td>
                                                <td>
                                                    <%=resultSet.getString("email") %>
                                                </td>
                                                <td>
                                                    <%=resultSet.getString("password") %>
                                                </td>
                                                <td><a href="update.jsp?id=<%=resultSet.getString(" id ")%>">update</a></td>
                                            </tr>
                                            <%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
                                    </table>
                                </body>

                                </html>