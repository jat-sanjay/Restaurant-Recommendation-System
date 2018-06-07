<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import = "java.sql.*" %>  
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
<%
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "minor2";
String userId = "root";
String password = "";
Connection connection = null;
try {
	Class.forName(driverName);
	connection = (Connection) DriverManager.getConnection(connectionUrl+dbName, userId, password);
	} catch (ClassNotFoundException ee) {
	ee.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

	
%>
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
 <a href="viewall.php"> <button style="margin-left:8.5%;" type="button" class="btn btn-default" onClick="view()" id="v" >
    <span class="glyphicon glyphicon-briefcase"></span> View All
 </button></a>

  <a href="http://localhost:8080/Minor2.0/adminlogin.jsp"> <button style="margin-left:8.5%;" type="button" class="btn btn-default" onClick="view()" id="v" >
    <span class="glyphicon glyphicon-log-out"></span> LOGOUT
 </button></a>
 </div>
</div>
<div class="container-fluid" style="margin-top: 4%;">
<div class="row">
<div class="col-lg-2"></div>
<div class="col-lg-8  ui segment">
<%
	String cat1=(String)session.getAttribute("cat1");
    String cat2=(String)session.getAttribute("cat2");
    String cat3=(String)session.getAttribute("cat3");
    if(!cat1.equals("null"))
    {
    String sql="SELECT * FROM "+cat1+" WHERE id='"+(String)session.getAttribute("id")+"'";
    PreparedStatement ps=(PreparedStatement) connection.prepareStatement(sql);  
	ResultSet rs=ps.executeQuery();
%>
<br>
<h2 align="center"><%=cat1.toUpperCase() %></h2>
    <table class="table table-hover" style="margin-top:5%;">
    <tr>
    <th> Item Number </th>
    <th> Product Name </th>
    <th> Price </th>
    <th>    </th>
    </tr>
    <%
    int c=0;
    while(rs.next())
	{
    	c++;
    	for(int i=2;i<=31;i++)
    	{
    %>
      <tr>
      <td><%=i-1 %> </td>
      <td><%=rs.getString(i) %> </td>
      <td><%=rs.getString(i+30) %> </td>
      <td> <a  class="btn btn-primary" href="admindelete.jsp?item=<%=rs.getString(i)%> &cat=<%=cat1%>"> Delete </a></td>
      </tr>
      <%
    	}
	}
	if(c==0)
	{
		%>
		<strong><h2> Record Not Exist </h2></strong>
		<%
	}
    }
	%>
	</table>
	
	<%
    if(!cat2.equals("null"))
    {
    String sql="SELECT * FROM "+cat2+" WHERE id='"+(String)session.getAttribute("id")+"'";
    PreparedStatement ps=(PreparedStatement) connection.prepareStatement(sql);  
	ResultSet rs=ps.executeQuery();
%>
<br>
<h2 align="center"><%=cat2.toUpperCase() %></h2>
    <table class="table table-hover" style="margin-top:5%;">
    <tr>
    <th> Item Number </th>
    <th> Product Name </th>
    <th> Price </th>
    <th>    </th>
    </tr>
    <%
    int c=0;
    while(rs.next())
	{
    	c++;
    	for(int i=2;i<=31;i++)
    	{
    %>
      <tr>
      <td><%=i-1 %> </td>
      <td><%=rs.getString(i) %> </td>
      <td><%=rs.getString(i+30) %> </td>
      <td> <a  class="btn btn-primary" href="admindelete.jsp?item=<%=rs.getString(i)%>&cat=<%=cat2%>"> Delete </a></td>
      </tr>
      <%
    	}
	}
	if(c==0)
	{
		%>
		<strong><h2> Record Not Exist </h2></strong>
		<%
	}
    }
	%>
	</table>
	<%
    if(!cat3.equals("null"))
    {
    String sql="SELECT * FROM "+cat3+" WHERE id='"+(String)session.getAttribute("id")+"'";
    PreparedStatement ps=(PreparedStatement) connection.prepareStatement(sql);  
	ResultSet rs=ps.executeQuery();
%>
<br>
<h2 align="center"><%=cat3.toUpperCase() %></h2>
    <table class="table table-hover" style="margin-top:5%;">
    <tr>
    <th> Item Number </th>
    <th> Product Name </th>
    <th> Price </th>
    <th>    </th>
    </tr>
    <%
    int c=0;
    while(rs.next())
	{
    	c++;
    	for(int i=2;i<=31;i++)
    	{
    %>
      <tr>
      <td><%=i-1 %> </td>
      <td><%=rs.getString(i) %> </td>
      <td><%=rs.getString(i+30) %> </td>
    <td> <a  class="btn btn-primary" href="admindelete.jsp?item=<%=rs.getString(i)%>&cat=<%=cat3%>"> Delete </a></td>
      </tr>
      <%
    	}
	}
	if(c==0)
	{
		%>
		<strong><h2> Record Not Exist </h2></strong>
		<%
	}
    }
	%>
	</table>
	
</div>
<div class="col-lg-2"></div>
</div>
</div>
</body>
</html>