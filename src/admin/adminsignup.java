package admin;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class adminsignup
 */
@WebServlet("/adminsignup")
public class adminsignup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminsignup() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String name=request.getParameter("name");
		String id=request.getParameter("id");
		String email=request.getParameter("email");
		String pass=request.getParameter("pass");
		String repass=request.getParameter("repassword");
		if(repass.equals(pass))
		{
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
		PreparedStatement ps=(PreparedStatement) connection.prepareStatement("insert into admin values(?,?,?,?)");  
				ps.setString(1,name);  
				ps.setString(2,id);  
				ps.setString(3,email);
				ps.setString(4,pass);
				int row=ps.executeUpdate();
				if(row>0)
				{
					response.sendRedirect("http://localhost:8080/Minor2.0/adminlogin.jsp");
				}
				else
				{
					
				}
			}catch(SQLException e)
			{
				e.printStackTrace();
			}
		}
		else
		{
			response.sendRedirect("http://localhost:8080/Minor2.0/adminsignup.jsp");
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
