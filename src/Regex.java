import java.sql.DriverManager;
import java.sql.ResultSet;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

public class Regex {

	public static String cat1,cat2,cat3;
	public static int c=0;
	
	String KMPSearch(String pat, String txt)
    {
		String sub=txt;
        int M = pat.length();
        int N = txt.length();
 
        // create lps[] that will hold the longest
        // prefix suffix values for pattern
        int lps[] = new int[M];
        int j = 0;  // index for pat[]
 
        // Preprocess the pattern (calculate lps[]
        // array)
        computeLPSArray(pat,M,lps);
 
        int i = 0;  // index for txt[]
        while (i < N)
        {
            if (pat.charAt(j) == txt.charAt(i))
            {
                j++;
                i++;
            }
            if (j == M)
            {
               
              //  System.out.println(pat+" "+c);
                if(c==2 && pat!=" ")
                {	cat3=pat;
                	c++;
                }
                if(c==1 && pat!=" ")
                {
                	cat2=pat;
                	c++;
                }
                if(c==0 && pat!=" ")
                {
                	cat1=pat;
                	c++;
                }
                sub=txt.replace(pat,"");
                j = lps[j-1];
                
                return sub;
            }
 
            // mismatch after j matches
            else if (i < N && pat.charAt(j) != txt.charAt(i))
            {
                // Do not match lps[0..lps[j-1]] characters,
                // they will match anyway
                if (j != 0)
                    j = lps[j-1];
                else
                    i = i+1;
            }
        }
        return sub;
        
    }
 
    void computeLPSArray(String pat, int M, int lps[])
    {
        // length of the previous longest prefix suffix
        int len = 0;
        int i = 1;
        lps[0] = 0;  // lps[0] is always 0
 
        // the loop calculates lps[i] for i = 1 to M-1
        while (i < M)
        {
            if (pat.charAt(i) == pat.charAt(len))
            {
                len++;
                lps[i] = len;
                i++;
            }
            else  // (pat[i] != pat[len])
            {
                // This is tricky. Consider the example.
                // AAACAAAA and i = 7. The idea is similar 
                // to search step.
                if (len != 0)
                {
                    len = lps[len-1];
 
                    // Also, note that we do not increment
                    // i here
                }
                else  // if (len == 0)
                {
                    lps[i] = len;
                    i++;
                }
            }
        }
    }
 
	
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


		String sql ="Select * from newres";

		resultSet = statement.executeQuery(sql);
       int x=0;
		while(resultSet.next()){
			 String pat[] = {"North Indian","Fast Food","South Indian","Finger Food","Street Food","Middle Eastern","Cusine Varies","Middle Eastren","Drinks Only","Ice Cream","North Eastren",
		        		"South American","Sri Lankan","Charcoal Grill","Healthy Food","Modern Indian","Raw Meats"
		        		};
		String txt=	resultSet.getString(5);
		for(int i=0;i<pat.length;i++)
		{
	        txt= new Regex().KMPSearch(pat[i],txt);
		}
	
	        String[] splitString = (txt.split(" "));     
	        for (String string : splitString) 
	        {  
	        	if(c==2 &&  string.length()>2)
	        	{
	        		cat3=string;
	        		c++;
	        	}
	        	 if(c==1 &&  string.length()>2)
		        	{
		        		cat2=string;
		        		c++;
		        	}
	        	if(c==0 && string.length()>2)
	        	{
	        		cat1=string;
	        		c++;
	        	}
	           

	    		String query="UPDATE newres SET cat1 = '"+cat1+"',cat2= '"+cat2+"',cat3= '"+cat3+"' WHERE id = +"+resultSet.getInt(1);
	    		
	    		PreparedStatement ps=(PreparedStatement) connection.prepareStatement(query);
	           //System.out.println(string);  
	    		int row=ps.executeUpdate();
	    		if(row>0)
	    		{
	    			System.out.println("Sucess");
	    		}
	    		else
	    		{
	    			//System.out.println("Not Updated");
	    		}
	        }
	        x++;
			System.out.println(cat1+" "+cat2+" "+cat3);
			cat1=null;
			cat2=null;
			cat3=null;
			c=0;
		}
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	   } 

}
