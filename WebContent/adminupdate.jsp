<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import = "java.sql.*" %>  
     <%
     session.setAttribute("uname",request.getParameter("name"));
     session.setAttribute("id", request.getParameter("id") );
     String cat1="",cat2="",cat3="";
     String id=request.getParameter("id") ;
     %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Open+Sans:600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Muli" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link href="css/hover.css" rel="stylesheet">
<link href="https://static.zmtcdn.com/gencss/t-22ad81b76bbc7f79e3d68512c6d4bf4e/l-H4sIAAAAAAAAA8vPy8nMS43PL0pJLcrMS49PLCjQy0ktLgYAMQSvpBgAAAA/h-047a1144fd3d9ed03609c54df1802b21" rel="stylesheet">

</head>
<body >
<div class="row" style="margin-top:3%;">
<div class="col-lg-3" align="center">
<h3>Welcome<%=" "+session.getAttribute("uname") %></h3>
</div>
<div class="col-lg-6">
<ul class="nav navbar-nav" style="margin-left:10%;">
<li class="hvr-hang hvr-underline-from-center icon-pulse "><a href="http://localhost:8080/Minor2.0/adminupdate.jsp?name=<%=session.getAttribute("uname") %>&id=<%=session.getAttribute("id")%>"> <span class="glyphicon glyphicon-home"></span> HOME</a></li>
<li class=" hvr-hang dropdown hvr-underline-from-center"> <a href="http://localhost:8080/Minor2.0/adminupdate.jsp?name=<%=session.getAttribute("uname") %>&id=<%=session.getAttribute("id")%>"><span class="glyphicon glyphicon-edit"></span> ADD</a></li>
<li class="active hvr-hang hvr-underline-from-center"><a href="http://localhost:8080/Minor2.0/adminupdate.jsp?name=<%=session.getAttribute("uname") %>&id=<%=session.getAttribute("id")%>"><span class="glyphicon glyphicon-plus"></span>UPDATE</a></li>
</ul>
</div>
 <div class="col-lg-3">  
 <a href="adminviewall.jsp"> <button style="margin-left:8.5%;" type="button" class="btn btn-default" onClick="view()" id="v" >
    <span class="glyphicon glyphicon-briefcase"></span> View All
 </button></a>

  <a href="http://localhost:8080/Minor2.0/adminlogin.jsp"> <button style="margin-left:8.5%;" type="button" class="btn btn-default" onClick="view()" id="v" >
    <span class="glyphicon glyphicon-log-out"></span> LOGOUT
 </button></a>
 </div>
</div>
<%
String email=request.getParameter("email");
String pass=request.getParameter("pass");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "minor2";
String userId = "root";
String password = "";
String res="";

try {
Class.forName(driverName);
} catch (ClassNotFoundException ee) {
ee.printStackTrace();
}

Connection connection = null;

try{ 
connection = (Connection) DriverManager.getConnection(connectionUrl+dbName, userId, password);
PreparedStatement ps=(PreparedStatement) connection.prepareStatement("SELECT * FROM newres WHERE id=?");  
	ps.setString(1,(String)session.getAttribute("id"));  
	ResultSet rs=ps.executeQuery();
	while(rs.next())
	{
	cat1=rs.getString("cat1").toLowerCase();
	cat2=rs.getString("cat2").toLowerCase();
	cat3=rs.getString("cat3").toLowerCase();
	res=rs.getString("name");
	}
	String c1[]=cat1.split(" ");
	if(c1.length>1)
	cat1=c1[0]+"_"+c1[1];
	String c2[]=cat2.split(" ");
	if(c2.length>1)
	cat2=c2[0]+"_"+c2[1];
	String c3[]=cat3.split(" ");
	if(c3.length>1)
	cat3=c3[0]+"_"+c3[1];
}catch(SQLException e)
{
	e.printStackTrace();
}


session.setAttribute("cat1", cat1);
session.setAttribute("cat2", cat2);
session.setAttribute("cat3", cat3);

%>
<h2 align="center"><%=res %></h2>
<div class="row" style="margin-top:4%;">
<div class="col-lg-2">
</div>
<div class="col-lg-8  ui segment">
<form method="post" action="adminupdate">
<br>
<input type="text" style="display: none;" value="<%=id %>" name="onlyid" > 
<h3 align="center"><%=cat1.toUpperCase() %></h3>
<input type="text" style="display: none;" value="<%=cat1 %>" name="cat1" > 
<% 
if(!cat1.equals("null"))
{
connection = null;
try{ 
connection = (Connection) DriverManager.getConnection(connectionUrl+dbName, userId, password);
String sql="SELECT * FROM "+cat1+" WHERE id='"+(String)session.getAttribute("id")+"'";
PreparedStatement ps=(PreparedStatement) connection.prepareStatement(sql);  
	ResultSet rs=ps.executeQuery();
	while(rs.next())
	{
	for(int i=2;i<=31;i++)
	{
		if(!rs.getString(i).equals("Null"))
		{
%>
<div class="form-group col-lg-6">
<input type="text" placeholder="Product" name="item1<%=i %>" value="<%=rs.getString(i) %>" class="form-control ">
</div>
<div class="form-group col-lg-6">
<input type="text" placeholder="Price" name="price1<%=i %>" value="<%=rs.getString(i+30) %>" class="form-control">  
</div>
<%
		}
	}
	}
}catch(SQLException e)
{
	e.printStackTrace();
}
}%>
<input type="text" style="display: none;" value="<%=cat2 %>" name="cat2" > 
<% 
if(!cat2.equals("null"))
{
	%>
	<h3 align="center"><%=cat2.toUpperCase() %></h3>
	
	<%
	connection = null;
try{ 
connection = (Connection) DriverManager.getConnection(connectionUrl+dbName, userId, password);
String sql="SELECT * FROM "+cat2+" WHERE id='"+(String)session.getAttribute("id")+"'";
PreparedStatement ps=(PreparedStatement) connection.prepareStatement(sql);  
	ResultSet rs=ps.executeQuery();
	while(rs.next())
	{
	for(int i=2;i<=31;i++)
	{
		
%>
<div class="form-group col-lg-6">
<input type="text" placeholder="Product" name="item2<%=i %>" value="<%=rs.getString(i) %>" class="form-control ">
</div>
<div class="form-group col-lg-6">
<input type="text" placeholder="Price" name="price2<%=i %>" value="<%=rs.getString(i+30) %>" class="form-control">  
</div>
<%
	
	}
	}
}catch(SQLException e)
{
	e.printStackTrace();
}
}%>


<input type="text" style="display: none;" value="<%=cat3 %>" name="cat3" > 
<% 
if(!cat3.equals("null"))
{
	%>
	<h3 align="center"><%=cat3.toUpperCase() %></h3>
	<%
connection = null;
try{ 
connection = (Connection) DriverManager.getConnection(connectionUrl+dbName, userId, password);
String sql="SELECT * FROM "+cat3+" WHERE id='"+(String)session.getAttribute("id")+"'";
PreparedStatement ps=(PreparedStatement) connection.prepareStatement(sql);  
	ResultSet rs=ps.executeQuery();
	while(rs.next())
	{
	for(int i=2;i<=31;i++)
	{
		if(!rs.getString(i).equals("Null"))
		{
%>
<div class="form-group col-lg-6">
<input type="text" placeholder="Product" name="item3<%=i%>" value="<%=rs.getString(i) %>" class="form-control ">
</div>
<div class="form-group col-lg-6">
<input type="text" placeholder="Price" name="price3<%=i %>" value="<%=rs.getString(i+30) %>" class="form-control">  
</div>
<%
		}
	}
	}
}catch(SQLException e)
{
	e.printStackTrace();
}
}%>


<button class="review_submit_button ui button green" style="margin-top: 14px;margin-left: 85%">Submit </button>
</form>
<div class="col-lg-2">
</div>
</div>
</div>
<br>
</body>
</html>