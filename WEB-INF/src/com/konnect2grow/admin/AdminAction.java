package com.konnect2grow.admin;

import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import com.konnect2grow.seeder.*;
import com.konnect2grow.seedkey.*;


public class AdminAction extends HttpServlet{

	private String id;
	private String pwd;
	private String name;
	private String jspPage="/adminlogin.jsp";
	
	public void doPost(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException{

		String action = req.getParameter("action");
		
		HttpSession session=null;
		AdminServices aser=new AdminServices();
		SeederServices sser=new SeederServices();
		SeedKeyServices skeyser=new SeedKeyServices();			
		session=req.getSession();
			
		if(action==null){
			jspPage="/adminlogin.jsp";
		}
		else if(action.equals("logout")){
			session=req.getSession();
			if(session!=null){
				session.invalidate();
				jspPage="/adminlogin.jsp";
			}
		}

		else if(action.equals("Switch")){
			
			
			String cbox=req.getParameter("cbox");
			System.out.println(cbox);
			int val=aser.switchOn(cbox);
			
			PrintWriter out=res.getWriter();
			out.print("Checked");
			
			return;
			
		}
		else if(action.equals("VIEWKEY")){
			
			
			String seederid=req.getParameter("seederid");
			String stype=req.getParameter("tstype");
			List<String> stypes=new ArrayList<String>();
			List<SeedKey> skeys=skeyser.getNewKeys(seederid, stype);
			req.setAttribute("VIEWKEYS",skeys);
			
			stypes=skeyser.getSTypes();
			req.setAttribute("STYPES", stypes);

			
			jspPage="/viewSkey.jsp";	

			
			
		}
		else if(action.equals("VIEWPAGE")){
			
		List<String> stypes=new ArrayList<String>();
			stypes=skeyser.getSTypes();
			req.setAttribute("STYPES", stypes);
	
			jspPage="/viewSkey.jsp";	

			
		}
		else if(action.equals("WITHDRAW")){
			
			String status=req.getParameter("status");	
			
			List<Withdraw> wds=aser.getWithdrawRequest(status);
			session.setAttribute("WDS", wds);
	
			jspPage="/wdRequest.jsp";	

			
		}
		else if(action.equals("SETWDS")){
			
			String sno=req.getParameter("srno");	
			int srno=Integer.parseInt(sno);
			Withdraw wds=aser.getWithdraw(srno);
			req.setAttribute("WITHDRAW", wds);
	
			jspPage="/withdrawPage.jsp";	

			
		}
		else if(action.equals("UPDATEWD")){
			
			String sno=req.getParameter("srno");	
			int srno=Integer.parseInt(sno);
			Withdraw wds=aser.getWithdraw(srno);
			String status=req.getParameter("status");	
			String trxid=req.getParameter("trxid");	
			int val=aser.updateWD(srno, status, trxid);			
			String msg="Something went wrong!";
			if(val!=0){
				msg="Updated Successfully.";
			}
			req.setAttribute("WITHDRAW", wds);
			req.setAttribute("MSG",msg);
			
			jspPage="/withdrawPage.jsp";	

			
		}


		
		else if(action.equals("DASHBOARD")){
				

			int seedercount[]=sser.getSeederCount();
			//System.out.println(seedercount);
			List<SeedKey> sdcount=aser.getSeedKeyCount();
			int totalkey=sdcount.size();

			List<BindHelp> blogs=aser.getBindLogCount();
			int paid=0, partial=0, full=0, unpaid=0;
			for(BindHelp bh:blogs){

				if(bh.getStatus().equals("PAID")){

					paid=bh.getRemainhelp();
				}
				if(bh.getStatus().equals("UNPAID")){
					unpaid=bh.getRemainhelp();
				}
				if(bh.getStatus().equals("FULL")){

					full=bh.getRemainhelp();
				}
				if(bh.getStatus().equals("PARTIAL")){
					partial=bh.getRemainhelp();
				}


			
			}
			
			String checkstatus=skeyser.getSeedGrowSwitch();
			String checked="UNCHECKED";
			System.out.println(checkstatus);
			if(checkstatus.equals("On")){
				checked="CHECKED";				
			}

			req.setAttribute("CHECKSTATUS",checked);
			req.setAttribute("FULL",full);
			req.setAttribute("PARTIAL",partial);
			req.setAttribute("PAID",paid);
			req.setAttribute("UNPAID",unpaid);

			req.setAttribute("TKEY", totalkey);
			req.setAttribute("LIFECYCLE",sdcount);
			req.setAttribute("ACTSEEDER",seedercount[0]);
			req.setAttribute("INACTSEEDER",seedercount[1]);

			

			jspPage="/adminWelcome.jsp";	
		}

		else if(action.equals("changepass")){

				
				jspPage="/adminchangePass.jsp";	
		}
		

	
		
		else if(action.equals("login")){

		id=req.getParameter("userid");
		pwd=req.getParameter("pwd");
			
		
		Admin admin=aser.checkPassword(id);
		if(admin!=null){
			if(pwd.equals(admin.getPassword())){
			session.setAttribute("ADMIN", admin);
			jspPage="admin?action=DASHBOARD";
			}//pwd if close
			else{
			req.setAttribute("MSG","Incorrect Password");
			jspPage="/adminlogin.jsp";
			}
		}//admin if close
		else{
			req.setAttribute("MSG", "Invalid User Id");
			jspPage="/adminlogin.jsp";

		}
		
	}//login close

	
	else if(action.equals("cpass")){
		try{
		session=req.getSession();
		Admin sadmin=(Admin)session.getAttribute("ADMIN");
		id=sadmin.getUserid();
		}
		catch(Exception ex){
			System.out.println(ex.toString());
		}
		pwd=req.getParameter("pwd");
		String npwd=req.getParameter("npwd");	
		

		Admin admin=aser.checkPassword(id);
		if(admin!=null){
			if(pwd.equals(admin.getPassword())){

			int val=aser.changePassword(id, npwd);
			if(val!=0){
				jspPage="/adminchangepass.jsp";
				req.setAttribute("MSG","New Password set succussfully.");
				
			}
			else{
			req.setAttribute("MSG","Something went wrong.");
			}
			}//pwd if close
			else{
			req.setAttribute("MSG","Incorrect old Password");
			
			}
		
		}//admin if close
		jspPage="/adminchangePass.jsp";
			
	}	


			
		else{ jspPage="/ErrorPage.jsp";} 
	dispatch(req, res, jspPage); 
	}

	public void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException{
		
		doPost(req, res);
	}
	private void dispatch(HttpServletRequest req, HttpServletResponse res, String jPage)throws ServletException, IOException{
			
	RequestDispatcher rd = req.getRequestDispatcher(jPage);
		rd.forward(req, res);	
	
}
}

