<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>RoadPay</title>
    <link href="css/style.css" rel="stylesheet" type="text/css">
   
</head>

<body>

<%

int credit = Integer.parseInt(request.getParameter("credit"));					//Retrieving money to be added from URL
long phone = (Long)session.getAttribute("phone");								//Getting phone number stored in session

try
{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "root");

			//FETCHING  LAST BALANCE WHERE PHONE =?
			PreparedStatement ps3=con.prepareStatement("SELECT * FROM trans WHERE phone=?");			//Retrieving last balance from given phone 
			ps3.setLong(1, phone);
			ResultSet rs3=ps3.executeQuery();
			int fetched_balance =0;												//Assigning it to 0 is done, 	

			if(rs3.next()==false){									
			fetched_balance =0;													//if new user is created his balance will be 0 
			System.out.println("RS3 loop is empty = "+ fetched_balance);
}else{
		do{

			fetched_balance = rs3.getInt("balance");							//Get his latest balance from the trans table

		}while(rs3.next());
	}


		//Process of updating transid. 
		// new_transid =fetched_transid+1
			
		PreparedStatement ps2=con.prepareStatement("SELECT COUNT (*) FROM trans");		
 		ResultSet rs=ps2.executeQuery(); 
		int transid=0;
 		while(rs.next()) {
			 transid=rs.getInt(1) +1; 
		 }

 		
		int updated_balance=fetched_balance;											//Checking if Add Money is positive  or not
		if(credit >0){
		updated_balance = credit + updated_balance;
		}
	    int debit =0;
 
 
 //INSERTING TRANSID, PHONE ETC IN TRANS TABLE

		PreparedStatement ps;
		ps = con.prepareStatement("Insert into trans (transid,phone,time,debit,credit,balance) values(?,?, LOCALTIMESTAMP(2),?,?,? )");   
		ps.setInt(1,transid);
		ps.setLong(2,phone);
		ps.setInt(3,debit);
		ps.setInt(4,credit);
		ps.setInt(5,updated_balance);

		int i = ps.executeUpdate();
		
		PreparedStatement ps4=con.prepareStatement("SELECT * FROM users WHERE phone=?");
		ps4.setLong(1, phone);
		ResultSet rs4=ps4.executeQuery();
		String fetched_email;

		if(rs4.next()==false){
				fetched_email = null;
			}	else{
				do{
					fetched_email= rs4.getString("email");

				}while(rs4.next());
				}
				System.out.println("RS4 loop = "+ fetched_email);
		
				//create instance object of the SendEmail Class
				
                SendEmail sm = new SendEmail();
                
           		//create new user using all information
                CreditTrans credittrans = new CreditTrans(transid,credit,fetched_email,phone,updated_balance);
                
                //call the send email method
                boolean test = sm.sendEmail(credittrans);
                
                //check if the email send successfully
                if(test){
                	out.println("Transaction email Send Successfully");
                }
                else{
           		  out.println("Failed to send Transaction email");
           	   }
		
		
		

  		 out.println("<script type=\"text/javascript\">");
  		 out.println("alert('Money added successfully!');");
   		out.println("location='dashboard.jsp';");
   		out.println("</script>");
	}

catch(Exception e)
	{
		System.out.print(e);
		e.printStackTrace();
	}


%>
<%@ page import="g.*" %>
</body>

</html>