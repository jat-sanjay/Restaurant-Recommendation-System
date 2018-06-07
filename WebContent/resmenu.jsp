<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import= "java.util.*"  %>
<%
  String driverName = "com.mysql.jdbc.Driver";
  String connectionUrl = "jdbc:mysql://localhost:3306/";
  String dbName = "minor2";
  String userId = "root";
  String password = "";
  String nam=request.getParameter("search");
  String cat1="";
  String cat2="";
  String cat3="";
  session.setAttribute("","cart");
  try {
  Class.forName(driverName);
  } catch (ClassNotFoundException e) {
  e.printStackTrace();
  }

  Connection connection = null;
  Statement statement = null;
  ResultSet resultSet = null;
  %>
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Muli" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link href="https://fonts.googleapis.com/css?family=Droid+Serif:400,400i,700,700i" rel="stylesheet">
<link href="https://static.zmtcdn.com/gencss/t-22ad81b76bbc7f79e3d68512c6d4bf4e/l-H4sIAAAAAAAAA8vPy8nMS43PL0pJLcrMS49PLCjQy0ktLgYAMQSvpBgAAAA/h-047a1144fd3d9ed03609c54df1802b21" rel="stylesheet">
<link href="https://static.zmtcdn.com/gencss/t-fce05e705b469d889fdc20033ca4cdb8/l-H4sIAAAAAAAAA0tKLE7Vz0nVTS_KTNFLLi7WqcrPTUosKYawi0sSSzKTwezi1NzEPCBHH8YAiQIAP2LJTT4AAAA/h-50c9e2994e278e5aa3e78a79eac02532" rel="stylesheet">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<style type="text/css">
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
</style>
</head>
<body>
<br>
<div class="row">
  <div class="col-lg-8"></div>
  <div class="col-lg-2" align="right"><a href="resmenu.jsp?search=<%=nam%>"><button class="btn btn-success">Order Food Online</button></a></div>
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
</div>    </div>
</div>

<div class="row">
<div class="col-lg-1"></div>
<div class="col-lg-2">
<form>
  <input type="text" class="form-control ui segment" style="width: 100%;
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
<form class="col-lg-6" name="myform" action="restoview.jsp" method="GET">
<div class="input-group">
<input type="text" class="form-control ui segment" style="width: 100%;
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
	 String sql1 ="SELECT * FROM newres where city='"+session.getAttribute("city")+"'";

	 resultSet = statement.executeQuery(sql1);
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
    <button class="btn ui segment w3-green" id="location" type="submit" style="padding: 5px 30px 38px 30px;margin-top:-11% ;font-size: 18px;">Search</button>
  </span>
  </div>
</form>



<div class="col-lg-3">
  </div>
</div>

<br>

<div class="container-fluid">
	 <div class="row">
	 <div class="col-lg-3"></div>
	 <div class="col-lg-6 ui segment">
      <div class="container-fluid">
      <div class="row">
      <div class="col-lg-12">
<%
 connection = null;
 statement = null;
 resultSet = null;
 String ID="";
 
 try{ 
	 connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
	 statement=connection.createStatement();
	 String sql ="SELECT * FROM newres where name='"+nam+"'"+"AND city='"+session.getAttribute("city")+"'";
	 resultSet = statement.executeQuery(sql);
	 while(resultSet.next())
	 {
		 ID=resultSet.getString(1);
	 %>
	 <div class="container-fluid">
	 <div class="row">
	 <div class="col-lg-12" >
	 <img src="<%=resultSet.getString(2)%>" width="100%" height="40%">
	 </div>
	 
	 </div>
	 </div>
	 <br>
	 <div class="container-fluid">
	 <div class="row" style="margin-bottom: 6%;">
	 <div class="col-lg-12">
	 <div class="col-lg-10">
	 <h1 style="font-family: 'Droid Serif', serif;"><%=resultSet.getString(3) %></h1>
	 </div>
	 <div class="col-lg-2" style="background-color: #eea236;padding-left: 5.0%;padding-right: 1.7%;padding-top: 2%;padding-bottom: 2%">
	 <h2 style="font-family: 'Droid Serif', serif;color:#fff;"><%=resultSet.getString(6) %><span style="font-size:20px;color:#f1f1f1">/5</span></h2>
	 </div>
	 </div>
	 </div>
	 </div>	 
	 <%

	 cat1=resultSet.getString(8).toLowerCase();
	 cat2=resultSet.getString(9).toLowerCase();
	 cat3=resultSet.getString(10).toLowerCase();
	 }
	 
	 }catch (Exception e) {
	 	e.printStackTrace();
	 	}


%>
</div>
</div>
</div>
<br>
<br>

<div class="container-fluid">
<div class="row">
<div class="col-lg-12">
<h2 style="background-color: #f3f3f3;padding: 2%;margin-top: 1%;"><%=cat1.toUpperCase() %></h2>
<hr>
<%
ArrayList<String> pname=new ArrayList<String>();
session.setAttribute("pname",pname);
ArrayList<String> pprice=new ArrayList<String>();
session.setAttribute("pprice",pprice);
ArrayList<String> pquan=new ArrayList<String>();
session.setAttribute("pquan",pquan);


connection = null;
statement = null;
resultSet = null;
String c1[]=cat1.split(" ");
if(c1.length>1)
cat1=c1[0]+"_"+c1[1];
try{ 
	 connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
	 statement=connection.createStatement();
	 String sql ="SELECT * FROM "+cat1+" where id='"+ID+"'";
	 resultSet = statement.executeQuery(sql);
	 %>
	 <script>
	 function aja(name,price,quant)
	 {

	 }
	 </script>
	 <%
	 while(resultSet.next())
	 {
		 for(int io=2;io<=31;io++)
		 {
		 %>
		 <h4 class="col-lg-9" style="margin-top: -1%;"><%=resultSet.getString(io)%></h4><div id="sc1<%=io%>" ><a class="ui basic green button add-item" id="addcart1<%=io%>">Add</a></div>
		 
		 
		 <script>
		 $("#addcart1<%=io%>").click(function(){
			 $("#sc1<%=io%>").html('<span class="super_number menu right"><button class="ui left attached button dec" id="dec1<%=io%>"> &#8211 </button><input type="text" value="1" id="num1<%=io%>"  class="qty"><button class="ui right attached button inc" id="inc1<%=io%>"> + </button></span>')
			 aditem1<%=io%>();	
			 $.ajax({
				  type: 'POST',
				  url: 'showcart.jsp',
				  data: {
				  getresult:"<%=resultSet.getString(io)%>", offer :"<%=resultSet.getString(io+30)%>" , quantity :"1"
				  },
				  success: function (response) {
				   var content = document.getElementById("cart");
				   content.innerHTML =response;
				  }
				  });
			  
		 });
		 
		 function aditem1<%=io%>()
		 {
		 $("#dec1<%=io%>").click(function(){
			   var v=document.getElementById("num1<%=io%>").value;
			   if(v>0)
			   v--;
			   document.getElementById("num1<%=io%>").value = v;
			   $.ajax({
					  type: 'POST',
					  url: 'showcart.jsp',
					  data: {
					  getresult:"<%=resultSet.getString(io)%>", offer :"<%=resultSet.getString(io+30)%>" , quantity :v
					  },
					  success: function (response) {
					   var content = document.getElementById("cart");
					   content.innerHTML =response;
					  }
					  });
			});
		  $("#inc1<%=io%>").click(function(){
			   var v=document.getElementById("num1<%=io%>").value;
			   if(v<50)
			   v++;	 
			   document.getElementById("num1<%=io%>").value = v;
			   $.ajax({
					  type: 'POST',
					  url: 'showcart.jsp',
					  data: {
					  getresult:"<%=resultSet.getString(io)%>", offer :"<%=resultSet.getString(io+30)%>" , quantity :v
					  },
					  success: function (response) {
					   var content = document.getElementById("cart");
					   content.innerHTML =response;
					  }
					  });
			});
		 }
		 
		 </script>
		 <h6 style="padding-right: 78%;padding-left: 1.5%"><span>&#8377</span><%=resultSet.getString(io+30) %></h6>
		 <%if(io!=31){ %>
		 <hr>
		 <%} %>
		 <%
		 }
	 }}catch(SQLException e)
	 {
		 e.printStackTrace();
	 }
%>
<br>
</div>
</div>
</div>


<div class="container-fluid">
<div class="row">
<div class="col-lg-12">
<%if(!"null".equals(cat2)){%>
<h2 style="background-color: #f3f3f3;padding: 2%;margin-top: 1%;"><%=cat2.toUpperCase() %></h2>
<%} %>
<hr>
<%
connection = null;
statement = null;
resultSet = null;
String c2[]=cat2.split(" ");
if(c2.length>1)
cat2=c2[0]+"_"+c2[1];
try{ 
	 connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
	 statement=connection.createStatement();
	 String sql ="SELECT * FROM "+cat2+" where id='"+ID+"'";
	 resultSet = statement.executeQuery(sql);
	 %>
	 <script>
	 function aja(name,price,quant)
	 {

	 }
	 </script>
	 <%
	 while(resultSet.next())
	 {
		 for(int io=2;io<=31;io++)
		 {
		 %>
		 <h4 class="col-lg-9" style="margin-top: -1%;"><%=resultSet.getString(io)%></h4><div id="sc2<%=io%>" ><a class="ui basic green button add-item" id="addcart2<%=io%>">Add</a></div>
		 
		 
		 <script>
		 $("#addcart2<%=io%>").click(function(){
			 $("#sc2<%=io%>").html('<span class="super_number menu right"><button class="ui left attached button dec" id="dec2<%=io%>"> &#8211 </button><input type="text" value="1" id="num2<%=io%>"  class="qty"><button class="ui right attached button inc" id="inc2<%=io%>"> + </button></span>')
			 aditem2<%=io%>();	
			 
			 $.ajax({
				  type: 'POST',
				  url: 'showcart.jsp',
				  data: {
				  getresult:"<%=resultSet.getString(io)%>", offer :"<%=resultSet.getString(io+30)%>" , quantity :"1"
				  },
				  success: function (response) {
				   var content = document.getElementById("cart");
				   content.innerHTML =response;
				  }
				  });
			  
		 });
		 
		 function aditem2<%=io%>()
		 {
		 $("#dec2<%=io%>").click(function(){
			   var v=document.getElementById("num2<%=io%>").value;
			   if(v>0)
			   v--;
			   document.getElementById("num2<%=io%>").value = v;
			   $.ajax({
					  type: 'POST',
					  url: 'showcart.jsp',
					  data: {
					  getresult:"<%=resultSet.getString(io)%>", offer :"<%=resultSet.getString(io+30)%>" , quantity :v
					  },
					  success: function (response) {
					   var content = document.getElementById("cart");
					   content.innerHTML =response;
					  }
					  });
			});
		  $("#inc2<%=io%>").click(function(){
			   var v=document.getElementById("num2<%=io%>").value;
			   if(v<50)
			   v++;	 
			   document.getElementById("num2<%=io%>").value = v;
			   $.ajax({
					  type: 'POST',
					  url: 'showcart.jsp',
					  data: {
					  getresult:"<%=resultSet.getString(io)%>", offer :"<%=resultSet.getString(io+30)%>" , quantity :v
					  },
					  success: function (response) {
					   var content = document.getElementById("cart");
					   content.innerHTML =response;
					  }
					  });
			});
		 }
		 
		 </script>
		 <h6 style="padding-right: 78%;padding-left: 1.5%"><span>&#8377</span><%=resultSet.getString(io+30) %></h6>
		 <%if(io!=31){ %>
		 <hr>
		 <%} %>
		 <%
		 }
	 }}catch(SQLException e)
	 {
		 e.printStackTrace();
	 }
%>
<br>
</div>
</div>
</div>



<div class="container-fluid">
<div class="row">
<div class="col-lg-12">
<%if(!"null".equals(cat3)){%>
<h2 style="background-color: #f3f3f3;padding: 2%;margin-top: 1%;"><%=cat3.toUpperCase() %></h2>
<%} %>
<hr>
<%
connection = null;
statement = null;
resultSet = null;
String c3[]=cat3.split(" ");
if(c3.length>1)
cat3=c3[0]+"_"+c3[1];
try{ 
	 connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
	 statement=connection.createStatement();
	 String sql ="SELECT * FROM "+cat3+" where id='"+ID+"'";
	 resultSet = statement.executeQuery(sql);
	 %>
	 <script>
	 function aja(name,price,quant)
	 {

	 }
	 </script>
	 <%
	 while(resultSet.next())
	 {
		 for(int io=2;io<=31;io++)
		 {
		 %>
		 <h4 class="col-lg-9" style="margin-top: -1%;"><%=resultSet.getString(io)%></h4><div id="sc3<%=io%>" ><a class="ui basic green button add-item" id="addcart3<%=io%>">Add</a></div>
		 
		 
		 <script>
		 $("#addcart3<%=io%>").click(function(){
			 $("#sc3<%=io%>").html('<span class="super_number menu right"><button class="ui left attached button dec" id="dec3<%=io%>"> &#8211 </button><input type="text" value="1" id="num3<%=io%>"  class="qty"><button class="ui right attached button inc" id="inc3<%=io%>"> + </button></span>')
			 aditem3<%=io%>();	
			 $.ajax({
				  type: 'POST',
				  url: 'showcart.jsp',
				  data: {
				  getresult:"<%=resultSet.getString(io)%>", offer :"<%=resultSet.getString(io+30)%>" , quantity :"1"
				  },
				  success: function (response) {
				   var content = document.getElementById("cart");
				   content.innerHTML =response;
				  }
				  });
			  
		 });
		 
		 function aditem3<%=io%>()
		 {
		 $("#dec3<%=io%>").click(function(){
			   var v=document.getElementById("num3<%=io%>").value;
			   if(v>0)
			   v--;
			   document.getElementById("num3<%=io%>").value = v;
			   $.ajax({
					  type: 'POST',
					  url: 'showcart.jsp',
					  data: {
					  getresult:"<%=resultSet.getString(io)%>", offer :"<%=resultSet.getString(io+30)%>" , quantity :v
					  },
					  success: function (response) {
					   var content = document.getElementById("cart");
					   content.innerHTML =response;
					  }
					  });
			});
		  $("#inc3<%=io%>").click(function(){
			   var v=document.getElementById("num3<%=io%>").value;
			   if(v<50)
			   v++;	 
			   document.getElementById("num3<%=io%>").value = v;
			   $.ajax({
					  type: 'POST',
					  url: 'showcart.jsp',
					  data: {
					  getresult:"<%=resultSet.getString(io)%>", offer :"<%=resultSet.getString(io+30)%>" , quantity :v
					  },
					  success: function (response) {
					   var content = document.getElementById("cart");
					   content.innerHTML =response;
					  }
					  });
			});
		 }
		 
		 </script>
		 <h6 style="padding-right: 78%;padding-left: 1.5%"><span>&#8377</span><%=resultSet.getString(io+30) %></h6>
		 <%if(io!=31){ %>
		 <hr>
		 <%} %>
		 <%
		 }
	 }}catch(SQLException e)
	 {
		 e.printStackTrace();
	 }
%>
<br>
</div>
</div>
</div>





</div>


<div class="col-lg-3">
<br>
<div class="container-fluid">
<div class="row">
<div class="col-lg-12 delivery-subzone-checker ui segment" style="background: rgba(252, 207, 93, 0.3); border-color: rgb(252, 207, 93);"><h3>Delivery Location</h3><div><div class="row"><div class="col-s-16"><div class="ui form"><div class="ui search subzone-checker"><div class="ui left icon fluid input" style="float: none;"><i class="search icon"></i><input type="text" id="test3" class="prompt" placeholder="Enter your delivery area..." autocomplete="off"  value=""><div  style="position: absolute; right: 10px; top: 8px; opacity: 0.8; transform: scale(0.8);"></div></div><div class="results transition hidden" style="width: 100%;"><div class="results">
                
</div></div></div></div></div></div><div class="row mtop0"><div class="col-s-16" id="btn3"><button class="ui button fluid green"  data-icon="8" tabindex="-1">Detect Location</button></div></div><div class="row tac"><div class="col-s-16"></div></div></div></div>
</div>
<script type="text/javascript">
$(document).ready(function(){
	 $("#btn3").click(function(){
	        $("#test3").val("<%=session.getAttribute("loc")%>");
	    });
});
</script>
<div class="row">
<div class="col-lg-12  ui segment cart" id="cart" style="margin-top: 3.5%; min-height: 80vh;"><h3>Your Order</h3><div class="cart-summary"><div class="empty-cart mtop3 tac" style="opacity: 0.6;"><div class="ptop2"><img src="https://b.zmtcdn.com/images/online_ordering/empty-cart@1x.png" srcset="https://b.zmtcdn.com/images/online_ordering/empty-cart@2x.png 2x, https://b.zmtcdn.com/images/online_ordering/empty-cart@3x.png 3x" class="mtop2"></div><div class="mtop0 grey-text"><!-- react-text: 1157 -->Your cart is empty.<!-- /react-text --><br><!-- react-text: 1159 -->Add an item to begin.<!-- /react-text --></div></div></div></div>
<!-- <div class="col-lg-12 ui segment" id="cart"> -->
<!-- <h3 align="center">Your Cart</h3> -->
<!-- </div> -->
</div>
</div>
</div>
</div>
</div>




<%@ include file="footer.jsp" %>
</body>
</html>