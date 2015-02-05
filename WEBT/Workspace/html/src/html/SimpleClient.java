package html;

import java.net.*;
import java.io.*;

public class SimpleClient {
  public static void main(String[] args) {
    try 
    {
    	HttpURLConnection con = (HttpURLConnection) (new URL(args[0])).openConnection();
    	con.setRequestProperty("User-Agent", "IXWT");
    	con.setInstanceFollowRedirects(false);
    	
    	
    	System.out.println(con.getResponseCode());
        
      
    	InputStreamReader in = new InputStreamReader(con.getInputStream());
    	int c;
    	while ((c = in.read())!=-1)
    		System.out.print((char)c);
  
    	con.disconnect();
    } catch (IOException e) {
      System.err.println(e); 
    }
  }
}