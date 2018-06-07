<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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

<div class="row">
	<div class="col-lg-1"></div>
	<div class="col-lg-10">
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

String id = request.getParameter("getresult");

String[] split=id.split(",");

String sql ="SELECT * FROM restaurant2 WHERE offers IS NOT NULL;";
resultSet = statement.executeQuery(sql);

while(resultSet.next()){
	i++;
%>
<script type="text/javascript">
$(document).on('mouseover', "#<%=resultSet.getInt(1)%>", function () {
    $("#<%=resultSet.getInt(1)%>").addClass("w3-card-4");
   
});

$(document).on('mouseout', "#<%=resultSet.getInt(1)%>", function () {
    $("#<%=resultSet.getInt(1)%>").removeClass("w3-card-4");
   
});


</script>

	<div class="col-lg-6">
		<div class="w3-card-2 w3-white" id="<%=resultSet.getInt(1) %>">
<div class="w3-container w3-center" style="padding: 20px;">
  <img src="<%=resultSet.getString("Imgurl") %>" style="display: inherit;align-self:flex-start;" class="img-thumbnail col-lg-6">
<div class="col-lg-6">
  <p  style="font-family: 'Open Sans', sans-serif;font-size: 16px;text-align: left;padding: 20px;padding-bottom:8px;border-bottom-style: solid; border-width: .02px;border-color:  #7a7a52;"
  align="center"><%=resultSet.getString(2) %></p>
  <p style="font-family: 'Muli', sans-serif;padding-left:20px;" align="left"><%=resultSet.getString(3) %></p>
  <p class="glyphicon glyphicon-star-empty" align="right" style="padding-left:84%;"><%=resultSet.getDouble(5) %></p>
  <p align="right" style="padding-left:54%;"><%=resultSet.getString(6) %></p>
  </div>
</div>

</div>
	</div>
	
<% 
if(i==2)
{
	i=0;
	%>
	</div>
	<div class="col-lg-1"></div>	
</div>
<br><br>
<div class="row">
	<div class="col-lg-1"></div>
	<div class="col-lg-10">
	<%
}

}} catch (Exception e) {
e.printStackTrace();
}
%>
</div>
	<div class="col-lg-1"></div>	
</div>
