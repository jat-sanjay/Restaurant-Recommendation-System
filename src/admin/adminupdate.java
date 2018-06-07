package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class adminupdate
 */
@WebServlet("/adminupdate")
public class adminupdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminupdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String driverName = "com.mysql.jdbc.Driver";
		String connectionUrl = "jdbc:mysql://localhost:3306/";
		String dbName = "minor2";
		String userId = "root";
		String password = "";
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

			
			
			
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out=new PrintWriter(response.getWriter());
		String arr1 []=new String [30];String ar1 []=new String [30];
		String arr2 []=new String [30];String ar2 []=new String [30];
		String arr3 []=new String [30];String ar3 []=new String [30];
		String id=request.getParameter("onlyid");
		out.println(id);
		if(!request.getParameter("cat1").equals("null"))
		{
		for(int i=2;i<=31;i++)
		{
			arr1[i-2]=request.getParameter("item1"+i);
			ar1[i-2]=request.getParameter("price1"+i);
		}
		}
		if(!request.getParameter("cat2").equals("null"))
		{
		for(int i=2;i<=31;i++)
		{
			arr2[i-2]=request.getParameter("item2"+i);
			ar2[i-2]=request.getParameter("price2"+i);
		}
		}
		if(!request.getParameter("cat3").equals("null"))
		for(int i=2;i<=31;i++)
		{
			arr3[i-2]=request.getParameter("item3"+i);
			ar3[i-2]=request.getParameter("price3"+i);
		}
		if(!request.getParameter("cat1").equals("null"))
		{
			String cat1=(String)request.getParameter("cat1");
			try{ 
				String sql="delete from "+cat1+" where id='"+id+"'";
		out.println(sql);
			PreparedStatement ps=(PreparedStatement) connection.prepareStatement(sql);  
			//ps.setString(1, id);
			int row=ps.executeUpdate();
			if(row>0)
			{
				//out.println("Delete Sucess");
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
			String sql="insert into "+cat1+" values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps=(PreparedStatement) connection.prepareStatement(sql);  
			ps.setString(1, id);
			for(int i=2;i<=31;i++)
			{
				//out.println(arr1[i-2]);
				//ar3[i]=request.getParameter("price3"+i);
				ps.setString(i, arr1[i-2]);
				ps.setString(i+30, ar1[i-2]);
				
			}
					int row=ps.executeUpdate();
					if(row>0)
					{
						//out.println("Update Sucess");
						response.sendRedirect("http://localhost:8080/Minor2.0/adminviewall.jsp");
					}
					else
					{
						
					}
				}catch(SQLException e)
				{
					e.printStackTrace();
				}
		
		}
		if(!request.getParameter("cat2").equals("null"))
		{
			String cat2=(String)request.getParameter("cat2");
			try{ 
				String sql="delete from "+cat2+" where id='"+id+"'";
		out.println(sql);
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
			String sql="insert into "+cat2+" values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps=(PreparedStatement) connection.prepareStatement(sql);  
			ps.setString(1, id);
			for(int i=2;i<=31;i++)
			{
				//out.println(arr1[i-2]);
				//ar3[i]=request.getParameter("price3"+i);
				ps.setString(i, arr2[i-2]);
				ps.setString(i+30, ar2[i-2]);
				
			}
					int row=ps.executeUpdate();
					if(row>0)
					{
						out.println("Update Sucess");
						//response.sendRedirect("http://localhost:8080/Minor2.0/adminlogin.jsp");
					}
					else
					{
						
					}
				}catch(SQLException e)
				{
					e.printStackTrace();
				}
		}
		if(!request.getParameter("cat3").equals("null"))
		{
			String cat3=(String)request.getParameter("cat3");
			try{ 
				String sql="delete from "+cat3+" where id='"+id+"'";
		out.println(sql);
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
			String sql="insert into "+cat3+" values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps=(PreparedStatement) connection.prepareStatement(sql);  
			ps.setString(1, id);
			for(int i=2;i<=31;i++)
			{
				//out.println(arr1[i-2]);
				//ar3[i]=request.getParameter("price3"+i);
				ps.setString(i, arr3[i-2]);
				ps.setString(i+30, ar3[i-2]);
				
			}
					int row=ps.executeUpdate();
					if(row>0)
					{
						out.println("Update Sucess");
						//response.sendRedirect("http://localhost:8080/Minor2.0/adminlogin.jsp");
					}
					else
					{
						
					}
				}catch(SQLException e)
				{
					e.printStackTrace();
				}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
