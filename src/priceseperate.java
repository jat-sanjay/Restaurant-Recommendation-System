import java.sql.DriverManager;
import java.sql.ResultSet;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

public class priceseperate {
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
			ResultSet rs=null;
			try{ 
			connection = (Connection) DriverManager.getConnection(connectionUrl+dbName, userId, password);
			statement=(Statement) connection.createStatement();


			String sql ="Select * from newres";

			resultSet = statement.executeQuery(sql);
	       int x=0;
			while(resultSet.next()){
				 System.out.println(resultSet.getString(7));
			      String splitString = resultSet.getString(7).replaceAll("\\?", "");    
			    
			      String sp=splitString.replaceAll(",","");
			      System.out.println(sp);
			      int fg=Integer.parseInt(sp);
			      int ty;
			      if(fg<=800)
			      {
			    	  ty=1;
			      }
			      else if(fg>800&&fg<=1600)
			      {
			    	  ty=2;
			      }
			      else
			    	  ty=3;
			      String query="UPDATE newres SET price ='"+splitString +"', pcat ='"+ty+"' WHERE id = "+resultSet.getInt(1);
		    		System.out.println(query);
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
