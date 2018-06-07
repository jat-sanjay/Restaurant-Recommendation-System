<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import = "java.sql.*" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
int i=2;
String[] item1= new String[30];
String[] price1=new String[30];
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "minor2";
String userId = "root";
String password = "";
String item=request.getParameter("item");
String newitem=item.replace(" ","");
//out.println(newitem);
String cat=request.getParameter("cat");
Connection connection = null;
try {
	Class.forName(driverName);
	connection = (Connection) DriverManager.getConnection(connectionUrl+dbName, userId, password);
	} catch (ClassNotFoundException ee) {
	ee.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

try{ 
	String sql="select * from "+cat+" where id='"+(String)session.getAttribute("id")+"'";
   //out.println(sql);
PreparedStatement ps=(PreparedStatement) connection.prepareStatement(sql);  
//ps.setString(1, id);
ResultSet rs=ps.executeQuery();
while(rs.next())
{
	for(i=2;i<=31;i++)
	{
	/*out.println(rs.getString(i));
	out.println(rs.getString(i+30));*/
	item1[i-2]=rs.getString(i);
	price1[i-2]=rs.getString(i+30);
	}
}

}catch(SQLException e)
{
	e.printStackTrace();
}

try{ 
	String sql="delete from "+cat+" where id='"+(String)session.getAttribute("id")+"'";
//out.println(sql);
PreparedStatement ps=(PreparedStatement) connection.prepareStatement(sql);  
//ps.setString(1, id);
int row=ps.executeUpdate();
if(row>0)
{
	out.println("Delete Sucess");
	//response.sendRedirect("http://localhost:8080/Minor2.0/adminlogin.jsp");
}
else
{
	
}
}catch(SQLException e)
{
	e.printStackTrace();
}
   try{
	   String sql="insert into "+cat+" values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		 
		 PreparedStatement ps=(PreparedStatement) connection.prepareStatement(sql);  
			ps.setString(1,(String)session.getAttribute("id"));
			for(int ii=2;ii<=31;ii++)
			{
				//out.println(arr1[i-2]);
				//ar3[i]=request.getParameter("price3"+i);
				String pp=item1[ii-2];
				String newpp=pp.replace(" ","");
				if(!newitem.equals(newpp))
				{
					ps.setString(ii, item1[ii-2]);
					ps.setString(ii+30, price1[ii-2]);
				}
				else
				{
					ps.setString(ii,"");
					ps.setString(ii+30,"");
					
				}
				
				
			}
					int row=ps.executeUpdate();
					if(row>0)
					{
						out.println("Update Sucess");
						//response.sendRedirect("http://localhost:8080/Minor2.0/adminviewall.jsp");
					}
					else
					{
						
					}
		 
   }
   catch (Exception e) {
	 	e.printStackTrace();
	 	}

%>
</body>
</html>