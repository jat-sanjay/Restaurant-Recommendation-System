<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<link href="https://fonts.googleapis.com/css?family=Open+Sans:600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Muli" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="https://static.zmtcdn.com/gencss/t-22ad81b76bbc7f79e3d68512c6d4bf4e/l-H4sIAAAAAAAAA8vPy8nMS43PL0pJLcrMS49PLCjQy0ktLgYAMQSvpBgAAAA/h-047a1144fd3d9ed03609c54df1802b21" rel="stylesheet">

<%
String rev=request.getParameter("comment");
String ID=request.getParameter("getresult");
String finalreview="";
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "minor2";
String userId = "root";
String password = "";
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
try {
	  Class.forName(driverName);
	  } catch (ClassNotFoundException e) {
	  e.printStackTrace();
	  }
%>
<br><br>
<div class="conatiner-fluid">
<div class="row">
<div class="col-lg-12">
<h2 align="center">All Reviews</h2>
</div>

<%


try{ 
	 connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
	 statement=connection.createStatement();
	 String sql ="SELECT * FROM reviews where Id='"+ID+"'";
	 resultSet = statement.executeQuery(sql);
	 while(resultSet.next())
	 {
	%>
	<div class="container-fluid">
	<div class="row">
	<div class="col-lg-3"></div>
	<div class="col-lg-6">
	<div class="progress">
  <div class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar"
  aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:<%=resultSet.getString(3)%>%;color:black">
  Positive
  </div>
</div>
</div>
<div class="col-lg-3"></div>
</div>
</div>
<div class="container-fluid">
	<div class="row">
	<div class="col-lg-3"></div>
	<div class="col-lg-6">
	<div class="progress">
  <div class="progress-bar progress-bar-danger progress-bar-striped active" role="progressbar"
  aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:<%=resultSet.getString(4)%>%;color:black">
  Negative
  </div>
</div>
</div>
<div class="col-lg-3"></div>
</div>
</div>

<div class="container-fluid">
	<div class="row">
	<div class="col-lg-3"></div>
	<div class="col-lg-6">
	<div class="progress">
  <div class="progress-bar progress-bar-warning progress-bar-striped active" role="progressbar"
  aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:<%=resultSet.getString(5)%>%;color:black">
  Neutral
  </div>
</div>
</div>
<div class="col-lg-3"></div>
</div>
</div>
	
	<%	 
	if(rev!="")
	{
		if(resultSet.getString(2)==null)
		finalreview=session.getAttribute("uname")+"#"+rev;
		else
		{
			finalreview=resultSet.getString(2)+"@"+session.getAttribute("uname")+"#"+rev;
		}
	}	
	else
		finalreview=resultSet.getString(2);
	
        String arr[]=finalreview.split("@");
        for (String string : arr)   
        {
        	String st[]=string.split("#");
        	%>
<div class="col-lg-12" align="center">

        	<div class="media">
  <div class="media-left media-top">
    <img src="https://www.w3schools.com/bootstrap/img_avatar1.png" class="media-object" style="width:60px">
  </div>
  <div class="media-body">
    <h4 class="media-heading"><%=st[0] %></h4>
    <p style="text-align: justify;"><%=st[1] %></p>
  </div>
</div>
</div>
        	<%
        }
%>

</div>
</div>
<%

}
}catch(Exception e)
{
	 e.printStackTrace();
}
%>

<%
connection = null;
statement = null;
resultSet = null;
	try{ 
	connection = (Connection) DriverManager.getConnection(connectionUrl+dbName, userId, password);
	statement=(Statement) connection.createStatement();
    
	if(rev!="")
	{
	String sql ="UPDATE reviews SET comment='"+finalreview+"' where Id='"+ID+"'";
	PreparedStatement ps=(PreparedStatement) connection.prepareStatement(sql);
	int row=ps.executeUpdate();
	}
}catch(Exception e) 
	{
		e.printStackTrace();
	}
	
%>