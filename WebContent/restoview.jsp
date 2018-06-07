<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
  String driverName = "com.mysql.jdbc.Driver";
  String connectionUrl = "jdbc:mysql://localhost:3306/";
  String dbName = "minor2";
  String userId = "root";
  String password = "";
  String nam=request.getParameter("search");
  String resadd="";

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
<link href="https://static.zmtcdn.com/gencss/t-fce05e705b469d889fdc20033ca4cdb8/l-H4sIAAAAAAAAA0tKLE7Vz0nVTS_KTNFLLi7WqcrPTUosKYawi0sSSzKTwezi1NzEPCBHH8YAiQIAP2LJTT4AAAA/h-55dff993a95038db84353d845e279c05" rel="stylesheet">


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
<form class="col-lg-6" name="myform" action="restoview.jsp" method="GET">
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
    <button class="btn w3-card-2 w3-green" id="location" type="submit" style="padding: 5px 30px 38px 30px;margin-top:-11% ;font-size: 18px;">Search</button>
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
	 <div class="col-lg-6  ui segment">
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
	 <img src="<%=resultSet.getString(2)%>" width="100%" height="40%" style="box-sizing: content-box;">
	 </div>
	 
	 </div>
	 </div>
	 <br>
	 <div class="container-fluid">
	 <div class="row">
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
	 <div class="container-fluid">
	 <div class="row">
	 <div class="col-lg-12">
	 <div class="col-lg-5">
	 <p style="font-family: 'Muli', sans-serif;"><%=resultSet.getString(11) %><span style="font-size:40px;">.</span>Quick Bites</p>
	 </div>
	 <div class="col-lg-7"></div>
	 </div>
	 </div>
	 </div>
	 <br>
	 
	 <div class="container-fluid">
	 <div class="row">
	 <div class="col-lg-12">
	 <div class="col-lg-5">
	 <h3 style="font-family: 'Muli', sans-serif;"><b>Overview</b></h3>
	 </div>
	 <div class="col-lg-7" align="right">
	 <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Menu</button>
	 </div>
	 </div>
	 </div>
	 </div>
	 <br>
	 </div>
<div class="col-lg-3">
</div>
</div>
</div>
<br>
<div class="container-fluid">
	 <div class="row">
	 <div class="col-lg-3"></div>
	<div class="ui segments col-lg-6" style="margin-top: 0px;padding: 0px">
            <div class="row ui segment">
                <div class="col-l-1by3    pl0 pr20">
                    <div class="mbot">
                        <div id="resinfo-phone" title="Marshmallow Cakes &amp; More, Pitampura phone number" class="res-main-phone p-relative phone-details clearfix">
                <div class="phone" id="phoneNoString">
                        <h2 class="mb5" tabindex="0" role="heading" aria-label="Phone number">Phone number</h2>
            <span class="tel left res-tel">
                <span class="fontsize2 bold zgreen"><span tabindex="0" aria-label="011 49872829" class="tel"><%=resultSet.getString(13) %></span></span><br>            </span>

                    </div>
            
    </div>

                    </div>
                    <div class="mbot">
                            <div class="res-info-group clearfix">
        <h2 tabindex="0" class="mt0 mb5">Cuisines</h2>
        <div class="res-info-cuisines clearfix"><a class="zred" title="View all Bakery Restaurants in Delhi NCR" href="#"><%=resultSet.getString(5) %></a></div>    </div>
                        </div>

                    <div class="mbot mtop">
                                    <div class="res-info-group clearfix">
                <div class="res-info-detail">
                    <span class="hdn">Marshmallow Cakes &amp; More, Pitampura </span>
                    <div tabindex="0">
                        <h2 class="left mt0 mb5">Cost&nbsp;</h2>
                                                    <div tabindex="0" aria-label="The cost for two is computed as follows: one appetizer/entree + two main course dishes + two non-alcoholic drinks + and one dessert. The actual cost you incur at a restaurant might change depending on your appetite, or with changes in restaurant menu prices. This assumes no use of the bar facility, except for places in the &quot;Go out for drinks&quot; section." class="tooltip-w left"><span class="res-info-detail-icon" data-icon="|"></span></div>
                                                <div class="clear"></div>
                    </div>

                                            <span tabindex="0" aria-label="Average ₹300 for two people (approx.)"><div class="ttupper fontsize5 grey-text">Average</div><span>&#8377</span> <%=resultSet.getString(7) %> for two people (approx.)</span>
                    

                                            <div class="mt5">
                            
                                                                <div tabindex="0" class="res-info-cft-text fontsize5 grey-text ">
                                        <span class="res-info-payment res-info-icon"></span>
                                        <span itemprop="paymentAccepted">Cash</span> and <span itemprop="paymentAccepted" title="Cards accepted at Marshmallow Cakes &amp; More">Cards accepted</span>                                    </div>
                                                    </div>
                    
                                        
                    

                    

                    

                                    </div>

            </div>
                                </div>

                </div>
                <div class="col-l-1by3   pl20 pr20">  
                        <div class="mbot">
                                         <div class="res-info-group clearfix">
                <div class="res-info-detail">
                        <div tabindex="0" class="s-title hdn">
                            <div class="left mr10">Opening hours</div>
                                                            <span class="res-timings-toggle is-closed" id="res-timings-toggle">(See more +)</span>
                                                        <div class="clear"></div>
                        </div>
                        <div class="res-info-timings">
                            <div class="clearfix" tabindex="0"><h2 class="mt0 mb5 inlineblock">Opening hours</h2><div class="medium">Today&nbsp;&nbsp;11 AM to 10 PM</div><div><div class="left zred expand cursor-pointer user-select-none fontsize5">See more</div><div class="res-week-timetable ui popup bottom left transition hidden" id="res-week-timetable"><table style="border:0"><tbody><tr class=""><td class="pr10">Mon</td><td class="pl10">11 AM to 10 PM</td></tr><tr class=""><td class="pr10">Tue</td><td class="pl10">11 AM to 10 PM</td></tr><tr class=""><td class="pr10">Wed</td><td class="pl10">11 AM to 10 PM</td></tr><tr class=""><td class="pr10">Thu</td><td class="pl10">11 AM to 10 PM</td></tr><tr class=""><td class="pr10">Fri</td><td class="pl10">11 AM to 10 PM</td></tr><tr class=""><td class="pr10">Sat</td><td class="pl10">11 AM to 10 PM</td></tr><tr class="bold"><td class="pr10">Sun</td><td class="pl10">11 AM to 10 PM</td></tr></tbody></table></div></div></div>                        </div>
                                                                </div>
            </div>          
              
                        </div>
                                                    <div class="mb5">
                                <h2 tabindex="0" aria-label="Address">
                                    Address                                </h2>
                            </div>
                            <div class="mbot0">
                                
    <div class="borderless res-main-address">
        <div class="resinfo-icon">
            <span><%=resultSet.getString(4) %></span>        </div>
    </div>
                                </div>
                                                <div class="mbot0">
                                    <div class="resbox__main--row">
                                        <div class="resmap pos-relative mt5 mb5">
                                       <div id="res-map-canvas">
                        <div class="resmap-text-container">
                            Get Directions                         </div>
                       	<iframe src="//www.google.com/maps/embed/v1/directions?origin=<%=session.getAttribute("loc") %>
                       	<%
                       	String arr[]=resultSet.getString(4).split(",");
                		String sp="";
                		int c=3;
                		int f=arr.length-c;
                		for(int i=f;i<arr.length&&c>0;i++)
                		{
                			if(i!=f)
                			sp+=","+arr[i];
                			else
                				sp+=arr[i];
                		}
                       	%>
      &destination=<%=resultSet.getString(3)+" " %><%=sp %>
      &key=AIzaSyBYlEsyWdSujlOK5U9RZsxQIhJQxhL5OVM">
  </iframe>
                                           </div>
                   
                </div>
                        </div>
                            </div>
                </div>
                <div class="col-l-1by3  pl20 pr20">
                                        <div class="pbot0 res-info-group ">    <div class="res-info-highlights">
        <h2 class="mbot0 " tabindex="0">Highlights</h2>
                <div tabindex="0" aria-labelledby="labelledby_delivery" class="clearfix mb5">
        
                <i class="ui icon green small checkmark  left  icon_delivery" title="Home Delivery"></i><div class="res-info-feature-text" id="labelledby_delivery">Home Delivery</div>
        
        
        
        
        
        
        
        
            </div>
    
        <div tabindex="0" aria-labelledby="labelledby_noseating" class="clearfix mb5">
        
        
        
        
        
        
                <i class="ui icon small red left remove icon_no_seating" title="Seating Not Available"></i><div class="res-info-feature-text" id="labelledby_noseating">Seating Not Available</div>
        
        
        
            </div>
    

            <div tabindex="0" aria-label="Desserts and Bakes" class="res-info-feature clearfix mb5"><i class="ui icon green small checkmark left "></i><div class="res-info-feature-text">Desserts and Bakes</div></div><div tabindex="0" aria-label="Self Service" class="res-info-feature clearfix mb5"><i class="ui icon green small checkmark left "></i><div class="res-info-feature-text">Self Service</div></div>
                </div>
</div>                
                        
                                                
                        <div class="res-header-claims mbot0 ptop0 ">
                                                            <div class="hom">
                                    <a tabindex="0" id="resinfo-error" class="fontsize5 tooltip_formatted cursor-pointer grey-text">
                                        Report Error                                    </a>
                                </div>
                            
                                                                                                                                <span class="fontsize5 tooltip_formatted claim-listing-info">
                                        <i class="mini checkmark icon grey mr0"></i>
                                        Claimed listing&nbsp;
                                    </span>
                                    <a tabindex="0" href="#" class="tooltip_formatted fontsize5 grey-text">
                                    </a>
                                                                                    </div>
                                    </div>
            </div>
                    </div>
	 
	 <%

	 resadd=resultSet.getString(4);
	 }
	 
	 }catch (Exception e) {
	 	e.printStackTrace();
	 	}


%>

<div class="col-lg-3">
</div>
</div>
</div>

<br>
<div class="conatiner-fluid">
<div class="row">
<div class="col-lg-3"></div>
<div class="col-lg-6 ui segment">
 
<div class="form-group">
<br><br>
  <label for="comment">Write a Review:</label>
 
  <textarea class="form-control" rows="5" id="comment" name="comment" value="" placeholder="Help other foodies by sharing your review"></textarea>
</div>
<div align="right">
<button class="btn btn-success" type="Submit" id="load">Submit</button>
</div>
<div id="review" style="margin-bottom: 6%">
</div>
<div class="col-lg-3"></div>
</div>
</div>
</div>
<script>
loadmore();
$(document).on("click","#load",function(){
	  loadmore();
	});
function loadmore()
{
	var x = document.getElementById("comment").value;
	document.getElementById("comment").value="";
	  $.ajax({
		  type: 'POST',
		  url: 'comment.jsp',
		  data: {
		   getresult:"<%=ID%>", comment : x
		  },
		  success: function (response) {
		   var content = document.getElementById("review");
		   content.innerHTML = response;
	
		  }
		  });
}
</script>

<br><br>
<%@ include file="footer.jsp" %>


<%
connection = null;
statement = null;
resultSet = null;

try{ 
	 connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
	 statement=connection.createStatement();
	 String sql ="SELECT * FROM menu where name='"+nam+"'"+"AND address='"+resadd+"'";
	 resultSet = statement.executeQuery(sql);
	 while(resultSet.next())
	 {
%>
<div class="container-fluid">
	<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"><%=resultSet.getString(2)%></h4>
      </div>
      
      <div class="modal-body">
       <img src="<%=resultSet.getString(5)%>" alt="Sorry Menu Is Not Available">
      </div>
      <div class="modal-footer">
      </div>
    </div>

  </div>
</div>
</div>
<%
	 }
}catch(SQLException e)
{
	   e.printStackTrace();
}


%>

</body>
</html>