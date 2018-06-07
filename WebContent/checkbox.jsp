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

<%
String driverName1 = "com.mysql.jdbc.Driver";
String connectionUrl1 = "jdbc:mysql://localhost:3306/";
String dbName1 = "minor2";
String userId1 = "root";
String password1 = "";
Connection connection1 = null;
Statement statement1 = null;
ResultSet resultSet1 = null;
try {
Class.forName(driverName1);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

try{ 
connection1 = DriverManager.getConnection(connectionUrl1+dbName1, userId1, password1);
statement1=connection1.createStatement();
String sql1="SELECT DISTINCT cat1 FROM restaurant2";
resultSet1 = statement1.executeQuery(sql1);
int p=0,j=0;
%>
<div class="col-lg-3">
<%
while(resultSet1.next()&&j<=3){
	p++;
	%>
<label class="form-group">
  <input type="checkbox" class="custom-control-input" name="cuisines" value="<%=resultSet1.getString("cat1")%>">
  <span class="form-group"><%=resultSet1.getString("cat1")%></span>
</label>
<br>
	<% 
	if(p==5)
	{
		j++;
		p=0;
		%>
		</div>
		<div class="col-lg-3">
		<%
	}
}
%>
</div>
<%
}catch (Exception e) {
	e.printStackTrace();
	}finally {
	    try { resultSet1 .close(); } catch (Exception e) { /* ignored */ }
	    try { statement1.close(); } catch (Exception e) { /* ignored */ }
	    try { connection1.close(); } catch (Exception e) { /* ignored */ }
	}
%>

