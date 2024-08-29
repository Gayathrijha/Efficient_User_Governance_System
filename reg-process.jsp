<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,java.util.*"%>
        <%
String id=request.getParameter("id");
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String email=request.getParameter("email");
String password=request.getParameter("password");
try{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "");
Statement st=conn.createStatement();
int i=st.executeUpdate("insert into users(fname,lname,email,password)values('"+fname+"','"+lname+"','"+email+"','"+password+"')");
out.println("Thank you for registering ! Please <a href='index.html'>Login</a> to continue.");
}catch(Exception e){
System.out.print(e);
e.printStackTrace();
}
%>