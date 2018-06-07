import java.util.Spliterator;

public class address {

	
	public static void main(String args[])
	{
		String s="Opposite TDI Paragon Mall, Rajouri Garden, New Delhi";
		String arr[]=s.split(",");
		String sp="";
		int c=3;
		int f=arr.length-c;
		for(int i=f;i<arr.length&&c>0;i++)
		{
			if(i!=f)
			sp+=","+arr[i];
			else
				sp+=arr[i];
		}
		System.out.println(sp);
	}
}
