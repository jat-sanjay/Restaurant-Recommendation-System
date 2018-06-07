import java.sql.DriverManager;
import java.sql.ResultSet;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

public class phonenumber {
	 public static void main(String args[]){ 
	     
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
			ResultSet rs=null;
			try{ 
			connection = (Connection) DriverManager.getConnection(connectionUrl+dbName, userId, password);
			statement=(Statement) connection.createStatement();


			String sql ="Select * from newres2";

			resultSet = statement.executeQuery(sql);
	       int x=0;
			while(resultSet.next()){
				
			      String query="UPDATE newres SET phone ='"+resultSet.getString(8) +"' WHERE id = +"+resultSet.getInt(1);
		    		
		    		PreparedStatement ps=(PreparedStatement) connection.prepareStatement(query);
		            
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
			
			}catch (Exception e) {
				e.printStackTrace();
			}
			

	     
	        
	   } 
}
