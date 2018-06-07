<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<link href="https://static.zmtcdn.com/gencss/t-22ad81b76bbc7f79e3d68512c6d4bf4e/l-H4sIAAAAAAAAA8vPy8nMS43PL0pJLcrMS49PLCjQy0ktLgYAMQSvpBgAAAA/h-047a1144fd3d9ed03609c54df1802b21" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Muli" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link href="https://static.zmtcdn.com/gencss/t-22ad81b76bbc7f79e3d68512c6d4bf4e/l-H4sIAAAAAAAAA8vPy8nMS43PL0pJLcrMS49PLCjQy0ktLgYAMQSvpBgAAAA/h-047a1144fd3d9ed03609c54df1802b21" rel="stylesheet">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<div class="row">
	
	<div class="col-lg-12">
	<%
String id = request.getParameter("userId");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "minor2";
String userId = "root";
String password = "";
String city=" Noida"; 

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
int i=0,no=0;
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();

no =Integer.parseInt(request.getParameter("getresult"));

 
String sql ="SELECT url,positive,negative,neutral,NAME,cuisine,rating,price,city FROM newres LEFT JOIN reviews ON newres.id=reviews.Id WHERE city='"+session.getAttribute("city") +"' ORDER BY rating DESC limit "+ no +",10";

resultSet = statement.executeQuery(sql);

while(resultSet.next()){
	i++;
%>

	<div class="col-lg-6">
		<div class=" ui segment">
<div class="w3-container w3-center" style="padding: 20px;">
<div class=" col-lg-6">
 <a href="restoview.jsp?search=<%=resultSet.getString("name")%>"><img src="<%=resultSet.getString("url") %>" style="display: inherit;align-self:flex-start;" class="img-thumbnail"></a>
  <br>
  <% 
  if(resultSet.getString("price")!=null)
  {%>
  <span style="margin-left:0%"><%=resultSet.getString("price") %></span>
  <%
  }
  %>
  </div>
<div class="col-lg-6">
  <p  style="font-family: 'Open Sans', sans-serif;font-size: 16px;text-align: left;padding: 20px;padding-bottom:8px;border-bottom-style: solid; border-width: .02px;border-color:  #7a7a52;"
  align="center"><%=resultSet.getString("name") %></p>
  <p style="font-family: 'Muli', sans-serif;padding-left:20px;" align="left"><%=resultSet.getString("cuisine") %></p>
  <p class="glyphicon glyphicon-star-empty" align="right" style="padding-left:84%;"><%=resultSet.getString("rating") %></p>
   <div class="progress" style="height:5px;">
    <div class="progress-bar progress-bar-success" role="progressbar" style="width:<%=resultSet.getString("positive")%>%">
     
    </div>
    <div class="progress-bar progress-bar-warning" role="progressbar" style="width:<%=resultSet.getString("neutral")%>%">
     
    </div>
    <div class="progress-bar progress-bar-danger" role="progressbar" style="width:<%=resultSet.getString("negative")%>%">
    
    </div>
  </div>
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
	
</div>
<br><br>
<div class="row">
	
	<div class="col-lg-12">
	<%
}

}} catch (Exception e) {
e.printStackTrace();
}
%>
</div>
	
</div>
<br>
<br>