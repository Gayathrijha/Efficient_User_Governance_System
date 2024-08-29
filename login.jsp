<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,java.util.*"%>
        <%
String fname=request.getParameter("fname");
session.putValue("fname",fname);
String password=request.getParameter("password");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","");
Statement st= con.createStatement();
ResultSet rs=st.executeQuery("select * from users where fname='"+fname+"' and password='"+password+"'");
try{
while(rs.next())
if(rs.getString("password").equals(password)&&rs.getString("fname").equals(fname)){
out.println("Welcome!");
}
else{
out.println("Invalid password or username.");
}}
catch (Exception e) {
e.printStackTrace();
}
%>
            <html>

            <body>
                <form name=" welcome" method="post">
                    <br><br> WELCOME!
                    <br><br>
                    <input type="button" value="update" onClick="javascript:window.location='retrive-update.jsp';"><input type="button" value="delete" onClick="javascript:window.location='delete1.jsp';">
            </body>

            </html>