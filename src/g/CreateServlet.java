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


@WebServlet("/CreateServlet")
public class CreateServlet extends HttpServlet {
	   private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String firstname=request.getParameter("firstname");
		String lastname=request.getParameter("lastname");
		String address=request.getParameter("address");
		String ph=request.getParameter("phone");
		long phone=Long.parseLong(ph);
		String email=request.getParameter("email");
		String aadharst=request.getParameter("aadhar");
		long aadhar =  Long.parseLong(aadharst);

		String rcnum=request.getParameter("rcnum");
		String password=request.getParameter("password");
		String repassword=request.getParameter("repassword");
		
		
		
	    int status=RegisterUser.register( firstname, lastname, address, phone, email, aadhar,  rcnum,  password,  repassword);
	   
	    
		if(status>0){
			
			RequestDispatcher rd=request.getRequestDispatcher("index.html");
			rd.include(request, response);
		}
		else{
			out.print("Sorry,Registration failed. please try later");
			RequestDispatcher rd=request.getRequestDispatcher("MyHtml.html");
			rd.include(request, response);
		}
		
	out.close();	
	}

}
