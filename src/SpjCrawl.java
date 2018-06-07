import java.io.IOException;
import java.util.TreeSet;
import java.sql.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
//import reuse.Utility;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
//import org.jsoup.nodes.Node;
import org.jsoup.select.Elements;

public class SpjCrawl {
  static TreeSet<String> ts = new TreeSet<String>();

    public static void main(String[] args) throws IOException {
        String[] el1= new String[1000];
        String[] el2= new String[1000];
        String[] el3= new String[1000];
        String[] el4= new String[1000];
        String[] el5= new String[1000];
        String[] el6= new String[1000];
        int i1=0,i2=0,i3=0,i4=0,i5=0,i6=0;
       Document doc1 = Jsoup.connect("https://www.zomato.com/ncr/dinner-in-sector-62-noida").timeout(0).get();
         Elements body = doc1.getElementsByClass("search_left_featured clearfix");
          
            for (Element st : body) {
                   Elements ele = st.select("a");
                   el1[i1] =ele.attr("data-original");
                   System.out.println(el1[i1]);
                 i1++;
            }
            
      Document doc2 = Jsoup.connect("https://www.zomato.com/ncr/dinner-in-sector-62-noida").timeout(0).get();
         Elements body2 = doc2.getElementsByClass("col-s-12");
          
            for (Element st2 : body2) {            
                 
                    Elements ele2 = st2.getElementsByClass("result-title hover_feedback zred bold ln24   fontsize0 ");
                    el2[i2]=ele2.text();
                    System.out.println(el2[i2]);
                    i2++;
            }
            
            Document doc3 = Jsoup.connect("https://www.zomato.com/ncr/dinner-in-sector-62-noida").timeout(0).get();
         Elements body3 = doc3.getElementsByClass("col-m-16 search-result-address grey-text nowrap ln22");
          
            for (Element st3 : body3) {
                  el3[i3] = st3.text();
                   // ele2 = el2.getElementsByClass("result-title hover_feedback zred bold ln24   fontsize0 ").text();
                        System.out.println(el3[i3]);
                        i3++;
            }
            
            Document doc4 = Jsoup.connect("https://www.zomato.com/ncr/dinner-in-sector-62-noida").timeout(0).get();
         Elements body4 = doc4.getElementsByClass("col-s-11 col-m-12 nowrap  pl0");
          
            for (Element st4 : body4) {
                   el4[i4] = st4.select("a").text();
                   
                        System.out.println(el4[i4]);
                        i4++;
            }
            
           Document doc5 = Jsoup.connect("https://www.zomato.com/ncr/dinner-in-sector-62-noida").timeout(0).get();
         Elements body5 = doc5.getElementsByClass("ta-right floating search_result_rating col-s-4 clearfix");
          
            for (Element st5 : body5) {            
                    Elements ele5 = st5.getElementsByClass("rating-popup");
                    el5[i5]=ele5.text();
                    System.out.println(el5[i5]);  
                       i5++;            
            }  
            
          Document doc6 = Jsoup.connect("https://www.zomato.com/ncr/dinner-in-sector-62-noida").timeout(0).get();
         Elements body6 = doc6.getElementsByClass("col-s-11 col-m-12 pl0");
          
            for (Element st6 : body6) {
                  el6[i6] = st6.text();
                     System.out.println(el6[i6]);
                     i6++;
            }  
            
          
       Connection con=null;
    	PreparedStatement ps=null;
	  try
	  { 
	        Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost:3306/java";
		con=DriverManager.getConnection(url,"root","");
		String query="insert into newres values (?,?,?,?,?,?,?);";
		ps=con.prepareStatement(query);

        for(int i=0;i<i1;i++)
        {
		ps.setInt(1,i+1);
		ps.setString(2,el1[i]);
		ps.setString(3,el2[i]);
		ps.setString(4,el3[i]);
                ps.setString(5,el4[i]);
		ps.setString(6,el5[i]);
		ps.setString(7,el6[i]);
		int row=ps.executeUpdate();
        }
		    con.close();
	  }catch(SQLException q)
	  {
		  q.printStackTrace();
	  }
	  catch(ClassNotFoundException q)
	    {
		  q.printStackTrace();
		
	    }     
            
            
        }
    }

