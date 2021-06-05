package g;

import java.io.IOException;
import java.io.PrintWriter;
import java.rmi.Naming;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




@WebServlet("/VerifyCode1")
public class VerifyCode1 extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            HttpSession session = request.getSession();
            Resetpass resetpass= (Resetpass) session.getAttribute("authcode");
            long phone= (Long) session.getAttribute("phone");		
		
            String code = request.getParameter("authcode");
            String newpass = request.getParameter("newpass");
            String confirmpass = request.getParameter("confirmpass");
            
            if(code.equals(resetpass.getCode())) {
            	if(confirmpass.equals(newpass)){
            		//Verification Done
                
            		int status= UpdatePassword.update(newpass, phone);
         	    
 
            		if(status>0){
            			System.out.println("Password Updated Successfully");
            			RequestDispatcher rd=request.getRequestDispatcher("index.html");
            			rd.include(request, response);
            		}
            		else{
            			System.out.print("Password not updated");
            			RequestDispatcher rd=request.getRequestDispatcher("ChangePassword.html");
            			rd.include(request, response);
            		}
            	}
            	else{
                out.println("Password Mismatch");
            	}
            }
            else{
            	out.println("Incorrect verification code");
            }
            
            
        }
            
     }
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
