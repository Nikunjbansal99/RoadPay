<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>  
	<%
      String vehiclenum=request.getParameter("vehiclenum"); 
 	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "root");

//Checking if vehicle number exists
		boolean vehicle_exists=false;
		PreparedStatement ps5=con.prepareStatement("SELECT COUNT(*) FROM rctable WHERE vehiclenum=?");
		ps5.setString(1,vehiclenum);
		ResultSet rs5=ps5.executeQuery();
		vehicle_exists=rs5.next();

		if(vehicle_exists){

//Retrieving phone, occupation , vehicle type from rctable

	PreparedStatement ps6=con.prepareStatement("SELECT * FROM rctable WHERE vehiclenum=?");
	ps6.setString(1, vehiclenum);
	ResultSet rs6 = ps6.executeQuery();
	String occupation="";
	String vehicleType = "";
		long phone=0;
		
		while(rs6.next()){
			phone = rs6.getLong("phone");
			occupation = rs6.getString("occupation");
			vehicleType = rs6.getString("vehicletype");		
		}


//Fetching last updated balance from trans where =?

		PreparedStatement ps3=con.prepareStatement("SELECT * FROM trans WHERE phone=?");
		ps3.setLong(1, phone);
		ResultSet rs3=ps3.executeQuery();
		int fetched_balance =0;

		if(rs3.next()==false){
				fetched_balance =0;
				System.out.println("RS3 loop is empty = "+ fetched_balance);
		}
		else{
			do{
				fetched_balance = rs3.getInt("balance");
			}while(rs3.next());
		}

		System.out.println("LAST balance from table = "+ fetched_balance);


//Updating transid in trans table

		PreparedStatement ps2=con.prepareStatement("SELECT COUNT (*) FROM trans");
		ResultSet rs=ps2.executeQuery();
  
		int transid=0;
		while(rs.next()){
				 
			 transid=rs.getInt(1) +1; 
			 out.print( "transid inside loop 29"+ transid  );
		 }
		 System.out.println("out of loop " +  transid  );

	//Deducting the amount to be charged from the user based on vehicle type and occupaton
		int occu=0;
		int vtype=0;
		switch(occupation){
			case "private":
				occu=50;
				break;		
			case "transport":
				occu=70;
				break;
			case "construction":
				occu=100;
				break;
			case "farmer":
				occu=10;
				break;
			case "health":
				occu=0;
				break;
			case "army":
				occu=20;
				break;
		}
		switch (vehicleType){
		case "car":
			vtype = 30;
			break;
		case "bus":
			vtype = 60;
			break;
		case "truck":
			vtype = 80;
			break;
		case "tractor":
			vtype = 20;
			break;
		case "military":
			vtype = 10;
			break;
		}
		
	//Finally updating balance
		
		
		int debit = occu+vtype;
		int updated_balance=fetched_balance;				
		updated_balance =  updated_balance- debit;
		int credit=0;
 
		if(updated_balance>0){
			
		
 
 
 	//As a record we ar - INSERTING TRANSID, PHONE etc in TRANS table

		PreparedStatement ps;
		ps = con.prepareStatement("Insert into trans (transid,phone,time,debit,credit,balance) values(?,?, LOCALTIMESTAMP(2),?,?,? )");
		ps.setInt(1,transid);
		ps.setLong(2,phone);
		ps.setInt(3,debit);
		ps.setInt(4,credit);
		ps.setInt(5,updated_balance);
System.out.println("updated_balance"+updated_balance);
		int i = ps.executeUpdate();

  		 out.println("<script type=\"text/javascript\">");
  		 out.println("alert('Tax Deducted');");
  		 out.println("location='payment.jsp';");
  		 out.println("</script>");
  		 
  		 
  		 //Updating users table for balance column
  		 //UPDATE BALANCE IN USERS
         
         PreparedStatement ps7=con.prepareStatement("UPDATE users set BALANCE=? WHERE PHONE=?");			//Update the fetched (if available) balance in users table
		 ps7.setInt(1,updated_balance);
		 ps7.setLong(2,phone);
         int new_balance = ps3.executeUpdate();	
  	
		}else{
			out.println("<script type=\"text/javascript\">");
			   out.println("alert('Insufficient balance');");
			   out.println("location='payment.jsp';");
			   out.println("</script>");
		}
		}
		else{
			out.println("<script type=\"text/javascript\">");
			   out.println("alert('Invalid CAR Number');");
			   out.println("location='payment.jsp';");
			   out.println("</script>");
		}

	}
		catch(Exception e) {
				System.out.print(e);
				e.printStackTrace();
			}
		
		

%>
