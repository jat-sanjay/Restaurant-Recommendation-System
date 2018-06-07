package admin;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class adminlogin
 */
@WebServlet("/adminlogin")
public class adminlogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminlogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		Boolean status=false;
		String email=request.getParameter("email");
		String pass=request.getParameter("pass");
		String driverName = "com.mysql.jdbc.Driver";
		String connectionUrl = "jdbc:mysql://localhost:3306/";
		String dbName = "minor2";
		String userId = "root";
		String password = "";

		try {
		Class.forName(driverName);
		} catch (ClassNotFoundException ee) {
		ee.printStackTrace();
		}

		Connection connection = null;
		
		try{ 
		connection = (Connection) DriverManager.getConnection(connectionUrl+dbName, userId, password);
	PreparedStatement ps=(PreparedStatement) connection.prepareStatement("select * from admin where email=? and pass=?");  
			ps.setString(1,email);  
			ps.setString(2,pass);  
			      
			ResultSet rs=ps.executeQuery();  
			if(rs.next())
			{
				response.sendRedirect("http://localhost:8080/Minor2.0/adminupdate.jsp?name="+rs.getString("name")+"&id="+rs.getString("id"));
			}
			else
			{
				
			}
			          
			}catch(Exception e){System.out.println(e);} 
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
