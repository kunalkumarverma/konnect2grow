package com.konnect2grow.seeder;

import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import com.konnect2grow.seedkey.*;

public class SeederAction extends HttpServlet{

	
	private Seeder seeder;
	private String seederid, password;
	private String name, mobile,whatsapp, email,dob;
	private String gender, address1, address2, district, state, pincode, phonepe, gpayid, upiid, refseeder, status, skey;
	private String doj;
	private String jspPage="/login.jsp";

	public void doPost(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException{

		String action = req.getParameter("action");
		System.out.println(action);
		HttpSession session=null;
		SeederServices rser=new SeederServices();
		SeedKeyServices skeyser=new SeedKeyServices();
		
		session=req.getSession();
			
			
		
		if(action==null){
			jspPage="/login.jsp";
			
		}
		else if(action.equals("signup")){
			jspPage="/registration.jsp";
			
		}
		else if(action.equals("checkSkey")){
			
			String skey=req.getParameter("skey");
			boolean val=rser.checkSkey(skey);
			PrintWriter out=res.getWriter();
			out.print(val);
			
			return;
						

		}
		else if(action.equals("SHARE")){
			
			
			jspPage="/sharepage.jsp";			

		}
	

		else if(action.equals("profile")){
			
			Seeder seeder=(Seeder)session.getAttribute("SEEDER");
			seederid=seeder.getSeederid();
		
			List<Seeder> seeders=rser.getSeeders(seederid,"SEEDERID");

			req.setAttribute("SEEDERS", seeders);		
			jspPage="/profile.jsp";
			
		}
		else if(action.equals("seederProfile")){
	
			String seederid=req.getParameter("seederid");
			
			List<Seeder> seeders=rser.getSeeders(seederid,"SEEDERID");

			req.setAttribute("SEEDERS", seeders);		
			jspPage="/seedersprofile.jsp";
			
		}
	
		else if(action.equals("BindLogs")){
			
			String status =req.getParameter("STATUS");
			if(status==null){status="ALL";}
			List<BindHelp> bindhelps=rser.getBindHelpLog(status);
			

			session.setAttribute("BINDHELPS", bindhelps);		
	
			jspPage="/seederbindlog.jsp";
			
		}

		else if(action.equals("getLogs")){
			
			String seederid=req.getParameter("seederid");
			
			List<SeedKey> seedkeys=rser.getSeedKeyLog(seederid);
			List<BindHelp> bindhelps=rser.getBindHelpLog(seederid);
			
			List<SeedPaid> seedpaids=rser.getSeedPaidLog(seederid);
		
			req.setAttribute("SEEDPAIDS", seedpaids);
			
			req.setAttribute("SEEDERID", seederid);
			req.setAttribute("SEEDKEYS", seedkeys);		
			req.setAttribute("BINDHELPS", bindhelps);		
	
			jspPage="/seederlogs.jsp";
			
		}
		else if(action.equals("SEEDPAIDLOG")){
			
			String seederskey=req.getParameter("seederskey");
			
			List<SeedPaid> seedpaids=rser.getSeedPaidLog(seederskey);
		
			req.setAttribute("SEEDPAID", seedpaids);
			
			jspPage="/seederpaidlog.jsp";
			
		}


		else if(action.equals("seeders")){
			
			String searchby=null;
			searchby=req.getParameter("searchby");
			String flag=req.getParameter("flag");

			List<Seeder> seeders=rser.getSeeders(searchby,flag);

			req.setAttribute("SEEDERS", seeders);		
			jspPage="/seeders.jsp";
			
		}


		else if(action.equals("updateStatus")){
			
			String seederid=req.getParameter("seederid");
			String status=req.getParameter("status");

			if(status!=null){
				
				if(status.equals("Active")){
				status="InActive";
				}
				else{ status="Active";}
			}						
			int val=rser.updateStatus(seederid,status);
			if(val!=0){
			req.setAttribute("MSG", seederid +" status set to "+status);		
			}
			else{
			req.setAttribute("MSG", "Something went wrong.");		
			}
			jspPage="seeder?action=seeders&flag=ALL";
			
		}
		
		else if(action.equals("BLOCK")){
			
			String seederid=req.getParameter("seederid");
			String status=req.getParameter("status");

			int val=rser.updateStatus(seederid,status);
			
			if(val!=0){
			req.setAttribute("MSG", seederid +" status set to "+status);		
			}
			else{
			req.setAttribute("MSG", "Something went wrong.");		
			}
			jspPage="seeder?action=BindLogs&STATUS=FULL";
			
		}
		else if(action.equals("UNPAID")){//call for UNPAID SEED USER
			
			String seederid=req.getParameter("seederid");
			String status=req.getParameter("status");
			String seederskey=req.getParameter("seederskey");
			String srno=req.getParameter("srno");
			int val=skeyser.recievedHelp(seederskey,null,null,null,status,srno);
			if(val!=0){

			req.setAttribute("MSG", seederid +" status set to "+status);		
			}
			else{
			req.setAttribute("MSG", "Something went wrong.");		
			}
			jspPage="seeder?action=BindLogs&STATUS=FULL";
			
		}



		
		else if(action.equals("home")){
			jspPage="/login.jsp";
			
		}
		else if(action.equals("SignOut")){
			session.removeAttribute("SEEDER");
			session.invalidate();
			jspPage="/login.jsp";
			
		}
		else if(action.equals("change")){
			jspPage="/changepass.jsp";
			
		}
		else if(action.equals("RESET")){
			
			String seederid=req.getParameter("SEEDERID");
			String pwd=rser.generatePassword();
			int val=rser.setPassword(seederid, pwd);		
			PrintWriter out=res.getWriter();
			out.print(pwd);
			
			return;
			
			
		}


		else if(action.equals("MYTEAM")){

			Seeder seeder=(Seeder)session.getAttribute("SEEDER");
			String seederid=seeder.getSeederid();
		
			List<Seeder> seeders=rser.getRefSeeders(seederid);
			req.setAttribute("MYTEAM", seeders);
			jspPage="/myteam.jsp";
			
		}

		
		else if(action.equals("ChangePass")){
			
			Seeder seeder=new Seeder();
			int val=0;
			seeder=(Seeder)session.getAttribute("SEEDER");
			String pwd=req.getParameter("pwd");
			String npwd=req.getParameter("npwd");
			seeder=rser.checkPassword(seeder.getSeederid());
			if(seeder!=null){

				if(pwd.equals(seeder.getPassword())){
					val=rser.setPassword(seeder.getSeederid(),npwd);
					if(val==1){
						req.setAttribute("MSG","New Password Set Successfully");
			
					}//val if
					else{
				req.setAttribute("MSG","Something went wrong while changing password, try later");
					}
				
				}//pwd if
				else{req.setAttribute("MSG","Old password doesnot match.");}
			}//seeder close

			
			jspPage="/changepass.jsp";
			
		}

		else if(action.equals("GETNAME")){
			
			seederid=req.getParameter("SEEDERID");
			name=rser.getName(seederid);
			//System.out.println(name);
			PrintWriter out=res.getWriter();
			out.print(name);
			return;
			//return null;
			//jspPage="/login.jsp";
			
		}
		

		else if(action.equals("KEYVAL")){
			
			

			String sstype=req.getParameter("tstype");
			String stype=sstype.substring(1);
			int keyval=skeyser.getKeyVal(stype);
			//System.out.println(name);
			PrintWriter out=res.getWriter();
			out.print(keyval);
			return;
			
		}


		else if(action.equals("Wallet")){
			
			List<String> stypes=new ArrayList<String>();
			
			Seeder seeder=(Seeder)session.getAttribute("SEEDER");
			
			//Seeder seeder=new Seeder();										seeder=(Seeder)session.getAttribute("SEEDER");
			seederid=seeder.getSeederid();
			int bonus=rser.getBonus(seederid);
			req.setAttribute("BONUS1",bonus);
			
			stypes=skeyser.getSTypes();
			session.setAttribute("STYPES", stypes);
			
			List<Withdraw> wds=new ArrayList<Withdraw>();
			wds=rser.getWTransaction(seederid);
			req.setAttribute("WDS",wds);
			
			jspPage="/withdraw.jsp";
			
		}
		
		else if(action.equals("PSKEY")){

		Seeder seeder=new Seeder();										seeder=(Seeder)session.getAttribute("SEEDER");
		seederid=seeder.getSeederid();
		name=seeder.getName();
		district=seeder.getDistrict();
		

		int ibonus=rser.getBonus(seederid);
		String nos=req.getParameter("nos");
		String tstype=req.getParameter("tstype");
		String sstype=tstype.substring(1);
		int inos=Integer.parseInt(nos);
		int stype=Integer.parseInt(sstype);
		int keyval=skeyser.getKeyVal(sstype);
		int total=inos*keyval;

		Withdraw withdraw=new Withdraw();
		withdraw.setSeederid(seederid);
		withdraw.setName(name);
		withdraw.setDistrict(district);

		
		
		if(total<=ibonus){
			withdraw.setBonusremain(ibonus-total);
			withdraw.setWithdrawl(total);
			withdraw.setStatus("Key");

			int val=rser.purchaseKey(withdraw,tstype,inos,skeyser);
			
			if(val!=0){
				req.setAttribute("MSG2","SKey added succussfully to your account");
				jspPage="/withdraw.jsp";
			}
			else{
				req.setAttribute("MSG2","Something went wrong");
				jspPage="/withdraw.jsp";	
			}
		}
		List<Withdraw> wds=new ArrayList<Withdraw>();
		wds=rser.getWTransaction(seederid);
		req.setAttribute("WDS",wds);
		int bonus=rser.getBonus(seederid);
			req.setAttribute("BONUS1",bonus);
				
		
		}

		else if(action.equals("WITHDRAW")){
	
		Seeder seeder=new Seeder();										seeder=(Seeder)session.getAttribute("SEEDER");
		seederid=seeder.getSeederid();
		name=seeder.getName();
		district=seeder.getDistrict();
		//String bonus=req.getParameter("bonus");	
		int ibonus=rser.getBonus(seederid);
		String withdrawl=req.getParameter("withdrawl");
		int wd=Integer.parseInt(withdrawl);


		Withdraw withdraw=new Withdraw();
		withdraw.setSeederid(seederid);
		withdraw.setName(name);
		withdraw.setDistrict(district);
			
		
		int bremain=ibonus-wd;
		withdraw.setBonusremain(bremain);
		withdraw.setWithdrawl(wd);
		withdraw.setStatus("Request");
			

		if(bremain<=500){
			
			req.setAttribute("MSG","Unable to process request. Transaction Declined");
			jspPage="/withdraw.jsp";
			//System.out.println("less amount");
		
		}
		else{
		
			int val=rser.wdRequest(withdraw);
			//System.out.println(withdraw);			

			if(val!=0){

			req.setAttribute("MSG","Request Submitted successfully. Approval will take 3 working days.");
			req.setAttribute("WITHDRAW", withdraw);
			
			jspPage="/withdraw.jsp";
			}
			
			else{jspPage="/ErrorPage.jsp";}	
		}
		List<Withdraw> wds=new ArrayList<Withdraw>();
		wds=rser.getWTransaction(seederid);
		req.setAttribute("WDS",wds);
		int bonus=rser.getBonus(seederid);
			req.setAttribute("BONUS1",bonus);
			
			
		}//withdraw if close

		
		else if(action.equals("login")){

			seederid=req.getParameter("seederid");
			password=req.getParameter("pwd");
			
		
			seeder=rser.checkPassword(seederid);
			if(seeder!=null){

			if(seeder.getStatus().equals("InActive")){
	
			req.setAttribute("MSG","Seeder Id Inactive, contact admin");
			jspPage="/login.jsp";
			}


			else if(password.equals(seeder.getPassword())){
			session.setAttribute("SEEDER", seeder);
			//session.setAttribute("NAME", seeder.getName());
			//System.out.println(seeder.getPassword());

			
			jspPage="/skey?action=DASHBOARD";
			}//pwd if close
			else{
			req.setAttribute("MSG","Incorrect Password");
			jspPage="/login.jsp";
			}
		}//seeder if close
		else{
			req.setAttribute("MSG", "Invalid User Id");
			jspPage="/login.jsp";

		}
		
		
	}//login close


		else if(action.equals("update")){

		
		mobile=req.getParameter("mobile");
		whatsapp=req.getParameter("whatsapp");
		email=req.getParameter("email");
		address1=req.getParameter("address1");
		address2=req.getParameter("address2");
		district=req.getParameter("district");
		state=req.getParameter("state");
		pincode=req.getParameter("pincode");
		phonepe=req.getParameter("phonepe");
		gpayid=req.getParameter("gpayid");
		upiid=req.getParameter("upiid");
		//System.out.println(name);
		
		
		Seeder seeder=new Seeder();										seeder=(Seeder)session.getAttribute("SEEDER");
		seederid=seeder.getSeederid();
		
		seeder.setMobile(mobile);
		seeder.setWhatsapp(whatsapp);
		seeder.setEmail(email);
		seeder.setAddress1(address1);
		seeder.setAddress2(address2);
		seeder.setDistrict(district);
		seeder.setState(state);
		seeder.setPinCode(pincode);
		seeder.setPhonepe(phonepe);
		seeder.setGpayId(gpayid);
		seeder.setUpiId(upiid);

				
		int val=rser.updateSeeder(seeder);
		
		
		if(val!=0){

			req.setAttribute("MSGUP", "Profile Updated Successfully");
						
			jspPage="seeder?action=profile";
		}
		else{
		req.setAttribute("MSGUP", "Profile Updated Successfully");
		
			jspPage="seeder?action=profile";}
		
		
		}//register if close
		
		else if(action.equals("register")){

		refseeder=req.getParameter("refseeder");
		skey=req.getParameter("skey");
		name=req.getParameter("fname");
		mobile=req.getParameter("mobile");
		whatsapp=req.getParameter("whatsapp");
		email=req.getParameter("email");
		dob=req.getParameter("dob");
		gender=req.getParameter("gender");
		address1=req.getParameter("address1");
		address2=req.getParameter("address2");
		district=req.getParameter("district");
		state=req.getParameter("state");
		pincode=req.getParameter("pincode");
		phonepe=req.getParameter("phonepe");
		gpayid=req.getParameter("gpayid");
		upiid=req.getParameter("upiid");
		//System.out.println(name);
		seeder=new Seeder(name, mobile,whatsapp, email, dob, gender, address1, address2, district, state, pincode, phonepe, gpayid, upiid, refseeder, skey);
		
			boolean val=rser.checkSkey(skey);
		if(val==true){
		seeder=rser.registerSeeder(seeder);
		
		//System.out.println("Full Name"+seeder.getName());
		if(seeder!=null){

			req.setAttribute("SID", seeder.getSeederid());
			req.setAttribute("PWD", seeder.getPassword());
			req.setAttribute("FNAME", seeder.getName());
			
			
			jspPage="/SuccessRegis.jsp";
			}
			else{jspPage="/ErrorPage.jsp";}
		}
		else{jspPage="/ErrorPage.jsp";
		}	
		
		}//register if close




	dispatch(req, res, jspPage);
	
	}//function close

	public void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException{
		
		//System.out.println("DoGet"+req.getParameter("refseeder"));
		doPost(req, res);
	}
	private void dispatch(HttpServletRequest req, HttpServletResponse res, String jPage)throws ServletException, IOException{
			
	RequestDispatcher rd = req.getRequestDispatcher(jPage);
		rd.forward(req, res);	
	
}
}

