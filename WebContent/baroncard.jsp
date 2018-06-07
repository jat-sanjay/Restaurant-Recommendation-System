<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.sql.*" %> 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Muli" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Roboto:500,500i" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=PT+Sans+Narrow" rel="stylesheet">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>Insert title here</title>
</head>
<body>
<div class="col-lg-12" style="background-color: #f3f3f3;" >
<br><hr style="height: 2px;color: #000" width="2px;"><br>
<div id="result_para" style="margin-top:-5%">
 <div class="row" style="margin-top:-5%">
  
  <div class="col-lg-12">
  <%
  Connection connection=null;
 Statement statement=null;
ResultSet  resultSet=null;
String id = request.getParameter("userId");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "minor2";
String userId = "root";
String password = "";
String city="";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}


try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT url,positive,negative,neutral,NAME,cuisine,rating,price,city FROM newres LEFT JOIN reviews ON newres.id=reviews.Id WHERE city=' Noida' LIMIT 0,30;";
resultSet = statement.executeQuery(sql);
int i=0,k=0;
while(resultSet.next()){
  i++;k++;
%>

  <div class="col-lg-6">
    <div class="w3-card-2 w3-white" id="<%=resultSet.getString("name") %>">
<div class="w3-container w3-center" style="padding: 20px;">
<div class="col-lg-6">
  <a href="restoview.jsp?search=<%=resultSet.getString("name")%>"><img src="<%=resultSet.getString("url") %>" style="display: inherit;align-self:flex-start;" class="img-thumbnail"></a>
  <br>
  <h6>
  <% 
  if(resultSet.getString("price")!=null)
  {%>
  <span style="margin-left:0%"><%=resultSet.getString("price") %></span>
  <%
  }
  %>
  </h6>
  </div>
<div class="col-lg-6">
  <p  style="font-family: 'Open Sans', sans-serif;font-size: 16px;text-align: left;padding: 20px;padding-bottom:8px;border-bottom-style: solid; border-width: .02px;border-color:  #7a7a52;"
  align="center"><%=resultSet.getString("name") %></p>
  <p style="font-family: 'Muli', sans-serif;padding-left:20px;" align="left"><%=resultSet.getString("cuisine") %></p>
  <p class="glyphicon glyphicon-star-empty" align="right" style="padding-left:84%;"><%=resultSet.getDouble("rating") %></p>
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

}

} catch (Exception e) {
e.printStackTrace();
}
%>
</div> 
</div>
<br>
</div>
<div class="row">
<div class="col-lg-11" align="center">
<input type="hidden" id="result_no" value="10">
<button class="btn btn-warning" id="load" style="padding-left: 49%;padding-right: 42%;padding-top: 1.5%;padding-bottom: 1.5%">Load More</button>
</div>
<div class="col-lg-1 w3-card-4" id="circle" style="padding-top: .5%;padding-left: .7%;">
<a href="#bodytop" id="top" style="color: white;"><span class="glyphicon glyphicon-chevron-up"></span></a>
<script>
$(document).ready(function(){
  // Add smooth scrolling to all links
  $("#top").on('click', function(event) {

    // Make sure this.hash has a value before overriding default behavior
    if (this.hash !== "") {
      // Prevent default anchor click behavior
      event.preventDefault();

      // Store hash
      var hash = this.hash;

      // Using jQuery's animate() method to add smooth page scroll
      // The optional number (800) specifies the number of milliseconds it takes to scroll to the specified area
      $('html, body').animate({
        scrollTop: $(hash).offset().top
      }, 900, function(){
   
        // Add hash (#) to URL when done scrolling (default click behavior)
        window.location.hash = hash;
      });
    } // End if
  });
});
</script>
</div>
</div>
<br>
<br>


</div>
</body>
</html>