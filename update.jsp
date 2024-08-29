<%@page import="java.sql.DriverManager"%>
    <%@page import="java.sql.ResultSet"%>
        <%@page import="java.sql.Statement"%>
            <%@page import="java.sql.Connection"%>
                <%
String id = request.getParameter("id");
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
                    <%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from users where id="+id;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
                        <!DOCTYPE html>
                        <html>

                        <body>
                            <h1>Update The data</h1>
                            <form method="post" action="update3.jsp">
                                <input type="hidden" name="id" value="<%=resultSet.getString(" id ") %>">
                                <input type="text" name="id" value="<%=resultSet.getString(" id ") %>">
                                <br> fname:
                                <br>
                                <input type="text" name="fname" value="<%=resultSet.getString(" fname ") %>">
                                <br> lname:
                                <br>
                                <input type="text" name="lname" value="<%=resultSet.getString(" lname ") %>">
                                <br> email:
                                <br>
                                <input type="text" name="email" value="<%=resultSet.getString(" email ") %>">
                                <br> password:
                                <br>
                                <input type="text" name="password" value="<%=resultSet.getString(" password ") %>">
                                <br>
                                <br><br>
                                <input type="submit" value="submit">
                            </form>
                            <%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
                        </body>

                        </html>