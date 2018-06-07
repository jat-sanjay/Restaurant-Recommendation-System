<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.DriverManager"%>
    <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "minor2";
String userId = "root";
String password = "";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
int i=0;
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String s=request.getParameter("keyword");
String sql="";
if(s!=null)
 sql="SELECT DISTINCT city  FROM restaurant2 WHERE city LIKE'"+s+"%' ORDER BY city LIMIT 0,4";
resultSet = statement.executeQuery(sql);
%>
<ul id="country-list">
<%
while(resultSet.next())
{
%>
<h1><%=sql %></h1>
<li onClick="selectCountry('<%=resultSet.getString(14)%>');"><%=resultSet.getString(14)%></li>
<%
}
}
catch (Exception e) {
e.printStackTrace();
}
%>
</ul>
</body>
</html>