<link href="https://static.zmtcdn.com/gencss/t-22ad81b76bbc7f79e3d68512c6d4bf4e/l-H4sIAAAAAAAAA8vPy8nMS43PL0pJLcrMS49PLCjQy0ktLgYAMQSvpBgAAAA/h-047a1144fd3d9ed03609c54df1802b21" rel="stylesheet">
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*"%>
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
<link href="https://static.zmtcdn.com/gencss/t-22ad81b76bbc7f79e3d68512c6d4bf4e/l-H4sIAAAAAAAAA8vPy8nMS43PL0pJLcrMS49PLCjQy0ktLgYAMQSvpBgAAAA/h-047a1144fd3d9ed03609c54df1802b21" rel="stylesheet">
<html>
<body class="container-fluid">
<%
String name = request.getParameter("getresult");
String price = request.getParameter("offer");
String quantity=request.getParameter("quantity");

ArrayList<String> pname=(ArrayList<String>)session.getAttribute("pname");
ArrayList<String> pprice=(ArrayList<String>)session.getAttribute("pprice");
ArrayList<String> pquan=(ArrayList<String>)session.getAttribute("pquan");
 int i=0,c=0;
  for(i=0;i<pname.size();i++)
  {
  	if(pname.get(i).equals(name))
  	{
  		c=1;
  		pquan.set(i, quantity);
  		break;
  	}
  }
   if(c==0)
   {
  	pname.add(name);
  	pprice.add(price);
  	pquan.add(quantity);
   }
   session.setAttribute("pname", pname);
   session.setAttribute("pprice", pprice);
   session.setAttribute("pquan", pquan);
   %>
   <h2 align="center">Your Cart</h2>
   <%
   int sum=0;
  for(int j=0;j<pname.size();j++)
  {
	  sum+=Integer.parseInt(pprice.get(j))*Integer.parseInt(pquan.get(j));
%>
<div class="row" style="border-bottom: 1px thin;">	
<p class="col-lg-6"><%=pname.get(j) %></p>
<p class="col-lg-2"><span>&#8377</span><%=pprice.get(j) %></p>
<p class="col-lg-2"><%=pquan.get(j) %></p>
<p class="col-lg-2"><span>&#8377</span><%=Integer.parseInt(pprice.get(j))*Integer.parseInt(pquan.get(j)) %></p>
 </div>
 <%
 } 
 %> 
 <br>
<span class="row">
<p class="col-lg-6" style="font-size: 20px" align="center"><strong>Total</strong></p>
<p class="col-lg-6" style="font-size: 20px" align="right"><strong><span>&#8377</span><%=sum %></strong></p>
<form action="confrimorder.jsp">
<button class="ui large green fluid button checkout" type="submit">Continue</button>
</form>
</body>
</html>