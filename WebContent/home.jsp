<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ page import = "java.sql.*" %>  
  
    <% String name = request.getParameter("name");
  String img=request.getParameter("img");
  String email=request.getParameter("email");
  String loc=request.getParameter("loc");
  String man=request.getParameter("manul");
  String img2=request.getParameter("img2");
  String email2=request.getParameter("email2");
  String name2 = request.getParameter("name2");
  if(loc==null)
	  loc=man;
  if(img==null)
	  img=img2;
  if(email==null)
	  email=email2;
  if(name==null)
	  name=name2;
  
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

  Connection connection = null;
  Statement statement = null;
  ResultSet resultSet = null;

  
  
  if(img==null)
  {
    img="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHYAAAB2CAMAAAAqeZcjAAAAVFBMVEXp6ekyicju7Ooqhscfg8by7+sWgcbi5ecOf8Wlwdtkn8/d4ubA0eC3zN7Y3uX28ex5qdKDr9RRlsxcm86Zutivx93Q2uPJ1uJHksuOtNZupNE+jsn0m/9PAAAD2UlEQVRoge2a25arIAyGNQHPWrUeqn3/99zYcQ5VqpBA903/m641a6bfJIQQEoLgo48++uijjz46EwBIJfXxRmRcFf3UKHV9kQfvQENQpfNNREKgklAfbd3nnskQp9dIYPgkFDiXgT8wxFO4Za7k6J56shhkJ4SO+aUoLC8eqHK4H0AXJVns3GDokmPoY5FL6RYazCemrp6eXNoLeauNpL1E7ZBamVIVd3aGjc2pits48jPMFlTF7ZzElZyMoukPt3RgLxSWVKXcAdYaGmLGdrO1ixdFBdfN+Xly0olpLtRWUfxjbs8zl2hseGdhgbKyD3N5q3unUUOcGVgYiT5WOYNhK0ykgFqUcFKVzRnwLGScCHFEpYZhS6ZCQV5atbgxGZsSt8+iaKR6WTbkpVVYckwRM+OXREqOKbuyYoPtyNiMgcWJfAqxsA0Zy3IyuVK3LBk3WHJI/a8N1DHSRUJOF1AwcjI9OQb5fzkK1MFHpmJNP/iAHlOCUTsyTj7G0ipRqZhxKkdyMUXftQ9V1Fjm3QokLT8yDtvVXFJQIffGJykVBmf3rIrtsdjyuxfQW0eVqNjUxc22LZPUSasG7K4kgl7NPGPzm007jHPFfOYOd/PmX+YI+uCa2iuc9pQhvxrFlcsG64MbNOdcRG5O1IDL8AQs2tFt8/yLG9f6scgKxU76mY1chjl6YbEQU+zB1FUyn8JkazKK5JYG/qCLAMapjZKvWdsybUvw2g2e3PsMhnjsp2ZWarp+CHyMNUHqpnfwR7q/Yf4fEBTZzfYyA/2VNWkEKNtILWBq8yUQNwKjW08Gw5hFj6gV2WD6HQDFbdljGLW0HisE3U92QJzMMjxUPykFRUM4FaB6Sv4iPPc0QN7gn00trKMikAVusoIIVR46+BqQQ7OZ76Lo7ZKITDXlsYiyMrjoyACXOG136WuZcNpwLy+GtajI6QCX34cPy0OISzB27W5iv3Jr8xG2PBgR4/L2oEnLcaiUhqLs6tvys1e/L2pTe2V/cgFZUjHid1I+KXdM/Qwlo2Oh4xqVHDAwmlFaCZPEEdsUxYaqTrlge/UwEJ7WztC7pxr0lnPqmOtYeJwmrW93ptjrEZYyEDfTYTMDPETxt163x1hznxMd3HoJ039z4avOgk9jl5brC3OlR6iS0L/GcH0EbPViMCTpw1ozCW1hMjCmpmZYXW+O0Sk3lL4555sahsl+D/kOqEW4n7+xZrWm0rw98Q9VXh62xnIGXMbaHffkxzNW2s9Lrm9YWsXdHH/5O6C7VxEwvmNpd4vr98z71Wbg6D8zrtjr89py3hzY6L7G1D83JjFtGa+NXQAAAABJRU5ErkJggg==";
      name="Your Profile";
  }
  session.setAttribute("uname", name);
  session.setAttribute("uimg", img);
  session.setAttribute("uemail", email);
  session.setAttribute("loc", loc);
 
  Connection con;
  try{
    Class.forName("com.mysql.jdbc.Driver");
    String url="jdbc:mysql://localhost:3306/minor2";
    con = DriverManager.getConnection(url,"root","");
    String query="insert into login values (?,?,?,?,?);";
    PreparedStatement ps=con.prepareStatement(query);
    ps.setString(1, name);
    ps.setString(2,"");
    ps.setString(3, name);
    ps.setString(4, email);
    ps.setString(5,img);
    if(name!="")
    {
    int row=ps.executeUpdate();
    }
  }
  catch(SQLException q)
  {
    q.printStackTrace();
  }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Home Page</title>
<link href="https://fonts.googleapis.com/css?family=Open+Sans:600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Muli" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Roboto:500,500i" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=PT+Sans+Narrow" rel="stylesheet">
<link href="https://static.zmtcdn.com/gencss/t-22ad81b76bbc7f79e3d68512c6d4bf4e/l-H4sIAAAAAAAAA8vPy8nMS43PL0pJLcrMS49PLCjQy0ktLgYAMQSvpBgAAAA/h-047a1144fd3d9ed03609c54df1802b21" rel="stylesheet">
<link href="https://static.zmtcdn.com/gencss/t-fce05e705b469d889fdc20033ca4cdb8/l-H4sIAAAAAAAAA0tKLE7Vz0nVTS_KTNFLLi7WqcrPTUosKYawi0sSSzKTwezi1NzEPCBHH8YAiQIAP2LJTT4AAAA/h-481495e965cf493c1cc6a8439cb835fb" rel="stylesheet">
<link href="https://static.zmtcdn.com/gencss/t-fce05e705b469d889fdc20033ca4cdb8/l-H4sIAAAAAAAAA0tKLE7Vz0nVTS_KTNFLLi7WqcrPTUosKYawi0sSSzKTwezi1NzEPCBHH8YAiQIAP2LJTT4AAAA/h-50c9e2994e278e5aa3e78a79eac02532" rel="stylesheet">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
  .search{
    width: 100%;
    box-sizing: border-box;
    border: 2px solid #ccc;
    border-radius: 4px;
    font-size: 13px;
    background-color: white;
  background-image: url(https://www.w3schools.com/howto/searchicon.png);
    background-position: 10px 10px; 
    background-repeat: no-repeat;
    padding: 21px 20px 21px 40px;
    -webkit-transition: width 0.4s ease-in-out;
    transition: width 0.4s ease-in-out;
}
  #location{
  align-content: flex-end;
    width: 100%;
    box-sizing: border-box;
    border: 2px solid #ccc;
    border-radius: 4px;
    font-size: 13px;
    background-color: #f3f3f3;
    background-position: 10px 10px; 
    background-repeat: no-repeat;
    padding: 12px 10px 12px 10px;
    -webkit-transition: width 0.4s ease-in-out;
    transition: width 0.4s ease-in-out;
}

 .upperLeftButton {
    display: inline-block;
    background-image: url(<%= session.getAttribute("uimg") %>);
    background-repeat: no-repeat;
    background-size: 40%;
  background-position: center;
    background-position: center left 0px;
    height: 40px;
    width: 100px;
  }
</style>
<style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 100%;
      margin: auto;
  }
 </style>
 <style>
  #circle {
      width: 30px;
      height: 30px;
      -webkit-border-radius: 15px;
      -moz-border-radius: 15px;
      border-radius: 15px;
      background:#f5861f;
    }
 </style>
 
 <style>
#search.form-control
{
	width:40%;
	display:inline-block;
}
</style>
 
</head>

<body id="bodytop">
<br>
<div class="row">
  <div class="col-lg-10"></div>
  <div class="col-lg-2 form-group" id="pro"  align="center">
  <div class="header-link">
    <div class="ui button header-icon-button cursor-pointer clearfix top right pointing dropdown mr0 visible"  tabindex="0">

        <div class="ui left inline header-icon-menu header-icon-profile mr5">
            <img class="ui avatar image mr0 mini" data-original="https://b.zmtcdn.com/data/user_profile_pictures/6bd/99a1ed74e933b806ef05c7fe7c14c6bd.jpg?fit=around%7C100%3A100&amp;crop=100%3A100%3B%2A%2C%2A" src="<%=session.getAttribute("uimg") %>" alt="Rahul" style="display: inline-block;">
        </div>
        <div class="vertical menu transition" id="profile" style="width: 200px; right: 0px; left: initial; margin: 8px 0px 0px; display:none" tabindex="-1">

            <a href="http://localhost:8080/Minor2.0/showorder.jsp" class="item">
                Orders
            </a>

                        <div class="ui divider mt0 mb0"></div>
            <a id="logout" href="http://localhost:8080/Minor2.0/logout.jsp" class="item" >Log out</a>
        </div>
		
        <span class="username right ml0">
        <%
        String uuna=session.getAttribute("uname").toString().toUpperCase();
        String aq[]=uuna.split(" ");
        %>
        <%=aq[0] %>
        <i class="ui glyphicon glyphicon-triangle-bottom"></i>
        </span>
	<script>
	$("#pro").click(function(){
	    $("#profile").toggle(100);
	});
	</script>
    </div>
</div>
  </div>
</div>




<div class="row">
<div class="col-lg-1"></div>
<div class="col-lg-2">
<form>
<input type="text" class="form-control  ui segment" style="width: 100%;
    box-sizing: border-box;
    border: 2px solid #ccc;
    border-radius: 4px;
    font-size: 13px;
    background-color: white;
    background-position: 10px 10px; 
    background-repeat: no-repeat;
    padding: 21px 20px 21px 20px;
    -webkit-transition: width 0.4s ease-in-out;
    transition: width 0.4s ease-in-out;" placeholder="Search for restaurants,dishes or cuisines" id="location"  name="curloc"  value="<%=session.getAttribute("loc")%>">
</form>


</div> 
<%
if(loc!="")
{
String[] splitString = (loc.split(","));  
String[] s=new String[15];
int ij=0;
for (String string : splitString)   
{ 
	s[ij]=string;
	ij++;
}
session.setAttribute("city", ""+s[ij-3]);
String g="Noida";
city=""+s[ij-3];
}
%> 
<form class="col-lg-8" name="myform" action="restoview.jsp" method="GET">
<div class="input-group">
<input type="text" class="form-control  ui segment" style="width: 100%;
    box-sizing: border-box;
    border: 2px solid #ccc;
    border-radius: 4px;
    font-size: 13px;
    background-color: white;
  background-image: url(https://www.w3schools.com/howto/searchicon.png);
    background-position: 10px 10px; 
    background-repeat: no-repeat;
    padding: 21px 20px 21px 40px;
    -webkit-transition: width 0.4s ease-in-out;
    transition: width 0.4s ease-in-out;" placeholder="Search for restaurants,dishes or cuisines" name="search" id="search" list="search_list">
    
    <datalist id="search_list">
<%
 connection = null;
 statement = null;
 resultSet = null;
 try{ 
	 connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
	 statement=connection.createStatement();
	
	 String sql11 ="SELECT * FROM newres where city='"+city+"'";
	 resultSet = statement.executeQuery(sql11);
	 while(resultSet.next()){
		 %>
		 <option value="<%=resultSet.getString(3)%>"> 
		 <%
	 	}
	 }catch (Exception e) {
	 	e.printStackTrace();
	 	}


%>

</datalist>
    
 <span class="input-group-btn">
    <button class="btn  ui segment w3-green" id="location" type="submit" style="padding: 5px 30px 38px 30px;margin-top:-11%;font-size: 18px;">Search</button>
  </span>
  </div>
</form>



<div class="col-lg-1">
   </div>
</div>
<div class="row">
<div class="col-lg-1"></div>
<div class="container col-lg-10">
  <br>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">

      <div class="item active">
       <a href="http://localhost:8080/Minor2.0/restoview.jsp?search=Spize"> <img src="https://b.zmtcdn.com/data/res_imagery/311057_RESTAURANT_b676b0be3ff57bb78e11d3dd3081b9d8.jpg" alt="MY Bar Headquaters" ></a>
   		<h3 align="center">Spize</h3>
      </div>

      <div class="item">
       <a href="http://localhost:8080/Minor2.0/restoview.jsp?search=Dabbameal"> <img src="https://b.zmtcdn.com/data/res_imagery/18295657_CHAIN_803842a23c28692d19e1ba94ed51291e.jpg"  alt="Cafeteria & Co."></a>
       <h3 align="center">Dabbameal</h3>
      </div>
    
      <div class="item">
       <a href="http://localhost:8080/Minor2.0/restoview.jsp?search=The%20Saffron%20Boutique"> <img src="https://b.zmtcdn.com/data/res_imagery/18429166_RESTAURANT_3b670a278ad5a7a213ac8b28a60a7060.jpg" alt="The Classroom" ></a>
        <h3 align="center">The Saffron Boutique</h3>
      </div>

      <div class="item">
      <a href="http://localhost:8080/Minor2.0/restoview.jsp?search=Pirates%20of%20Grill">  <img src="https://b.zmtcdn.com/data/res_imagery/18381259_RESTAURANT_13f8416808e95622f1ee53a2724d4142.jpg" alt="The Headquarter" ></a>
        <h3 align="center">The Pirates Of Grill</h3>
      </div>
  
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
<div class="col-lg-1"></div>
</div>

<script type="text/javascript">
$(document).on("click","#load",function(){
  loadmore();
});

function loadmore()
{
 var val = document.getElementById("result_no").value;
 $.ajax({
 type: 'POST',
 url: 'database.jsp',
 data: {
  getresult:val
 },
 success: function (response) {
  var content = document.getElementById("result_para");
  content.innerHTML = content.innerHTML+response;

  // We increase the value by 2 because we limit the results by 2
  document.getElementById("result_no").value = Number(val)+10;
 }
 });
}
</script>

<div class="row" style="padding-top: 2%;">
<div class="col-lg-1"></div>
<div class="col-lg-10" style="border-bottom-style: solid; border-width: .7px;border-color:  #ccc;padding-left: 60%;padding-bottom: 1.6%;color: #1a1a1a;">
<span>Filter By:</span>
<button class="btn btn-default custom-control custom-checkbox" style="padding-right: 5%;padding-left: 5%;">Show Rating Low to High<span><input type="checkbox" name="offer" value="1" style="margin-left:8%;"></span></button>
</div>
<div class="col-lg-1"></div>
</div>

<div class="conatiner-fluid">
<div class="row" style="background-color: #f3f3f3;">
<div class="col-lg-3" style="margin-top: 3%;">
<div class="col-lg-1"></div>
<div class="col-lg-10  ui segment">
<br>
<div id="hcat" style="font-size: 18px; font-family: 'Roboto', sans-serif;">
  <div align="center">Category<span class="glyphicon glyphicon-chevron-down" style="font-size: 10px;margin-left: 15px;"></span></div>
</div>
<hr>
<div id="scat" style="font-family: 'Muli', sans-serif">
<% 
connection=null;
statement=null;
resultSet=null;
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql2 ="SELECT DISTINCT cat1 FROM newres where city='"+city+"'";

resultSet = statement.executeQuery(sql2);
while(resultSet.next()){
	if(resultSet.getString("cat1")!=null)
	{
	%>
<label class="form-group col-lg-12 search_filter checkboxes pb5">
  <input type="checkbox" style="display: none;" class="custom-control-input" name="cuisines" value="<%=resultSet.getString("cat1")%>">
  <span class="form-group"><%=resultSet.getString("cat1")%></span>
</label>

		<%
	}
	}
}catch (Exception e) {
	e.printStackTrace();
	}

%>
</div>
<div  id="hprice" style="font-size: 18px;font-family: 'Roboto', sans-serif;">
  <div align="center">Price<span class="glyphicon glyphicon-chevron-down" style="font-size: 10px;margin-left: 15px;"></span></div>
</div>
<hr>
<div id="sprice">
<% 
connection=null;
statement=null;
resultSet=null;
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql1 ="SELECT DISTINCT pcat FROM newres where city='"+city+"' order by pcat ASC";
resultSet = statement.executeQuery(sql1);
while(resultSet.next()){
	if(resultSet.getString("pcat")!=null)
	{
	%>
<label class="form-group col-lg-12 search_filter checkboxes pb5">
  <input type="checkbox" class="custom-control-input" style="display: none;" name="price" value="<%=resultSet.getString("pcat")%>">
  <%int n=Integer.parseInt(resultSet.getString("pcat"));
 if(n==1)
  {
	  %>
	 <span>&#8377</span>
	 <%
  }
 else if(n==2)
 {
	  %>
	 <span>&#8377&#8377</span>
	 <%
 }
 else if(n==3)
 {
	  %>
	 <span>&#8377&#8377&#8377</span>
	 <%
 }
	}
  %>
</label>

<%
	}
}catch (Exception e) {
	e.printStackTrace();
	}

%>
</div>
<script>
$("#hcat").click(function(){
    $("#scat").toggle();
   
});
$("#hprice").click(function(){
    $("#sprice").toggle();
});
</script>
<script>
var a=1;
$(document).ready(function(){
$(":checkbox").change(function()
		{
			a=0;
			var favorite=[];
			var favprice=[];
			var off=0;
			$.each($("input[name='cuisines']:checked"),function()
			{
				favorite.push($(this).val());
			});
			$.each($("input[name='price']:checked"),function()
					{
						favprice.push($(this).val());
					});
			$.each($("input[name='offer']:checked"),function()
					{
						off=11;
					});
			var pp=favprice.join(",");
			var val=favorite.join(",");
			val+="-"+pp;
		    
		  $.ajax({
			  type: 'POST',
			  url: 'filterview.jsp',
			  data: {
			   getresult:val, offer : off
			  },
			  success: function (response) {
			   var content = document.getElementById("result_para");
			   content.innerHTML = response;

			   // We increase the value by 2 because we limit the results by 2
			   
			  }
			  });
		  
		});
		
});
</script>
</div>
<div class="col-lg-1"></div>
</div>
<div class="col-lg-9" style="background-color: #f3f3f3;" >
<br><hr style="height: 2px;color: #000" width="2px;"><br>
<div id="result_para" style="margin-top:-5%">
 <div class="row" style="margin-top:-5%">
  
  <div class="col-lg-12">
  <%
  connection=null;
  statement=null;
  resultSet=null;

  try{ 
	  connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
	  statement=connection.createStatement();
	  String sql ="SELECT url,positive,negative,neutral,NAME,cuisine,rating,price,city FROM newres LEFT JOIN reviews ON newres.id=reviews.Id WHERE city='"+city+"' ORDER BY rating DESC LIMIT 0,30;";
	  resultSet = statement.executeQuery(sql);
	  int i=0,k=0;
	  while(resultSet.next()){
	    i++;k++;
	  %>
	
		<a href="restoview.jsp?search=<%=resultSet.getString("name")%>">
	    <div class="col-lg-6">
	      <div class=" ui segment" id="<%=resultSet.getString("name") %>">
	  <div class="w3-container w3-center" style="padding: 20px;">
	  <div class="col-lg-6">
	    <img src="<%=resultSet.getString("url") %>" style="display: inherit;align-self:flex-start;" class="img-thumbnail">
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
	    </a>
	    
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
<input type="hidden" id="result_no" value="30">
<button class="btn btn-warning" id="load" style="padding-left: 49%;padding-right: 42%;padding-bottom: 1.5%">Load More</button>
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
</div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>
