package g;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/UserVerify")
public class UserVerify extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
protected void doPost(HttpServletRequest request,
		         HttpServletResponse response) throws ServletException, IOException {
		      response.setContentType("text/html");
		    
    try (PrintWriter out = response.getWriter()) {
        //fetch form value
       String firstname = request.getParameter("firstname");
       String email = request.getParameter("email");
	   String lastname=request.getParameter("lastname");
		String address=request.getParameter("address");
		String ph=request.getParameter("phone");
		long phone=Long.parseLong(ph);
		String aadharst=request.getParameter("aadhar");
		long aadhar =  Long.parseLong(aadharst);

		String rcnum=request.getParameter("rcnum");
		String password=request.getParameter("password");
		String repassword=request.getParameter("repassword");
		
		//CHECK RC IN DATABASE
		Connection con = GetCon.getCon();
		boolean rcStatus=false;
		try {
			PreparedStatement ps=con.prepareStatement("Select count(*) from rctable where rcnum=? and phone=? and aadhar=?");
			ps.setString(1,rcnum);
			ps.setLong(2, phone);
			ps.setString(3, aadharst);
			
			ResultSet rs=ps.executeQuery();
			System.out.println("INSIDE RCSTATUS " + rcnum);
			rcStatus=rs.next();
			System.out.println("RC Status..should be true = "+rcStatus);
		}catch (SQLException e) {
			e.printStackTrace();
		}
       
      		if(rcStatus==true) {
      			System.out.println("INSIDE RCSTATUS TRUE check");
      			
      		//create instance object of the SendEmail Class
                SendEmail sm = new SendEmail();
           		//get the 6-digit code
                String code = sm.getRandom();
                
           		//create new user using all information
                User user = new User(firstname,email,code);
                
                //call the send email method
                boolean test = sm.sendEmail(user);
                
           		//check if the email send successfully
                if(test){
                    HttpSession session  = request.getSession(true);
                    if(session != null) {
                 	   System.out.println("session is created");
                    }
                    session.setAttribute("authcode", user);
                    session.setAttribute("firstname", firstname);
                    session.setAttribute("lastname", lastname);
                    session.setAttribute("email", email);
                    session.setAttribute("address", address);
                    session.setAttribute("phone", phone);
                    session.setAttribute("aadhar", aadhar);
                    session.setAttribute("rcnum", rcnum);
                    session.setAttribute("password", password);
                    session.setAttribute("repassword", repassword);
                    response.sendRedirect("Verify.jsp");
                }else{
           		  out.println("Failed to send verification email");
           	   }
      		}
      		else {
      			out.print("Sorry, RC not valid. Please try later");
    			RequestDispatcher rd=request.getRequestDispatcher("create.html");
    			rd.include(request, response);
      		}
           
        }
    }

}
