package com.konnect2grow.seeder;

import java.sql.*;
import java.text.*;
import static com.konnect2grow.DBUtil.*;
import java.util.*;
import com.konnect2grow.seedkey.*;

public class SeederServices{

	private Connection con=null;
	
	private PreparedStatement ps=null;
	private ResultSet rs=null;
	private String pwd=null;
	public SeederServices(){
		con=getConnection();
	}

	
	
	public Seeder registerSeeder(Seeder seeder){
		
		
		int val=0;
		java.util.Date date=new java.util.Date();
		DateFormat df=DateFormat.getInstance();
		df.format(date);
		
		
		java.sql.Timestamp timestamp=new java.sql.Timestamp(date.getTime());

		
		seeder.setSeederid(generateId());
		seeder.setPassword(generatePassword());
		seeder.setStatus("Active");
		seeder.setDoj(timestamp.toString());
		
		try{
		con.setAutoCommit(false);
		ps=con.prepareStatement("insert into Seeder(seederid, password, name,mobile,whatsapp,email,dob,gender,address,address2,district,state,pincode,phonepe,gpayid,upiid,refseeder,doj,status,skey,level,bonus) value(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		
		ps.setString(1, seeder.getSeederid());
		
		ps.setString(2, seeder.getPassword());
		ps.setString(3, seeder.getName());
		ps.setString(4, seeder.getMobile());
		ps.setString(5, seeder.getWhatsapp());
		
		ps.setString(6, seeder.getEmail());
		ps.setString(7, seeder.getDob());
		ps.setString(8, seeder.getGender());
		ps.setString(9, seeder.getAddress1());
		//ps.setDate(9, dob);
		ps.setString(10, seeder.getAddress2());
	
		ps.setString(11, seeder.getDistrict());
		ps.setString(12, seeder.getState());
		ps.setString(13, seeder.getPinCode());
		
		ps.setString(14, seeder.getPhonepe());
		ps.setString(15, seeder.getGpayId());
		ps.setString(16, seeder.getUpiId());
		ps.setString(17, seeder.getRefSeeder());
				

		ps.setTimestamp(18, timestamp);
		ps.setString(19, seeder.getStatus());
		ps.setString(20, seeder.getSkey());

		ps.setInt(21, 1);//Level 1 for new registration
		ps.setInt(22, 0);// Bonus 0
		
		
		val=ps.executeUpdate();

		ps=con.prepareStatement("update seedkey set lifecycle=? where skey=?");//update seeder lifecycle set to register

			ps.setString(1, "REGISTER");
			ps.setString(2, seeder.getSkey());
								
			val=ps.executeUpdate();

		con.commit();
		con.close();
		
		if(val==1){
			return seeder;
		}
		else{
			seeder=null;
		}
				
		}
		catch(SQLException sqlex){System.out.println(sqlex.toString());}
		catch(Exception ex){ System.out.println(ex.toString()); }
	return seeder;
	}

	//fetch seeder by search
	public List<Seeder> getSeeders(String searchby, String flag){
		
		
		int val=0;

		List<Seeder> seeders=new ArrayList<Seeder>();

		String query="Select * from seeder";
		
		if(flag.equals("ALL")){

			query="select * from seeder";
		}
		
		if(flag.equals("SEEDERID")){

			query="select * from seeder where seederid='"+searchby+"'";
		}
		if(flag.equals("DISTRICT")){

			query="select * from seeder where district='"+searchby+"'";
		}
		if(flag.equals("STATUS")){

			query="select * from seeder where status='"+searchby+"'";
		}
		if(flag.equals("MOBILE")){

			query="select * from seeder where mobile='"+searchby+"'";
		}
		if(flag.equals("NAME")){

			query="select * from seeder where Name like '%"+searchby+"%'";
		}
		if(flag.equals("STATE")){

			query="select * from seeder where State='"+searchby+"'";
		}
		if(flag.equals("REFER")){

			query="select * from seeder where refseeder='"+searchby+"'";
		}
				

						
		try{
		String dob="";
		ps=con.prepareStatement(query);
		rs=ps.executeQuery();
		
		while(rs.next()){
			
			Seeder seeder=new Seeder();
			seeder.setSeederid(rs.getString(1));
			seeder.setPassword(rs.getString(2));
			seeder.setName(rs.getString(3));
			seeder.setMobile(rs.getString(4));
			
			seeder.setWhatsapp(rs.getString(5));
			
			seeder.setEmail(rs.getString(6));
			
			dob=rs.getTimestamp(7).toString();
			dob=dob.substring(0,10);
			seeder.setDob(dob);
			System.out.println(dob);
			seeder.setGender(rs.getString(8));
			seeder.setAddress1(rs.getString(9));
			seeder.setAddress2(rs.getString(10));
			
			
			
			seeder.setDistrict(rs.getString(11));
			seeder.setState(rs.getString(12));
			seeder.setPinCode(rs.getString(13));
			
			seeder.setPhonepe(rs.getString(14));
			seeder.setGpayId(rs.getString(15));
			seeder.setUpiId(rs.getString(16));
			seeder.setRefSeeder(rs.getString(17));
			
			seeder.setDoj(rs.getTimestamp(18).toString());
			
			seeder.setStatus(rs.getString(19));
			
			seeder.setSkey(rs.getString(20));
			seeder.setLevel(rs.getInt(21));
			seeder.setBonus(rs.getInt(22));
		
			seeders.add(seeder);			
				
		}
		}
		catch(SQLException sqlex){System.out.println(sqlex.toString());}
		catch(Exception ex){ System.out.println(ex.toString()); }
	return seeders;
	}

	public int updateSeeder(Seeder seeder){
		
		
		int val=0;
		
				
		try{
		ps=con.prepareStatement("update Seeder set mobile=?, whatsapp=?, email=?, address=?,address2=?,district=?,state=?,pincode=?,phonepe=?,gpayid=?,upiid=? where seederid=?");
		
		
		ps.setString(1, seeder.getMobile());
		ps.setString(2, seeder.getWhatsapp());
		
		ps.setString(3, seeder.getEmail());
		ps.setString(4, seeder.getAddress1());

		ps.setString(5, seeder.getAddress2());
	
		ps.setString(6, seeder.getDistrict());
		ps.setString(7, seeder.getState());
		ps.setString(8, seeder.getPinCode());
		
		ps.setString(9, seeder.getPhonepe());
		ps.setString(10, seeder.getGpayId());
		ps.setString(11, seeder.getUpiId());
		ps.setString(12, seeder.getSeederid());
				
				
		
		val=ps.executeUpdate();

				
		}
		catch(SQLException sqlex){System.out.println(sqlex.toString());}
		catch(Exception ex){ System.out.println(ex.toString()); }
	return val;
	}

	public int updateStatus(String seederid,String status){
		
		
		int val=0;
		
				
		try{
		ps=con.prepareStatement("update Seeder set status=? where seederid=?");
		
		
		ps.setString(1, status);
		ps.setString(2, seederid);
		
		
		val=ps.executeUpdate();

				
		}
		catch(SQLException sqlex){System.out.println(sqlex.toString());}
		catch(Exception ex){ System.out.println(ex.toString()); }
	return val;
	}




	private String generateId(){
		int id=0;
		String sid=null;
		try{
		Statement state=con.createStatement();
		rs=state.executeQuery("select max(seederid) from Seeder");
		
		rs.next();
		
		sid=rs.getString(1);
		if(sid==null){//if table is empty
			sid="KG1001";	
			System.out.println("First value in table");
			return sid;
		}					
		sid=sid.substring(2);
		id=Integer.parseInt(sid);
		System.out.println(id);
		id++;
		sid=Integer.toString(id);
		sid="KG"+id;
		}
		catch(Exception ex){	System.out.println(ex.toString());}
		
		
	//System.out.println(sid);
	return sid;
	}
	protected String generatePassword(){
		String pwd="";
		Random random=new Random();
		int x;
		for(int i=0; i<5; i++){
		x=random.nextInt(99);
		pwd=pwd+Integer.toString(x);			
		
		}
	//System.out.println(pwd);
	return pwd;
	}
	

	public Seeder checkPassword(String id){
		Seeder seeder=new Seeder();
		String status="";
		//System.out.println(mid);
		try{
		ps=con.prepareStatement("select * from Seeder where seederid=?");
		ps.setString(1, id);
		rs=ps.executeQuery();
		
		if(rs.next()){
			seeder.setSeederid(rs.getString(1));
			seeder.setPassword(rs.getString(2));
			seeder.setName(rs.getString(3));
			
			seeder.setDistrict(rs.getString(11));
			seeder.setDoj(rs.getTimestamp(18).toString());
			status=rs.getString(19);
			
			seeder.setStatus(status);
			seeder.setLevel(rs.getInt(21));
			seeder.setBonus(rs.getInt(22));
			
			//System.out.println(status);
			
								
		}
		else return null;
		}
		catch(SQLException sqlex){

		}
		catch(Exception ex){}
		return seeder;

	}

	public String getName(String id){
		
		String name=null;	
		try{
		ps=con.prepareStatement("select name from Seeder where seederid=?");
		ps.setString(1, id);
		rs=ps.executeQuery();
		
		if(rs.next()){
			name=rs.getString(1);
			
											
		}
		else return null;
		}
		catch(SQLException sqlex){

		}
		catch(Exception ex){}
		return name;

	}
	public boolean checkSkey(String skey){
		
		boolean value=false;
		//String query="select skey from seedkey where skey=? order by duration";
		try{
		ps=con.prepareStatement("select skey from seedkey where skey=? and lifecycle in('NEW','TRANSFER')");
		ps.setString(1,skey);
		rs=ps.executeQuery();
		
		if(rs.next()){
			
			skey=rs.getString(1);
			value=true;					
		}
		
		}
		catch(SQLException sqlex){

		}
		catch(Exception ex){}
		return value;

	}
	
	public int setPassword(String id, String pwd){

		int val=0;	
		try{
				
			ps=con.prepareStatement("update seeder set password=? where seederid=?");
			ps.setString(1, pwd);
			ps.setString(2, id);
								
			val=ps.executeUpdate();
		}
		catch(SQLException sqlex){
			
		}
		catch(Exception ex){}
		return val;


	}

	public List<Seeder> getRefSeeders(String id){
		String status="";
		List<Seeder> seeders=new ArrayList<Seeder>();
		try{
		ps=con.prepareStatement("select * from Seeder where refseeder=?");
		ps.setString(1, id);
		rs=ps.executeQuery();
		int i=1;
		while(rs.next()){
			
			Seeder seeder=new Seeder();
			
			seeder.setBonus(i);
			seeder.setSeederid(rs.getString(1));
			seeder.setName(rs.getString(3));
			seeder.setMobile(rs.getString(4));
			seeder.setWhatsapp(rs.getString(5));
			seeder.setGender(rs.getString(8));
			seeder.setDistrict(rs.getString(11));
		
			
			seeder.setDoj(rs.getTimestamp(18).toString());
			status=rs.getString(19);
			
			seeder.setStatus(status);
			seeder.setLevel(rs.getInt(21));
			
			//System.out.println(status);
			seeders.add(seeder);
				i++;				
		}
		}
		catch(SQLException sqlex){

		}
		catch(Exception ex){}
		return seeders;

	}

	public Seeder getLevels(String sid){
		
		String refseeder;
		Seeder seeder=new Seeder();
		try{
		ps=con.prepareStatement("select refseeder, level from Seeder where seederid=?");
		ps.setString(1, sid);
		rs=ps.executeQuery();
		int i=1;
		if(rs.next()){
			
			seeder.setRefSeeder(rs.getString(1));
			seeder.setLevel(rs.getInt(2));
			
			ps=con.prepareStatement("select level from Seeder where seederid=?");
			ps.setString(1,seeder.getRefSeeder());
			rs=ps.executeQuery();
			if(rs.next()){
				seeder.setBonus(rs.getInt(1));//l1 level
				
			}	
			
										
		}
		}
		catch(SQLException sqlex){

		}
		catch(Exception ex){}
		return seeder;

	}

	public int wdRequest(Withdraw wd){
		
		
		int val=0;
		java.util.Date date=new java.util.Date();
		DateFormat df=DateFormat.getInstance();
		df.format(date);
		
		
		java.sql.Timestamp timestamp=new java.sql.Timestamp(date.getTime());

		
		
		wd.setReqdate(timestamp.toString());
		
		try{
		con.setAutoCommit(false);
		ps=con.prepareStatement("insert into withdraw(seederid,name,district,withdrawl, reqdate, bonusremain, status) value(?,?,?,?,?,?,?)");
		
		ps.setString(1, wd.getSeederid());
		
		ps.setString(2, wd.getName());
		
		ps.setString(3, wd.getDistrict());
		ps.setInt(4, wd.getWithdrawl());
		ps.setString(5, wd.getReqdate());
		
		ps.setInt(6, wd.getBonusremain());
		ps.setString(7, wd.getStatus());
		
		val=ps.executeUpdate();

		
		ps=con.prepareStatement("update seeder set bonus=? where seederid=?");
		ps.setInt(1, wd.getBonusremain());
		ps.setString(2, wd.getSeederid());
								
		val=ps.executeUpdate();
		con.commit();
		
				
		}
		catch(SQLException sqlex){System.out.println(sqlex.toString());}
		catch(Exception ex){ System.out.println(ex.toString()); }
	return val;
	}

	public int getBonus(String sid){
		
		int bonus=0;
		try{
		ps=con.prepareStatement("select bonus from Seeder where seederid=?");
		ps.setString(1, sid);
		rs=ps.executeQuery();
		
		if(rs.next()){
			
			bonus=rs.getInt(1);
			
			
										
		}
		}
		catch(SQLException sqlex){

		}
		catch(Exception ex){}
		return bonus;

	}
	
	public int purchaseKey(Withdraw wd,String sstype, int nos, SeedKeyServices ser){

		SeedKey skey=new SeedKey();
		skey.setSeederid(wd.getSeederid());
		skey.setSkeytype(sstype);
		
		
		int val=0;
		try{
		con.setAutoCommit(false);	
			
			val=wdRequest(wd);
			for(int i=1;i<=nos;i++){
			
			skey=ser.generateSKey(skey);
			}
			
		con.commit();
		
		}
		catch(SQLException sqlex){

		}
		catch(Exception ex){}
		return val;
	
	}

	public List<Withdraw> getWTransaction(String id){
		String status="";
		List<Withdraw> wds=new ArrayList<Withdraw>();
		try{
		ps=con.prepareStatement("select * from withdraw where seederid=? order by reqdate desc limit 20");
		ps.setString(1, id);
		rs=ps.executeQuery();
		
		while(rs.next()){
			
			Withdraw wd=new Withdraw();
			
			wd.setSrno(rs.getInt(1));
			wd.setSeederid(rs.getString(1));
			wd.setName(rs.getString(3));
			wd.setDistrict(rs.getString(4));
			wd.setWithdrawl(rs.getInt(5));	
			
			wd.setReqdate(rs.getTimestamp(6).toString());
			wd.setBonusremain(rs.getInt(7));
			wd.setStatus(rs.getString(8));
			if(wd.getStatus()=="Paid" || wd.getStatus()=="Rejected"){
			 	wd.setPaiddate(rs.getTimestamp(9).toString());
				wd.setTransactionid(rs.getString(10));
			}
			else{
			wd.setPaiddate("NA");	
			wd.setTransactionid("NA");
			}
					//System.out.println(status);
			wds.add(wd);
				
		}
		}
		catch(SQLException sqlex){
		System.out.println(sqlex.toString());}
		
		catch(Exception ex){ 
		System.out.println(ex.toString()); }
		return wds;

	}

	public int[] getSeederCount(){
		
		String status="";
		int count[]=new int[2];
		int active=0;
		int inactive=0;
		try{
		ps=con.prepareStatement("select status,count(*) from seeder group by status");
		
		rs=ps.executeQuery();
		
		while(rs.next()){
			status=rs.getString(1);
			if(status.equals("Active")){
				active=rs.getInt(2);
			
			}
			else{
				inactive=rs.getInt(2);
			}
			
		}
		count[0]=active;
		count[1]=inactive;
		}

		catch(SQLException sqlex){
		System.out.println(sqlex.toString());}
		
		catch(Exception ex){ 
		System.out.println(ex.toString()); }
		return count;
	
	
	}
		
	
	public List<SeedKey> getSeedKeyLog(String seederid){
	
		List<SeedKey> sklist=new ArrayList<SeedKey>();
		
		String seed="NA";
		String paid="NA";
		String assign="NA";
		String cycle="";
		
		String query="select * from seedkey where seederassigned='"+seederid+"' order by generation desc;";	
		try{

		ps=con.prepareStatement(query);
		
		
		rs=ps.executeQuery();
		
		while(rs.next()){
		
		SeedKey sk=new SeedKey();
		sk.setSkey(rs.getString(2));
		sk.setSeederid(rs.getString(3));
		sk.setSkeytype(rs.getString(4));

		sk.setGeneration(rs.getTimestamp(5).toString());
		

		cycle=rs.getString(6);
		sk.setLifecycle(cycle);		
		
		if(cycle.equals("NEW")||cycle.equals("NEW")||cycle.equals("REGISTER")){

			sk.setRemainhelp(rs.getInt(9));
		
		}
		else if(cycle.equals("SEEDED")){
			seed=rs.getTimestamp(7).toString();
			sk.setRemainhelp(rs.getInt(9));
		
		
		}
		else if(sk.getLifecycle().equals("ASSIGN")){
			seed=rs.getTimestamp(7).toString();
			assign=rs.getTimestamp(8).toString();
			sk.setRemainhelp(rs.getInt(9));
		
		
		}
		else{
			seed=rs.getTimestamp(7).toString();
			paid=rs.getTimestamp(8).toString();
			sk.setRemainhelp(rs.getInt(9));
			sk.setPaiddate(rs.getTimestamp(10).toString());
		
			
		}


		sk.setSeeddate(seed);
		sk.setPaiddate(paid);
		sk.setAssigndate(assign);
		
				
		sklist.add(sk);											
		}
				
		}
		catch(SQLException sqlex){
			System.out.println(sqlex.toString());
		}
		catch(Exception ex){}
	
	return sklist;
	
		
	}
	
	public List<BindHelp> getBindHelpLog(String seederid){
		//get actual paid/unpaid log

		List<BindHelp> bhlist=new ArrayList<BindHelp>();
		String query="";

		if(seederid.equals("ALL")){
		 query="select b.srno,b.seederid,b.seederskey, b.seederstype, b.bindseeder, b.bindstype, b.status, b.binddate, b.remainhelp, s.status  from bindlog b join seeder s on b.seederid=s.seederid order by binddate;";
		}
		
		else if(seederid.equals("FULL")){
		
		query="select b.srno, b.seederid,b.seederskey, b.seederstype, b.bindseeder, b.bindstype, b.status, b.binddate, b.remainhelp, s.status  from bindlog b join seeder s on b.seederid=s.seederid where b.status in ('FULL') order by binddate;";
			
		}

		else if(seederid.equals("FULLPART")){
		query="select b.srno, b.seederid, b.seederskey, b.seederstype, b.bindseeder, b.bindstype, b.status, b.binddate, b.remainhelp, s.status  from bindlog b join seeder s on b.seederid=s.seederid where b.status in ('FULL','PARTIAL')order by binddate ;";
		}
		

		else if(seederid.equals("PAID")){
		query="select b.srno, b.seederid, b.seederskey, b.seederstype, b.bindseeder, b.bindstype, b.status, b.binddate, b.remainhelp, s.status  from bindlog b join seeder s on b.seederid=s.seederid where b.status in ('PAID')order by binddate ;";
		}
		else if(seederid.equals("UNPAID")){
		query="select b.srno, b.seederid, b.seederskey, b.seederstype, b.bindseeder, b.bindstype, b.status, b.binddate, b.remainhelp, s.status  from bindlog b join seeder s on b.seederid=s.seederid where b.status in ('UNPAID')order by binddate ;";
		}
				
		else{

		query="select b.srno, b.seederid, b.seederskey, b.seederstype, b.bindseeder, b.bindstype, b.status, b.binddate, b.remainhelp, s.status  from bindlog b join seeder s on b.seederid=s.seederid where b.seederid in ('"+seederid+"')order by binddate ;";
		
//query="select * from bindlog where seederid='"+seederid+"' or bindseeder='"+seederid+"' 
//order by binddate desc;";	
		
		}
		try{

		ps=con.prepareStatement(query);
		
		
		rs=ps.executeQuery();
		
		while(rs.next()){
		
		BindHelp bh=new BindHelp();
		bh.setSrno(rs.getInt(1));
		bh.setSeederid(rs.getString(2));
		bh.setSeederskey(rs.getString(3));

		bh.setSeederstype(rs.getString(4));
		
		bh.setBindseeder(rs.getString(5));
		bh.setBindstype(rs.getString(6));
		
		bh.setStatus(rs.getString(7));
				
		bh.setBinddate(rs.getTimestamp(8).toString());
		bh.setRemainhelp(rs.getInt(9));
		bh.setName(rs.getString(10));
		
				
		bhlist.add(bh);											
		}
				
		}
		catch(SQLException sqlex){
			System.out.println(sqlex.toString());
		}
		catch(Exception ex){}
	
	return bhlist;
	}

	public List<SeedPaid> getSeedPaidLog(String seederid){
		//get actual paid/unpaid log
		
		String query="select * from seedpaid order by paiddate desc;";
		List<SeedPaid> sdlist=new ArrayList<SeedPaid>();
		if(seederid!=null){
		query="select * from seedpaid where seederid='"+seederid+"' order by paiddate desc;";	
		}
		if(seederid!=null && (seederid.length()==30)){
		query="select * from seedpaid where seederskey='"+seederid+"' order by paiddate desc;";	
		}
		
		try{

		ps=con.prepareStatement(query);
		
		
		rs=ps.executeQuery();
		
		while(rs.next()){
		
		SeedPaid sp=new SeedPaid();
		sp.setSeederid(rs.getString(1));

		sp.setSeederskey(rs.getString(2));
		
		sp.setBindseeder(rs.getString(3));
		sp.setBindskey(rs.getString(4));
		sp.setPaymentvia(rs.getString(5));
		sp.setAmount(rs.getInt(6));
		sp.setTransid(rs.getString(7));

		sp.setStatus(rs.getString(8));
				
		sp.setPaiddate(rs.getTimestamp(9).toString());
	
				
		sdlist.add(sp);											
		}
				
		}
		catch(SQLException sqlex){
			System.out.println(sqlex.toString());
		}
		catch(Exception ex){}
	
	return sdlist;
	}

	
}
