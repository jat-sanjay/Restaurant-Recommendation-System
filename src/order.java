

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class confrimorder
 */
@WebServlet("/order")
public class order extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public order() {
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
		String email=request.getParameter("email");
		String addr=request.getParameter("address");
		String  mob=request.getParameter("contact");
		String cname=request.getParameter("cname");
		String pay=request.getParameter("payment_method");
		String total=request.getParameter("total");
		PrintWriter out=response.getWriter();
		String driverName = "com.mysql.jdbc.Driver";
		String connectionUrl = "jdbc:mysql://localhost:3306/";
		String dbName = "minor2";
		String userId = "root";
		String password = "";
		//out.println("sucess");
		try {
		Class.forName(driverName);
		} catch (ClassNotFoundException ee) {
		ee.printStackTrace();
		}

		Connection connection = null;
		
		try{ 
		connection = (Connection) DriverManager.getConnection(connectionUrl+dbName, userId, password);
	PreparedStatement ps=(PreparedStatement) connection.prepareStatement("insert into orders values(?,?,?,?,?,?,?,?,?)");  
	Random rand = new Random(); 
	String ran=""+rand.nextInt();
	String ran1=ran.replace("-", "");
			ps.setString(1,ran1);  
			ps.setString(2,name);  
			ps.setString(3,cname);
			ps.setString(4,total);
			ps.setString(5,pay);  
			ps.setString(6,addr);  
			ps.setString(7,email);
			ps.setString(8,mob);
			DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy/MM/dd");
			LocalDate localdate=LocalDate.now();
			ps.setString(9,""+dtf.format(localdate));
			int row=ps.executeUpdate();
			if(row>0)
			{
				 out.println("<script type=\"text/javascript\">");
				   out.println("alert('Your Ordre Is Placed Sucessfully ');");
				   out.println("location='index.jsp';");
				   out.println("</script>");
			}
			else
			{
				
			}
		}catch(SQLException e)
		{
			e.printStackTrace();
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
