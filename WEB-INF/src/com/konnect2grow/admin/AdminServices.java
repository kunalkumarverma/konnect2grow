package com.konnect2grow.admin;

import java.sql.*;
import java.text.*;
import static com.konnect2grow.DBUtil.*;
import java.util.*;
import com.konnect2grow.seedkey.*;
import com.konnect2grow.seeder.Withdraw;



public class AdminServices{

	private Connection con=null;
	
	private PreparedStatement ps=null;
	private ResultSet rs=null;

	public AdminServices(){
		con=getConnection();
	}

	
	public Admin checkPassword(String id){
		Admin admin=new Admin();
		//System.out.println(mid);
		try{
		ps=con.prepareStatement("select * from admin where userid=?");
		ps.setString(1, id);
		rs=ps.executeQuery();
		
		if(rs.next()){
			admin.setUserid(rs.getString(1));
			admin.setPassword(rs.getString(2));
								
			}
		else return null;
		}
		catch(SQLException sqlex){

		}
		catch(Exception ex){}
		return admin;

	}
	public int changePassword(String id, String pwd){
		int val=0;
		//System.out.println(mid);
		try{
		ps=con.prepareStatement("Update admin set password=? where userid=?");
		ps.setString(1, pwd);
		ps.setString(2, id);
		val=ps.executeUpdate();
		
		
		}
		
		catch(SQLException sqlex){

		}
		catch(Exception ex){}
		return val;

	}

	public List<SeedKey> getSeedKeyCount(){
		
		String lifecycle="";
		int count=0;
		List<SeedKey> scount=new ArrayList<SeedKey>();
		
		try{
		ps=con.prepareStatement("select lifecycle, count(*) from seedkey group by lifecycle");
		
		rs=ps.executeQuery();
		
		while(rs.next()){
			SeedKey sk=new SeedKey();
			sk.setLifecycle(rs.getString(1));
			sk.setRemainhelp(rs.getInt(2));
			scount.add(sk);	
			
		}
		
		}

		catch(SQLException sqlex){
		System.out.println(sqlex.toString());}
		
		catch(Exception ex){ 
		System.out.println(ex.toString()); }
		return scount;
	
	
	}

	public List<BindHelp> getBindLogCount(){
		
		String lifecycle="";
		int count=0;
		List<BindHelp> blcount=new ArrayList<BindHelp>();
		
		try{
		ps=con.prepareStatement("select status, count(*) from bindlog group by status");
		
		rs=ps.executeQuery();
		
		while(rs.next()){
			BindHelp sk=new BindHelp();
			sk.setStatus(rs.getString(1));
			sk.setRemainhelp(rs.getInt(2));
			blcount.add(sk);	
			
		}
		
		}

		catch(SQLException sqlex){
		System.out.println(sqlex.toString());}
		
		catch(Exception ex){ 
		System.out.println(ex.toString()); }
		return blcount;
	
	
	}

	public int switchOn(String value){
		int val=0;
		
		//System.out.println(mid);
		try{
		ps=con.prepareStatement("Update growseed set switch=?");
		ps.setString(1, value);
		val=ps.executeUpdate();
		
		
		}
		
		catch(SQLException sqlex){

		}
		catch(Exception ex){}
		return val;

	}

	public List<Withdraw> getWithdrawRequest(String status){
		

		int count=0;
		List<Withdraw> wdraw=new ArrayList<Withdraw>();
		String query="select * from withdraw";
		if(status==null){
			query="select * from withdraw";
		}
		else if(status!=null && status.equals("All")){
			query="select * from withdraw";	
		}
			
		else{
			query="select * from withdraw where status='"+status+"'";
		}
		try{
		ps=con.prepareStatement(query);
		
		rs=ps.executeQuery();
		
		while(rs.next()){
			Withdraw wd=new Withdraw();
			wd.setSrno(rs.getInt(1));
			wd.setSeederid(rs.getString(2));
			wd.setName(rs.getString(3));
			wd.setDistrict(rs.getString(4));
			wd.setWithdrawl(rs.getInt(5));
			wd.setReqdate(rs.getTimestamp(6).toString());
			wd.setBonusremain(rs.getInt(7));
			wd.setStatus(rs.getString(8));
			if(wd.getStatus().equals("Paid")){
				wd.setPaiddate(rs.getTimestamp(9).toString());

				wd.setTransactionid(rs.getString(10));
			
			}
			else{
				wd.setPaiddate("NA");

				wd.setTransactionid("NA");

			}
			
			
			
			
			
			wdraw.add(wd);	
			
		}
		
		}

		catch(SQLException sqlex){
		System.out.println(sqlex.toString());}
		
		catch(Exception ex){ 
		System.out.println(ex.toString()); }
		return wdraw;
	

	}

public Withdraw getWithdraw(int srno){
		
			String query="select * from withdraw where srno="+srno;
		Withdraw wd=new Withdraw();
		
		try{
		ps=con.prepareStatement(query);
		
		rs=ps.executeQuery();
		
		if(rs.next()){
			
			wd.setSrno(rs.getInt(1));
			wd.setSeederid(rs.getString(2));
			wd.setName(rs.getString(3));
			wd.setDistrict(rs.getString(4));
			wd.setWithdrawl(rs.getInt(5));
			wd.setReqdate(rs.getTimestamp(6).toString());
			wd.setBonusremain(rs.getInt(7));
			wd.setStatus(rs.getString(8));
			if(wd.getStatus().equals("Paid")){
				wd.setPaiddate(rs.getTimestamp(9).toString());

				wd.setTransactionid(rs.getString(10));
			
			}
			else{
				wd.setPaiddate("NA");

				wd.setTransactionid("NA");

			}
			
						
		}
		
		}

		catch(SQLException sqlex){
		System.out.println(sqlex.toString());}
		
		catch(Exception ex){ 
		System.out.println(ex.toString()); }
		return wd;
	

	}
	
	public int updateWD(int srno, String status, String trxid){
		int val=0;
		String query="";
	
		if(status.equals("Paid")){

			java.util.Date date=new java.util.Date();
		DateFormat df=DateFormat.getInstance();
		df.format(date);
		
		
		java.sql.Timestamp cdate=new java.sql.Timestamp(date.getTime());
			
			query="update withdraw set status='Paid', transactionid='"+trxid+"', paiddate='"+cdate+"' where srno=?;";
		}
		else{
			query="update withdraw set status='"+status+"' where srno=?;";
		
		}		

		try{
		ps=con.prepareStatement(query);
		ps.setInt(1, srno);
		val=ps.executeUpdate();
		
		
		}
		
		catch(SQLException sqlex){
			System.out.println(sqlex.toString());
		}
		catch(Exception ex){}
		return val;

	}


	
}
