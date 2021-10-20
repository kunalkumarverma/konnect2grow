
import java.sql.*;

import java.text.*;
import static com.konnect2grow.DBUtil.*;
import com.konnect2grow.seeder.*;
import java.util.*;

public class Timer{


public static void main(String [] args){

	java.util.Date date=new java.util.Date();
		DateFormat df=DateFormat.getInstance();
		df.format(date);
		
		java.sql.Timestamp timestamp=new java.sql.Timestamp(date.getTime());
	java.sql.Timestamp timestamp2=new java.sql.Timestamp(date.getTime());

		Calendar cl =Calendar.getInstance();
		Calendar cl2 =Calendar.getInstance();
		
		
		cl.setTime(timestamp);
		cl2.setTime(timestamp2);
		
		cl.add(Calendar.MINUTE,24*61);
		
		long l1=cl.getTimeInMillis();
		long l2=cl2.getTimeInMillis();
		
		System.out.println(cl2.getTime());
		System.out.println(cl.getTime());
		System.out.println((l1-l2)/1000/60);
		String str="";
		long l3=(l1-l2)/1000/60;
		
		long l4=l3%60;
		l3=l3/60;
		if(l4==0){
			str=l3+":00";
		}
		else{
			str=l3+":"+l4;
		}
		System.out.println(l3);
		System.out.println(str);
		

}

}