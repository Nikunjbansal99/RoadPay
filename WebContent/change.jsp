<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>  
	<%
	    String password=request.getParameter("password"); 
        String newpassword=request.getParameter("newpassword"); 
        String confirmpassword=request.getParameter("confirmpassword"); 
        long phone = (Long)session.getAttribute("phone");
        
        if(newpassword.equals(confirmpassword)){				//If newpassword equals confirm password then only execute further
       
	try
	{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "root");
			
			
			PreparedStatement ps1=con.prepareStatement("SELECT * FROM users WHERE phone=?");					//Fetching old password from users table to check it later
			ps1.setLong(1, phone);
			ResultSet rs1=ps1.executeQuery();
			String fetched_password;
			
			if(rs1.next()==false){
				fetched_password ="";				
			}else{
					do{
						fetched_password = rs1.getString("password");
						}while(rs1.next());
				}
			
			//Checking if password equals in the table or not
			
			if(fetched_password.equals(password)){																//Checking if the current password matches form table
					PreparedStatement ps = con.prepareStatement("UPDATE users SET password = ? WHERE phone = ?");			//Updating new password in the users table
					ps.setString(1,newpassword);		
		  			ps.setLong(2,phone);	
					int status=ps.executeUpdate();

				out.println("<script type=\"text/javascript\">");
	  			out.println("alert('Password changed successfully!');");							
	  			out.println("location='dashboard.jsp';");
	   			out.println("</script>");
			}else{
				out.println("<script type=\"text/javascript\">");
	     		 out.println("alert('Incorrect current password!');");
	      	  	 out.println("location='changePassword.jsp';");
	      	 	 out.println("</script>");
			}
						
		
		}
	catch(Exception e)
		{
				System.out.print(e);
				e.printStackTrace();
		}

       	 }else{
    	  	 	 out.println("<script type=\"text/javascript\">");
     			 out.println("alert('Passwords are not same!');");
      	  		 out.println("location='changePassword.jsp';");
      	 		 out.println("</script>");
       	}
%>