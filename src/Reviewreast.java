import java.sql.DriverManager;
import java.sql.ResultSet;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

public class Reviewreast {
	
	public static void main(String args[])
	{
					
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
	try{ 
	connection = (Connection) DriverManager.getConnection(connectionUrl+dbName, userId, password);
	statement=(Statement) connection.createStatement();


	String sql ="Select * from newres";

	resultSet = statement.executeQuery(sql);
   int x=0;
	while(resultSet.next()){
		
	      String query="insert into reviews values (?,?,?,?,?,?)";
	    
    		PreparedStatement ps=(PreparedStatement) connection.prepareStatement(query);
    		 ps.setString(1,resultSet.getString(3));
    		 ps.setString(2,null);
    		 ps.setString(3,null);
    		 ps.setString(4,null);
    		 ps.setString(5,null);
 			ps.setString(6,resultSet.getString(1));
    		int row=ps.executeUpdate();
    		if(row>0)
    		{
    			System.out.println("Sucess");
    		}
    		else
    		{
    			System.out.println("Not Updated");
    		}
	      x++;
	}
	
	}catch (Exception ee) {
		ee.printStackTrace();
	}
}
}
	
