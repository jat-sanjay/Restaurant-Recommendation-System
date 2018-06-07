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

             <a href="http://localhost:8080/Minor2.0/showorder.jsp" class="item">
                Orders
            </a>

                        <div class="ui divider mt0 mb0"></div>
            <a id="logout" href="https://www.zomato.com/logout?noReturnOnLogout=FALSE&amp;ctoken=bfd2afe426f5d3c751112467f7867df5" class="item">Log out</a>
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
<form class="col-lg-8" name="myform" action="restoview.jsp" method="GET">
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
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "minor2";
String userId = "root";
String password = "";
 Connection connection1 = null;
 Statement statement1 = null;
 ResultSet resultSet = null;
 try{ 
	 connection1 = DriverManager.getConnection(connectionUrl+dbName, userId, password);
	 statement1=connection1.createStatement();
	 String sql1 ="SELECT * FROM newres where city='"+session.getAttribute("city")+"'";

	 resultSet = statement1.executeQuery(sql1);
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



<div class="col-lg-1">
  </div>
</div>

<br>

<%


			try {
			Class.forName(driverName);
			} catch (ClassNotFoundException ee) {
			ee.printStackTrace();
			}

			Connection connection = null;
			
			try{ 
			connection = (Connection) DriverManager.getConnection(connectionUrl+dbName, userId, password);
		PreparedStatement ps=(PreparedStatement) connection.prepareStatement("select * from orders where uname='"+session.getAttribute("uname")+"'");  
				ResultSet rs=ps.executeQuery();
	%>
	<div class="row" style="margin-top:1%;">
<div class="col-lg-1">
</div>

<div class="col-lg-10  ui segment">
<h2 style="font-size:28px">PREVIOUS ORDERS :</h2>  
	<%
				while(rs.next())
				{
					String arr[]=rs.getString(3).split(",");
					
					%>
  
     <table class="table table-bordered  ui segment">
     <tr style="background-color:#eea236;;color:#fff;"><td colspan="8"><h2 style="margin-top:2%;font-size:20px;font-weight:800;text-align:left;padding-bottom:7px;margin-top:1px;">ORDER ID : <%=rs.getString(1) %></h2></td></tr>
<tr class="active" ><th style="text-align:center;">ITEM Name</th><th style="text-align:center">Qunatity</th><th style="text-align:center">PRICE</th><th  style="text-align: center">ORDER DATE</th><th style="text-align:center;">PAYMENT METHOD</th><th style="text-align: center">SUBTOTAL</th></tr>
    <%
    for(int i=0;i<arr.length;i++)
	{
    	String a=arr[i].replace(" ", "_");
		String b=a.replace("-"," ");
		String c=b.replace("*"," ");
		String d=c.replace("@"," ");
		String a1[]=d.split(" ");
		
	
    %>
    				 <tr><td> <span><%=a1[0] %><br><br></span> </td><td><%=a1[1] %></td><td><span>&#8377</span><%=a1[2] %></td><td><%=rs.getString(9) %></td><td><%=rs.getString(5) %></td><td><strong style="font-weight:600"><span>&#8377</span><%=a1[3] %></strong></td></tr>
                 
        <%
	}
        %>         
	  <tr style="font-size:25px;text-align:right"><td colspan="8" class="active">Amount Pay:<span style="font-size:35px;"><span>&#8377</span><%=rs.getString(4) %></span></td></tr>
 </table>
			
					<%
				}
				
			}catch(SQLException e)
			{
				e.printStackTrace();
			}
			%>
			</div>
</div>
	<div class="col-lg-1">
</div>
</div>	
			<br>
			<%@ include file="footer.jsp" %>
</body>
</html>