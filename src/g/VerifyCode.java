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




@WebServlet("/VerifyCode")
public class VerifyCode extends HttpServlet {

   
    public void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            HttpSession session = request.getSession();
            User user= (User) session.getAttribute("authcode");

            String firstname = (String) session.getAttribute("firstname");
            String lastname= (String) session.getAttribute("lastname");
            String address = (String) session.getAttribute("address");
            long phone= (Long) session.getAttribute("phone");
            String email= (String) session.getAttribute("email");
            long aadhar= (Long) session.getAttribute("aadhar");
            String rcnum= (String) session.getAttribute("rcnum");
            
    		String password = (String) session.getAttribute("password");
    		String repassword = (String) session.getAttribute("repassword");
    				
    				
            String code = request.getParameter("authcode");
            
            if(code.equals(user.getCode())){
                //Verification Done
                int status=RegisterUser.register( firstname, lastname, address, phone, email, aadhar,  rcnum,  password,  repassword);
         	   
        	
        		if(status>0){
        			System.out.println("51");
        			RequestDispatcher rd=request.getRequestDispatcher("index.html");
        			
        			rd.include(request, response);
        		}
        		else{
        			out.print("Sorry,Registration failed. please try later");
        			System.out.println("57");
        			RequestDispatcher rd=request.getRequestDispatcher("MyHtml.html");
        			rd.include(request, response);
        		}

            }else{
            	System.out.println("64");
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
