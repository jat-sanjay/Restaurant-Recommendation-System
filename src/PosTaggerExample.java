import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map.Entry;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import java.lang.*;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import opennlp.tools.cmdline.PerformanceMonitor;
import opennlp.tools.postag.POSModel; 
import opennlp.tools.postag.POSSample; 
import opennlp.tools.postag.POSTaggerME; 
import opennlp.tools.tokenize.WhitespaceTokenizer;  

public class PosTaggerExample { 
  
	 public static void main(String args[]) throws Exception{ 
		 HashMap<String,Double> hm=new HashMap<String,Double>();
		 String[] sentence=new String [1000];
		 
			try {
				
				File file = new File("C:/Users/Rahul/Downloads/minor.txt");
				FileReader fileReader = new FileReader(file);
				BufferedReader bufferedReader = new BufferedReader(fileReader);
				StringBuffer stringBuffer = new StringBuffer();
				String line;
				String str;
				int i=0;
			  
				while ((line = bufferedReader.readLine()) !=null) {
					
					try{
				    str =  line.toString();
				    String[] string=str.split(" ");
				    
				//   System.out.println(string[0]+" "+string[1]+" "+string[2]);
				   
				 double total = Double.parseDouble(string[0]);
				   total-=Double.parseDouble(string[1]);
				 
				   // String total1=total+"";
				  
				    Double value=hm.get(string[2]);
				    if(value!=null)
				    {
				    	if(Math.abs(value)<Math.abs(total))
				    	{
				    		value=total;
				    	}
				    	hm.put(string[2],value);
				    }
				    else
				    hm.put(string[2],total);
				   //System.out.println(total1);
				 // i++;*/
					}
					catch(Exception ex)
					{
						
				    }
				    }
				fileReader.close();
//			for(Entry<String, Double> m:hm.entrySet()){
//					   System.out.println(m.getKey()+" "+m.getValue());
//			}
//					  
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		 
		 
		 
		 
		 
	      //Loading Parts of speech-maxent model       
	      InputStream inputStream = new 
	         FileInputStream("C:/Users/Rahul/Downloads/opennlp/en-pos-maxent.bin"); 
	      POSModel model = new POSModel(inputStream); 
	       
	      //Creating an object of WhitespaceTokenizer class  
	      WhitespaceTokenizer whitespaceTokenizer= WhitespaceTokenizer.INSTANCE; 
	      
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


			String sql ="Select * from reviews";
		

			resultSet = statement.executeQuery(sql);
			
			///System.out.println("sanjay");
			while(resultSet.next())
			{
				if(resultSet.getString(2)!=null)
				{
				
				for(int kk=0;kk<sentence.length;kk++)
					sentence[kk]="";
				sentence=resultSet.getString(2).split("@");
			
	      
	      
	      //Tokenizing the sentence 
	           
			int pos=0,neg=0,neu=0;
	      for(int y=0;y<sentence.length;y++)
	      {
	    	  String g[]=sentence[y].split("#");
	    	  System.out.println(g[1]);
	      String[] tokens = whitespaceTokenizer.tokenize(g[1]);  
	      //Instantiating POSTaggerME class 
	      POSTaggerME tagger = new POSTaggerME(model); 
	       
	      //Generating tags 
	      String[] tags = tagger.tag(tokens); 
	       
	      //Instantiating POSSample class       
	      POSSample sample = new POSSample(tokens, tags);
	      String s=sample.toString();
	      
	      String[] arr=new String [999999];int kk=0;
	      String[] splitString = (s.split(" "));     
	      for (String string : splitString)   
	      {
	    	  boolean retVal,jjsVal,jjrVal,rbval,rbs,rbr;
	    	  retVal = string.endsWith( "_JJ" );    //Adjective
	    	  jjsVal=string.endsWith("_JJS");		//Adjective Superlative
	    	  jjrVal=string.endsWith("_JJR");		//Adj Comparative
	    	  rbval=string.endsWith("_RB");			//Adverb
	    	  rbs=string.endsWith("_RBS");			// Adv Super
	    	  rbr=string.endsWith("_RBR");			//Adv Comp
	    	  if(retVal||jjsVal||jjrVal||rbval||rbs||rbr)
	    	  {
	    		  arr[kk]=string;
	    		  kk++;
	    	  }
	    	  
	      }
	      double tot=0.0;
	      for(int i=0;i<kk;i++)
	      {
	    	  String[] adjective = (arr[i].split("_")); 
	    	  System.out.println(adjective[0]);
	    	  String tolower=adjective[0].toLowerCase();
	    	  Double x=hm.get(tolower);
	    	  if(x!=null)
	    	 tot=tot+x;
	    	 //System.out.println(hm.get(tolower));
	      }
	     // System.out.println(tot); 
	     // System.out.println(s); 
	       
	      //Monitoring the performance of POS tagger 
//	    	
	      	
	      if(tot>0.45)
	      {
	    	  pos++;
	      }
	      else if(tot<-0.45)
	      {
	    	  neg++;
	      }
	      else
	      {
	    	  neu++;
	      }
	      
	      }
	      double u=pos+neg+neu;
	      double po=pos/u;
	      double net=neg/u;
	      double ne=neu/u;
	      System.out.println(po+" "+net+" "+ne);
	      po*=100;
	      net*=100;
	      ne*=100;
	     
			String sql1 ="UPDATE reviews SET positive='"+po+"',negative='"+net+"',neutral='"+ne+"' where Id='"+resultSet.getString(6)+"'";
			PreparedStatement ps=(PreparedStatement) connection.prepareStatement(sql1);
            //System.out.println(sql1);
            int row=ps.executeUpdate();
    		if(row>0)
    		{
    			System.out.println("Sucess");
    		}
    		else
    		{
    			System.out.println("Not Updated");
    		}
			}
			}
			
			}catch( Exception e)
			{
				
			}
	 }
	}