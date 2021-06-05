package g;


import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/UserVerify1")
public class UserVerify1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
protected void doPost(HttpServletRequest request,
		         HttpServletResponse response) throws ServletException, IOException {
		      response.setContentType("text/html");
		    
    try (PrintWriter out = response.getWriter()) {
        //fetch form value
       String email = request.getParameter("email");
	   String ph=request.getParameter("phone");
	   long phone=Long.parseLong(ph);
	
       
      		//create instance object of the SendEmail Class
           SendEmail sm = new SendEmail();
      		//get the 6-digit code
           String code = sm.getRandom();
           
      		//create new user using all information
           Resetpass resetpass = new Resetpass(phone,email,code);
           
           //call the send email method
           boolean test = sm.sendEmail(resetpass);
           
      		//check if the email send successfully
           if(test){
               HttpSession session  = request.getSession(true);
               session.setAttribute("authcode", resetpass);
               session.setAttribute("email", email);
               session.setAttribute("phone", phone);
               response.sendRedirect("NewPassword.html");
           }else{
      		  out.println("Failed to send verification email");
      	   }
           
        }
    }

}
