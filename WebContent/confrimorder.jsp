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
  try {
  Class.forName(driverName);
  } catch (ClassNotFoundException e) {
  e.printStackTrace();
  }

  Connection connection = null;
  Statement statement = null;
  ResultSet resultSet = null;
  ArrayList<String> pname=(ArrayList<String>)session.getAttribute("pname");
  ArrayList<String> pprice=(ArrayList<String>)session.getAttribute("pprice");
  ArrayList<String> pquan=(ArrayList<String>)session.getAttribute("pquan");
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
</head>
<body>
<br>
<div class="row">
  <div class="col-lg-8"></div>
  <div class="col-lg-2" align="right"></div>
  <div class="col-lg-2 form-group" id="pro"  align="center">
 <div class="header-link">
    <div class="ui button header-icon-button cursor-pointer clearfix top right pointing dropdown mr0 visible"  tabindex="0">

        <div class="ui left inline header-icon-menu header-icon-profile mr5">
            <img class="ui avatar image mr0 mini" data-original="https://b.zmtcdn.com/data/user_profile_pictures/6bd/99a1ed74e933b806ef05c7fe7c14c6bd.jpg?fit=around%7C100%3A100&amp;crop=100%3A100%3B%2A%2C%2A" src="<%=session.getAttribute("uimg") %>" alt="Rahul" style="display: inline-block;">
        </div>
        <div class="vertical menu transition" id="profile" style="width: 200px; right: 0px; left: initial; margin: 8px 0px 0px; display:none" tabindex="-1">

            <a href="https://www.zomato.com/users/rahul-singh-37695472" class="item">
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
<div class="col-lg-2"></div>
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



<div class="col-lg-2">
  </div>
</div>

<div class="row">
<div class="col-lg-2"></div>
<div class="col-lg-8 ui segment" style="padding:2%;">
<h2 style="font-size:32px;">Delivery Address :</h2>
<form method="get" action="order" >
<div class="form-group">
<label>Name :</label>
<input type="text" class="form-control" name="name" value="<%=session.getAttribute("uname")%>">
</div>
<div class="form-group">
<label>Address :</label>
<input type="text" class="form-control" name="address" value="<%=session.getAttribute("loc")%>">
</div>

<div class="form-group">
<label>Email :</label>
<input type="email" class="form-control" name="email" value="<%=session.getAttribute("uemail")%>">
</div>

<div class="form-group">
<label>Contact No :</label>
<input type="text" class="form-control" name="contact" value="">
</div>

<br>
<h2 style="font-size:32px;">ORDER SUMMARY:<span><%=pname.size() %>items</span></h2>
<table class="table-bordered  table" style="font-style:normal;font-size:14px;">
<tr class="active" ><th style="text-align:center;">ITEM Name</th><th style="text-align:center">Qunatity</th><th style="text-align:center">PRICE</th><th  style="text-align: center">DELIVERY DETAILS</th><th style="text-align: center">SUBTOTAL</th></tr>
         <%
         String cname="";
         int sum=0;
         for(int j=0;j<pname.size();j++)
         {
       	  sum+=Integer.parseInt(pprice.get(j))*Integer.parseInt(pquan.get(j));
         %>
           <tr><td> <span><%=pname.get(j) %><br><br><br><br></span> </td><td><%=pquan.get(j) %></td><td><span>&#8377</span><%=pprice.get(j) %></td><td>FREE<br>Delivered in 45 Min</td><td><strong style="font-weight:600"><span>&#8377</span><%=Integer.parseInt(pprice.get(j))*Integer.parseInt(pquan.get(j)) %></strong></td></tr>
           <%
              cname+=pname.get(j)+"-"+pquan.get(j)+"*"+pprice.get(j)+"@"+Integer.parseInt(pprice.get(j))*Integer.parseInt(pquan.get(j))+",";
           %>
    <%} %>
          
<tr style="font-size:25px;text-align:right"><td colspan="6" class="active">Amount Payable:<span style="font-size:35px;"><span>&#8377</span><%=sum %></span></td>
</table>
<h2 style="font-size:32px;">Payment Method :</h2>
<div class="radio" style="padding:1%;margin-left:14px;">
<div class="ui radio checkbox block-label"><input type="radio" id="cod" name="payment_method" class="select-method" value="cod"><label for="cod" style="cursor: pointer;">COD</label></div>
<div class="ui radio checkbox block-label"><input type="radio" id="netbanking" name="payment_method" class="select-method" value="netbanking"><label for="netbanking" style="cursor: pointer;">Netbanking</label></div>
<div class="ui radio checkbox block-label"><input type="radio" id="creditcard" name="payment_method" class="select-method" value="creditcard"><label for="creditcard" style="cursor: pointer;">Credit Card</label></div>
<div class="ui radio checkbox block-label"><input type="radio" id="giftcard" name="payment_method" class="select-method" value="giftcard"><label for="giftcard" style="cursor: pointer;">Gift Card</label></div>
</div>
<input type="text" style="display: none;" value="<%=cname %>" name="cname">
<input type="text" style="display: none;" value="<%=sum %>" name="total">
<button type="submit" id="placeorder" name="confrim" style="margin-top:1%;" class="ui large green fluid button checkout">CONFRIM ORDER</button>
</form>
</div>
<div class="col-lg-2"></div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>