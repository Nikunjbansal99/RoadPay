<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>  
	<%
//int debitstr=request.getParameter("phone");
//int debit=Integer.parseInt(debit);
	
  
        String password=request.getParameter("password"); 
        String newpassword=request.getParameter("newpassword"); 
        String confirmpassword=request.getParameter("confirmpassword"); 
        long phone = (Long)session.getAttribute("phone");
        
             
             
       out.print(password);
       out.print(newpassword);
       out.print(phone);
try
{


Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "root");



//FETCHING  LAST BALANCE WHERE PHONE =?


PreparedStatement ps3=con.prepareStatement("SELECT * FROM users WHERE phone=?");
ps3.setLong(1, phone);
ResultSet rs3=ps3.executeQuery();
String fetched_password;

if(rs3.next()==false){
fetched_password ="";
System.out.println("RS3 loop is empty = "+ fetched_password);
}else{
do{

	fetched_password = rs3.getString("password");

	}while(rs3.next());
}

System.out.println("LAST password from table = "+ fetched_password);








 
//CHECKING IF ADD BALANCE  is positive 


 
 
 //           					INSERTING TRANSID, PHONE ETC IN TRANS TABLE
//Statement st=con.createStatement();
/////////

PreparedStatement ps;
ps = con.prepareStatement("UPDATE users SET password = '?' WHERE phone = ?;");
ps.setString(1,newpassword);
ps.setLong(2,phone);


int i = ps.executeUpdate();
/////////////
//int i=st.executeUpdate("insert into trans(transid,phone,time)values('"+transid+"','"+phone+"', LOCALTIMESTAMP(2))");
out.println("<script type=\"text/javascript\">");
   out.println("alert('Tax Deducted');");
   out.println("location='dasboard.jsp';");
   out.println("</script>");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}

%>
