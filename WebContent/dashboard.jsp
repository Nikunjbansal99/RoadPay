<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>RoadPay</title>
    <link href="css/style.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">
        function ctck() {
            var sds = document.getElementById("dum");
        }
    </script>
</head>
<body>

<%

if (session != null) {
         if (session.getAttribute("phone") != null) {
            		long phone = (Long)session.getAttribute("phone");		//If session exists, phone also exist
       
					Connection con=GetCon.getCon();
					PreparedStatement ps=con.prepareStatement(" Select * from users where phone=?");		//Fetching the user with phone stored in session
					ps.setLong(1,phone);
                    ResultSet rs=ps.executeQuery();
                    request.setAttribute("phone",phone); 
        
                    PreparedStatement ps2=con.prepareStatement(" Select balance from trans where phone=? order by time desc");		//Fetch updated balance of user from trans table
    				ps2.setLong(1,phone); 
    			    ResultSet rs2=ps2.executeQuery();
    				int bal=0;    				
    				if(rs2.next()){
    					//System.out.print("RS2 NOT FOUND..." + bal);
    					bal=rs2.getInt("balance");
    				}             
                   // System.out.print("OUTSIDE RS2 LOOP..." + bal);
     
               //UPDATE BALANCE IN USERS
               
             PreparedStatement ps3=con.prepareStatement("UPDATE  users set BALANCE=? WHERE  PHONE=?");			//Update the fetched (if available) balance in users table
			 ps3.setInt(1,bal); 
			 ps3.setLong(2, phone);
             int updated_balance = ps3.executeUpdate();					
             // System.out.print("\nUPDATED BALANCE... \n" + bal + " OOO " + updated_balance);
 %>
 
    <main id="main-holder">
           
       <div class="logo"> <h1 id="login-header">Dashboard</h1></div>
       <div class="content">
       <div class="options">

            <button class="buttons"><a href="update.html">Add money</a></button>
            <button class="buttons"><a href="transaction.jsp">Transactions</a></button>
            <button class="buttons"><a href="changePassword.jsp">Change password</a></button>
            
            <form action="Logout" method="post">
      			<input class="buttons" type="submit" value="Logout">
  			 </form>
   
	  </div>
        
      <div class="details">


<table><%

try {
				out.print("<table>");
				while(rs.next()){                              
                                    out.print("<tr>");
                                    out.print("<th>Wallet ID</th>");
                                    out.print("<td>" + rs.getInt(1) + "</td>");// Printing wallet
                                    
                                    out.print("<tr>");  
                                    out.print("<th>FirstName</th>");
                                    out.print("<td>" + rs.getString(2) + "</td>"); // Printing firstname
                                   
                                    out.print("<tr>");
                                    out.print("<th>LastName</th>");
                                    out.print("<td>" + rs.getString(3) + "</td>"); // Printing lastname
                                    
                                    out.print("<tr>");
                                    out.print("<th>Address</th>");
                                    out.print("<td>" + rs.getString(4) + "</td>"); // Printing address
                                    
                                    out.print("<tr>");
                                    out.print("<th>Contact Number</th>");
                                    out.print("<td>" + rs.getLong(5) + "</td>"); //Printing phone
                                    
                                    out.print("<tr>");
                                    out.print("<th>Email ID</th>");
                                    out.print("<td>" + rs.getString(6) + "</td>"); //Email
                                    
                                    out.print("<tr>");
                                    out.print("<th>Aadhar Number</th>");
                                    out.print("<td>" + rs.getLong(7) + "</td>"); // aadhar
                                    
                                    out.print("<tr>");
                                    out.print("<th>Vehicle R/C</th>");
                                    out.print("<td>" + rs.getString(8) + "</td>"); //RCNUM
                                    
                                    out.print("<tr>");
                                    out.print("<th>Balance</th>");
                                    out.print("<td> <b>" +"&#8377;" +rs.getInt(11) + "</b></td>"); // Balance                           		

                                }
                                out.print("</table>");



                         }catch (SQLException e) { e.printStackTrace(); } %>
        </table>
        <% %>
            </table>
        </div>
          </div> 
    </main>
     <%@ page import="java.sql.*" %>
                <%@ page import="java.io.*" %>
                    <%@ page import="javax.servlet.*" %>
                        <%@ page import="g.*" %>                     
                        <%
                         } else {
             response.sendRedirect("index.html");
          }
       }%>
</body>

</html>