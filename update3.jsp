<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
        <%! String driverName = "com.mysql.jdbc.Driver";%>
            <%!String url = "jdbc:mysql://localhost:3306/student";%>
                <%!String user = "root";%>
                    <%!String psw = "";%>
                        <%
String id = request.getParameter("id");
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String email=request.getParameter("email");
String password=request.getParameter("password");
if(id != null){
Connection con = null;
PreparedStatementps = null;
int ID = Integer.parseInt(id);
try{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="UPDATE users SET id=?,fname=?,lname=?,email=?,password=? WHERE id="+id;
ps = con.prepareStatement(sql);
ps.setString(1,id);
ps.setString(2, fname);
ps.setString(3, lname);
ps.setString(5, email);
ps.setString(4, password);
int i = ps.executeUpdate();
if(i> 0){
out.print("Record Updated Successfully");
}
else{
out.print("There is a problem in updating Record.");
}}
catch(SQLExceptionsql){
request.setAttribute("error", sql);
out.println(sql);
}}
%>