package com.konnect2grow.seedkey;

import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.text.SimpleDateFormat;
import com.konnect2grow.seeder.*;

public class SKeyAction extends HttpServlet{

	
	private SKeyType skeytype;
	private SeedKey seedkey;
	
	private String status,stype,gtype;
	private int duration,keyval;

	private String seederassigned;
	private String seederid;
	
	private String jspPage="/adminlogin.jsp";

	public void doPost(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException{

		String action = req.getParameter("action");
		System.out.println(action);
		HttpSession session=null;
		SeedKeyServices skeyser=new SeedKeyServices();
		session=req.getSession();
		if(action==null){
			jspPage="/errorPage.jsp";
			
		}

		else if(action.equals("SKEYTYPE")){
			
			List<SKeyType> skeytypes=skeytypes=skeyser.getSKeyTypes();

			
			req.setAttribute("SKEYTYPES", skeytypes);

			jspPage="/skeytype.jsp";
		}
		

		else if(action.equals("SKEYVALUE")){
			

			seederassigned=req.getParameter("sfrom");
			stype=req.getParameter("stype");
			String keys=skeyser.skeyValue(seederassigned, stype);
			
			PrintWriter out=res.getWriter();
			out.print(keys);
			
			return;
			//req.setAttribute("SKEYCOUNT", seedkey);

			//jspPage="/skeytype.jsp";
		}
		else if(action.equals("SKEYCOUNT")){
			

			seederassigned=req.getParameter("sfrom");
			stype=req.getParameter("stype");
			int count=skeyser.getSKeyCount(seederassigned, stype);
			
			PrintWriter out=res.getWriter();
			out.print(count);
			
			return;
			//req.setAttribute("SKEYCOUNT", seedkey);

			//jspPage="/skeytype.jsp";
		}

		
		else if(action.equals("TRANSKEY")){
			
			//List<SKeyType> skeytypes=skeytypes=skeyser.getSKeyTypes();

			String sfrom=req.getParameter("sfrom");
			String sto=req.getParameter("sto");
			String tstype=req.getParameter("tstype");
			String snos=req.getParameter ("tnos");
			String flag=req.getParameter("flag");
			int nos=Integer.parseInt(snos);
			
			int value=skeyser.transferSKey(sfrom,sto,tstype,nos);
			if(value!=0){
			req.setAttribute("MSG", value+ " SeedKey Transfered Successfully");
			}
			else{
			req.setAttribute("MSG", "Something wrong!");

			}
			
			if(flag!=null){
			flag="TRANS";
			jspPage="/skey?action=SGETSTYPE&flag="+flag;	
			}
			else{
			jspPage="/skey?action=GETSTYPE";
			}

		}
		else if(action.equals("STYPEUPDATE")){
			
			stype=req.getParameter("stype");
		//System.out.println(stype);	

		try{
		duration=Integer.parseInt(req.getParameter("duration"));
		keyval=Integer.parseInt(req.getParameter("keyval"));
	
		}
		catch(Exception ex){}
		
		status=req.getParameter("status");
		
		//System.out.println(stype+duration+status);	

		skeytype=new SKeyType();
		skeytype.setStype(stype);
		skeytype.setDuration(duration);
		skeytype.setKeyVal(keyval);
		skeytype.setStatus(status);	
		
		int val=skeyser.updateSKeyType(skeytype);

			jspPage="/skey?action=SKEYTYPE";
		}
		
		
		else if(action.equals("INSERTSEEDKEY")){

			seederassigned=req.getParameter("seederassigned");
			stype=req.getParameter("stype");		
			seedkey=new SeedKey();
			seedkey.setSeederid(seederassigned);
			seedkey.setSkeytype(stype);
			int nos=Integer.parseInt(req.getParameter("nos"));
			
			for(int i=1;i<=nos;i++){
			seedkey=skeyser.generateSKey(seedkey);
			
			}
			if(seedkey!=null){
			
			req.setAttribute("SEEDKEY", seedkey);
			req.setAttribute("NOS", nos);
						
			jspPage="/skey?action=GETSTYPE";
		
			}
			else{jspPage="/ErrorPage.jsp";
			}	
		}//insertSeedkey if close
		
		else if(action.equals("GETSTYPE")){
			
			List<String> stypes=new ArrayList<String>();
			String flag=req.getParameter("flag");
			
			stypes=skeyser.getSTypes();
			if(stypes!=null){
				req.setAttribute("STYPES", stypes);
				
				if(flag!=null){

				jspPage="/seedkeyManagement.jsp";
				}
				else{
				jspPage="/seedkey.jsp";}
		
			}
			else{
				jspPage="/ErrorPage.jsp";
			}
			
			
		}

		else if(action.equals("SGETSTYPE")){
			List<String> stypes=new ArrayList<String>();
			String flag=req.getParameter("flag");	
			stypes=skeyser.getSTypes();
			Seeder seeder=(Seeder)session.getAttribute("SEEDER");
			String seederid=seeder.getSeederid();
			List<SeedKey> skeys=skeyser.getSeededKey(seederid);
			req.setAttribute("SKEYS",skeys);	
			if(stypes!=null){
				req.setAttribute("STYPES", stypes);
				
				if(flag.equals("TRANS")){
					jspPage="/transferseedkey.jsp";
				}
				else{

				List<String[]> skeylist=skeyser.getNewSkeys(seederid);
				
				req.setAttribute("NEWSKEY", skeylist);	
				jspPage="/seedskey.jsp";	
				}
				
			}
			else{
				jspPage="/ErrorPage.jsp";
			}
			
			
		}
		else if(action.equals("SEEDSKEY")){
			
			seederid=req.getParameter("sfrom");
			stype=req.getParameter("tstype");
			int val=skeyser.seedSKey(seederid,stype);
			jspPage="/skey?action=SGETSTYPE&flag=user";
			if(val!=0){
				req.setAttribute("MSG", "Key seeded succussfully!");
				//jspPage="/skey?action=SGETSTYPE&flag=user";
		
			}
			else{
				req.setAttribute("MSG", "No more key available");
				
			}
			
			
		}

		else if(action.equals("GETSEEDERIDS")){
			
			List<String> seederids=new ArrayList<String>();
			stype=req.getParameter("tstype");
			seederids=skeyser.getSeederIds(stype);
			
			PrintWriter out=res.getWriter();
			out.print(seederids);
			
			return;
			//req.setAttribute("SKEYCOUNT", seedkey);

			//jspPage="/skeytype.jsp";
		}
		
		else if(action.equals("GETSEEDERS")){
			
			session.removeAttribute("SEEDERS");
			String lifecycle="SEEDED";
			String seederid=null;
			String stype=null;
			List<Seeder> seeders=new ArrayList<Seeder>();								stype=req.getParameter("stype");
			seederid=req.getParameter("seederid");
			
			if (seederid!=null){
		//System.out.println(seederid);
				
			lifecycle="DIST";
				stype=seederid;
			}
			seeders=skeyser.getSeeders(stype,lifecycle,seederid,stype);
			
					
			//System.out.println(seeders);
			session.setAttribute("SEEDERS", seeders);
			jspPage="/skey?action=GETSTYPE&flag=Mgmt";
		}

		else if(action.equals("viewSeeder")){//will get seedpaid or partial paid user
			
			String lifecycle="SEEDPAID";
			
			Seeder seeder=new Seeder();										String skey=req.getParameter("skey");
			String sstype=req.getParameter("sstype");
			String district=req.getParameter("district");
			//System.out.println(district);
			//System.out.println(stype+"veiw");
			seeder=skeyser.getSeeder(skey);
			
			String stype=seeder.getAddress2();//get Stype of current seeder
			
			if(sstype==null){
				
				
				sstype=stype;
			}
			if(district!=null && !district.equals("")){
				lifecycle="DISTRICT";
				//System.out.println("dist");	
				sstype=district;
			}
			

			List<SKeyType> skeytypes=skeytypes=skeyser.getSKeyTypes();

			
			req.setAttribute("SKEYTYPES", skeytypes);

				
			
			//System.out.println("Seeder"+stype);
			List<Seeder> seeders=new ArrayList<Seeder>();
			seeders=skeyser.getSeeders(sstype, lifecycle,seeder.getSeederid(),stype);
			

			
			List<String> stypes=new ArrayList<String>();
			stypes=skeyser.getSTypes();		
			//System.out.println(seeders);
			
			session.setAttribute("STYPES", stypes);
			session.setAttribute("SEEDER", seeder);
			session.setAttribute("SEEDERS1", seeders);
			jspPage="bindseeder.jsp";
		}
		else if(action.equals("bindSeeder")){
			
			int val=0;
			Seeder seeder=new Seeder();										seeder=(Seeder)session.getAttribute("SEEDER");
			String binderskey=req.getParameter("skey");
			
			String bindid=req.getParameter("seederid");
			String bindstype=req.getParameter("bindstype");
			String remain=req.getParameter("remainhelp");
			int remainhelp=Integer.parseInt(remain);			
			
			
			val=skeyser.bindSKey(seeder, bindid, binderskey, bindstype, remainhelp);
			
			//System.out.println(seeder.getSkey());		
			//System.out.println(seeders);
			session.setAttribute("MSG", "Binded Successfully to "+bindid+" and SType "+bindstype);
			//session.setAttribute("SEEDERS",null);
			//jspPage="bindseeder.jsp";
			session.removeAttribute("SEEDERS");
				
			jspPage="/skey?action=GETSTYPE&flag=Mgmt";
		}
		else if(action.equals("DASHBOARD")){
			
			int val=0;
			Seeder seeder=(Seeder)session.getAttribute("SEEDER");
			String seederid=seeder.getSeederid();
			int level=seeder.getLevel();
			int bonus=seeder.getBonus();
				
			//System.out.println("SeederID="+seederid);
			List<SeedHelp> seedhelps=new ArrayList<SeedHelp>();
			seedhelps=skeyser.getAssign(seederid);
			

			session.setAttribute("SEEDHELPS", seedhelps);								
//change to apply
			List<BindHelp> gethelps=new ArrayList<BindHelp>();
			gethelps=skeyser.getBind(seederid);
			session.setAttribute("GETHELPS", gethelps);					
						
			
			List<Integer[]> seedlist=skeyser.getSeeded(seederid);
			
			Integer scount=0,stotal=0;
			for(Integer i[]:seedlist){
				scount=scount+i[1];
				
				stotal=stotal+i[2];
				
			}
			session.setAttribute("TSDAMT",stotal);
			session.setAttribute("TSDCT",scount);
			
			List<Integer[]> growlist=skeyser.getPaid(seederid);
			
			Integer count=0, total=0;
			for(Integer i[]:growlist){
				count=count+i[1];
				
				total=total+i[2];
				
			}
			session.setAttribute("TPAMT",total);
			session.setAttribute("TPCT",count);
			int skeycount=skeyser.getSKeyCount(seederid, null);
			session.setAttribute("SCT",skeycount);
			session.setAttribute("LEVEL",level);
			
			session.setAttribute("BONUS",bonus);
			
			int direct=skeyser.getDirects(seederid);//get team 
			session.setAttribute("DIRECT", direct);	
			
			
			List<SeedKey> seedkeys=skeyser.getSeedPaidLog(seederid);//for seed log
			req.setAttribute("SEEDKEYS", seedkeys);						
			
			List<BindHelp> bhs=skeyser.getBindHelpLog(seederid);//for seed log
			req.setAttribute("BINDHELPS", bhs);						

			//System.out.println("Count"+count+"Total"+total);
			//get switch for growseed
			String switched=skeyser.getSeedGrowSwitch();
						
			req.setAttribute("SWITCHED", switched);

			Date date=new Date();
			SimpleDateFormat formatter=new SimpleDateFormat("dd MMM yyyy");
			String strdate=formatter.format(date);
			strdate=strdate+" "+"16:00:00";
			//System.out.println(strdate);
			
			session.setAttribute("CAL", strdate);				
			
			jspPage="welcome.jsp";
		}

		else if(action.equals("UPGRADE")){
			Seeder seeder=(Seeder)session.getAttribute("SEEDER");
			String seederid=seeder.getSeederid();
			int direct=skeyser.getDirects(seederid);
		session.setAttribute("DIRECT", direct);	
			
			
			int level=skeyser.upgradeLevel(seederid, direct);
			//System.out.println("level");
			jspPage="/skey?action=DASHBOARD";
			
		}
		else if(action.equals("GETHELP")){
			
			String seederskey=req.getParameter("seederskey");
			String bindskey=req.getParameter("bindskey");
			String seedername=req.getParameter("name");
			String seederstype=req.getParameter("stype");
			String bindstype=req.getParameter("bstype");
			String srno=req.getParameter("srno");
			String sid=req.getParameter("sid");
			
			
			req.setAttribute("SEEDERSKEY", seederskey);
			req.setAttribute("BINDSKEY", bindskey);
			req.setAttribute("NAME", seedername);
			req.setAttribute("STYPE", seederstype);
			req.setAttribute("BSTYPE", bindstype);
			req.setAttribute("SRNO", srno);
			req.setAttribute("SID", sid);
						
			jspPage="acceptseed.jsp";
		}
		else if(action.equals("APPROVEHELP")){
			
			String seederskey=req.getParameter("seederskey");
			String bindskey=req.getParameter("bindskey");

			String seederstype=req.getParameter("sstype");
			String bindstype=req.getParameter("bindstype");
			String status=req.getParameter("status");
			String srno=req.getParameter("srno");
			String sid=req.getParameter("sid");
			//System.out.println("srno");
			
			int val=skeyser.recievedHelp(seederskey, bindskey, seederstype, bindstype,status,srno);
			if(val!=0){

			skeyser.levelBonus(sid,seederstype,0);//for help provider bonus
			skeyser.levelBonus(sid,seederstype,1);//for help provider referal
			
			req.setAttribute("MSG", "Approved Successfully");
			}
			else{
			req.setAttribute("MSG", "Invalid Submission or already submitted");
			
			}
									
			jspPage="acceptseed.jsp";
		}
		else if(action.equals("TRANSUPDATE")){
			
			
			Seeder seeder=(Seeder)session.getAttribute("SEEDER");
			String seederid=seeder.getSeederid();
			
			String seederskey=req.getParameter("seederskey");
			String bindskey=req.getParameter("bindskey");
			String bindseeder=req.getParameter("bindseeder");
			int amount=0;
			String samount=req.getParameter("amount");
			try{
			amount=Integer.parseInt(samount);
			}
			catch(Exception ex){}
			String transid=req.getParameter("transid");
			String paymentvia=req.getParameter("paymentvia");
			SeedPaid seedpaid=new SeedPaid(seederid,seederskey, bindseeder, bindskey,paymentvia, transid, amount);
			
			int val=skeyser.seedPaid(seedpaid);
			if(val!=0){
				req.setAttribute("MSG", "Updated Successfully");
			}
			else{
			req.setAttribute("MSG", "Already submitted");
	
			}
									
			jspPage="helpseeded.jsp";
		}
		else if(action.equals("HELPSEEDED")){
			
			String seederskey=req.getParameter("seederskey");
			String bindskey=req.getParameter("bindskey");
			String bindseeder=req.getParameter("bindseeder");
			String name=req.getParameter("name");
			
			
			req.setAttribute("SEEDERSKEY", seederskey);
			req.setAttribute("BINDSKEY", bindskey);
			req.setAttribute("BINDSEEDER", bindseeder);
			req.setAttribute("BINDNAME", name);
			
						
			jspPage="helpseeded.jsp";
		}
		
			

		else if(action.equals("INSERTSTYPE")){

		stype=req.getParameter("stype");
		gtype=stype.substring(1);
		

		try{
		int grow=Integer.parseInt(gtype);
		gtype="G"+grow*2;
		duration=Integer.parseInt(req.getParameter("duration"));
		keyval=Integer.parseInt(req.getParameter("keyval"));

		}
		catch(Exception ex){}
		status=req.getParameter("status");
		
		//System.out.println(name);
		skeytype=new SKeyType(stype,gtype,duration,keyval,status);
		
		skeytype=skeyser.insertSKeyType(skeytype);
		
		
		if(skeytype!=null){

			req.setAttribute("SEEDKEYTYPE", skeytype);
						
			jspPage="/skey?action=SKEYTYPE";
		
		}
		else{jspPage="/ErrorPage.jsp";
		}	
		
		}//register if close
	dispatch(req, res, jspPage);
	
	}//function close

	public void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException{
		
		
		doPost(req, res);
	}
	private void dispatch(HttpServletRequest req, HttpServletResponse res, String jPage)throws ServletException, IOException{
			
	RequestDispatcher rd = req.getRequestDispatcher(jPage);
		rd.forward(req, res);	
	
}
}

