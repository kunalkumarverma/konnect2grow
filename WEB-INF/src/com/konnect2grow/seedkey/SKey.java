package com.konnect2grow.seedkey;

public class SKey { 
    
	public String getAlphaNumericString(int n) { 
        

		String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"+"0123456789"+"abcdefghijklmnopqrstuvxyz"; 
       

	StringBuilder sb = new StringBuilder(n); 
        for (int i= 0; i<n; i++) { 
             int index=(int)(AlphaNumericString.length()*Math.random()); 
            // add Character one by one in end of sb
		sb.append(AlphaNumericString.charAt(index)); 
        } 
        return sb.toString(); 
    } 
    
} 
