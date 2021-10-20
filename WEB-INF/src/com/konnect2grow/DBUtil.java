package com.konnect2grow;

import java.sql.*;

public class DBUtil{

	private static Connection con=null;
	
	public static Connection getConnection(){
		try{
			
			String dburl="jdbc:mysql://localhost/konnect2grow?user=root&password=root";
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con=DriverManager.getConnection(dburl);
			System.out.println("Connection established....");
			
		}
		catch(SQLException sql){
			System.out.println(sql.toString());
		}
		catch(Exception ex){
			System.out.println(ex.toString());
		}
	return con;
	}
	
	public static void closeConnection(Statement state, Connection con){
		try{
			if(state!=null){
				state.close();
			}
			if(con!=null){
				con.close();
			}
		System.out.println("Connection is closed.");
		}
		catch(SQLException sql){
			System.out.println(sql.getMessage());
			System.out.println("An error occurred while closing the database connection");
		}	
		catch(Exception ex){
			System.out.println(ex.getMessage());
		}
	}
	public static void safeClose(Statement state){
		try{
			if(state!=null){
				state.close();
			}
			
		
		}
		catch(SQLException sql){
			System.out.println(sql.getMessage());
			System.out.println("An error occurred while closing the database connection");
		}	
		catch(Exception ex){
			System.out.println(ex.getMessage());
		}
	}

}