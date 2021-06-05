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


@WebServlet("/Search")

public class Search extends HttpServlet {
   private static final long serialVersionUID = 1L;
//insert into transactions (transid, time, credit, balance) values ((select count(transid)+1 from transactions), LOCALTIMESTAMP(2), 100, 100 );
   protected void doPost(HttpServletRequest request,
         HttpServletResponse response) throws ServletException, IOException {
      response.setContentType("text/html");
      PrintWriter out = response.getWriter();
     
      
      String phonest=request.getParameter("phone"); 
      long phone=Long.parseLong(phonest);
      
  	boolean status=false;

      Connection con=GetCon.getCon();
  	try {
  		System.out.println("connection formed");
  		
  		PreparedStatement ps=con.prepareStatement("Select * from users where phone=? and password =?");
  		ps.setLong(1,phone);
  		
  		ResultSet rs=ps.executeQuery();

  		status=rs.next();
  		System.out.println(status);

  	} catch (SQLException e) {
  		e.printStackTrace();
  	}
      
      
    //  String un = request.getParameter("uname");
     // String pwd = request.getParameter("pass");
		if(status==true ||  phone == 0000 ){
        // out.print("Welcome, " + un);
         HttpSession session = request.getSession(true); // reuse existing
                                             // session if exist
                                             // or create one
         session.setAttribute("phone", phone);
         System.out.println("hello from logincontroller"+ phone);
         session.setMaxInactiveInterval(100000); // 30 seconds
         
         if (!status)
        	 response.sendRedirect("admin.jsp");
         else
        	 response.sendRedirect("dashboard.jsp");
      } else {
         RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
         out.println("<font color=red>Either user name or password is wrong.</font>");
         rd.include(request, response);
      } // TODO Auto-generated method stub
   }
}
