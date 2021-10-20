package com.konnect2grow.decorator;
import org.displaytag.decorator.TableDecorator; 
import com.konnect2grow.seeder.*;
import com.konnect2grow.seedkey.BindHelp;
import java.util.*;


import java.text.*;

public class Wrapper extends TableDecorator{
public Wrapper(){
super();
}

public String getSeederActions() { 
Seeder seeder= (Seeder)getCurrentRowObject(); 
String skey= seeder.getSkey();
String stype=seeder.getAddress1(); 
String state=seeder.getState();
if(!state.equals("Active")){
	return "<a href=#><b>NA</b></a>"; 
	
	}
	
return "<a href=\"skey?&skey="+skey+"&action=viewSeeder\"><b>Assign<b/></a>"; 
}



public String getBinderActions() {
	Seeder seeder= (Seeder)getCurrentRowObject(); 
	String skey= seeder.getSkey();
	String seederid=seeder.getSeederid();
	String bindstype=seeder.getAddress1();	 
	String seederstype=seeder.getAddress2();
	int remainhelp=seeder.getBonus();
	String state=seeder.getState();

	
	seederstype=seederstype.substring(1);
	int seederhelp=Integer.parseInt(seederstype);
		//System.out.println(seederhelp+"="+remainhelp);
	if(!state.equals("Active")){
	return "<a href=#><b>NA</b></a>"; 
	
	}
	if(seederhelp>remainhelp){
	//System.out.println("NA Applicable");	
	return "<a href=#><b>NA</b></a>"; 
	
	}

	else{
	return "<a href=\"skey?&remainhelp="+remainhelp+"&seederid="+seederid+"&bindstype="+bindstype+"&skey="+skey+"&action=bindSeeder\"><b>Bind</b></a>"; 
	}

}

	public String getSeedersStatus() { 
		Seeder seeder= (Seeder)getCurrentRowObject(); 
		String seederid=seeder.getSeederid();
		String status= seeder.getStatus();

		return "<a href=\"seeder?&status="+status+"&seederid="+seederid+"&action=updateStatus\"><b>"+status+"<b/></a>"; 
}

public String getSeederids() { 
		Seeder seeder= (Seeder)getCurrentRowObject(); 
		String seederid=seeder.getSeederid();


		return "<a href=\"seeder?&seederid="+seederid+"&action=seederProfile\"><b>"+seederid+"<b/></a>"; 
}
public String getLogs() { 
		Seeder seeder= (Seeder)getCurrentRowObject(); 
		String seederid=seeder.getSeederid();
		String name=seeder.getName();	
			
		return "<a href=\"seeder?&seederid="+seederid+"&action=getLogs\"><b>"+name+"<b/></a>"; 
}

public String getSeederBlock() { 
		BindHelp bindhelp= (BindHelp)getCurrentRowObject(); 
		String seederid=bindhelp.getSeederid();
		String status1=bindhelp.getName();
		String status= "InActive";
		
		String block="BLOCK";

		return "<a href=\"seeder?&status="+status+"&seederid="+seederid+"&action=BLOCK\"><b>"+status1+"<b/></a>"; 
}
public String getSeederUnpaid() { 
		BindHelp bindhelp= (BindHelp)getCurrentRowObject(); 
		String seederid=bindhelp.getSeederid();
		String status1= bindhelp.getStatus();
		String seederskey=bindhelp.getSeederskey();
		int srno=bindhelp.getSrno();
		String status=status1;
		if(status1.equals("PARTIAL") || status1.equals("FULL")){
			status="UNPAID";
				
		return "<a style='color:red' href=\"seeder?&status="+status+"&seederid="+seederid+"&srno="+srno+"&seederskey="+seederskey+"&action=UNPAID\"><b>"+status1+"<b/></a>"; 
		}
		return status1;
}

public String getSeedPaidLog() { 
		BindHelp bindhelp= (BindHelp)getCurrentRowObject(); 
		String seederid=bindhelp.getSeederid();
		String status1= bindhelp.getStatus();
		String seederskey=bindhelp.getSeederskey();
		String status=status1;
				
		return "<a href=\"seeder?&seederskey="+seederskey+"&action=SEEDPAIDLOG\"><b>"+seederid+"<b/></a>"; 
		
}

public String getWithdrawSrno() { 
		Withdraw wd= (Withdraw)getCurrentRowObject(); 
		int srno=wd.getSrno();
			
		return "<a href=\"admin?&srno="+srno+"&action=SETWDS\"><b>"+srno+"<b/></a>"; 
}

public String getTimeElapsed(){

	Seeder seeder= (Seeder)getCurrentRowObject(); 
	String sdate=seeder.getDoj();
	sdate=sdate.substring(0,19);

	String time="NA";
	try{

	Date cdate=new Date();
		DateFormat df=DateFormat.getInstance();
		df.format(cdate);
		
	//java.sql.Timestamp timestamp=new java.sql.Timestamp(date.getTime());

	Date seeddate=new Date();
	SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			
	seeddate=formatter.parse(sdate);
	df.format(seeddate);
	
	Long l1=cdate.getTime();
	Long l2=seeddate.getTime();
	Long distance=l1-l2;

	int days = (int)Math.floor(distance / (1000 * 60 * 60 * 24));
  int hours =(int) Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
  int minutes = (int)Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
  int seconds =(int) Math.floor((distance % (1000 * 60)) / 1000);
	
	
	
	time=days+"d "+hours+"hr";
	
	}
	catch(Exception ex){
		System.out.println(ex.toString());
	}
	
	return time;
}


}
