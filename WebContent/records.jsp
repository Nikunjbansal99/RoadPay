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

    <main id="main-holder">
          <div class="logo"> <h1 id="login-header">User Records</h1></div>
       <div class="content2">
        
        <div class="details2" style="font-size:16px;">
      
        <%
         Connection con=GetCon.getCon();
        try{
        	String url ="jdbc:oracle:thin:@localhost:1521:XE";
        	con = DriverManager.getConnection(url, "system", "root");
        	
        	  PreparedStatement ps=con.prepareStatement("Select * from users");
        	  ResultSet rs=ps.executeQuery();        	
        	  
        	  //Statement stmt = con.createStatement();
        	//ResultSet rs = stmt.executeQuery ("SELECT * from trans where phone=8726421795");
        	
        	
        	if(rs.next()==false){
        		System.out.println("RESult set is empty");
        	}else{
        		
        		out.print("<table id='trans-table'>");
        		 out.print("<tr>"); 
    			 out.print("<th>Wallet Id </th>");
					 out.print("<th>First Name </th>");
					 out.print("<th>Last Name </th>");
					 out.print("<th>Address</th>");
					 out.print("<th>Contact No. </th>");
					 out.print("<th>Email </th>");
					 out.print("<th>Adhaar No. </th>");
					 out.print("<th>R/C </th>");
					 out.print("<th>occupation </th>");
					 out.print("<th>Vehicle Type </th>");
					 out.print("<th>Vehicle Num </th>");
					 out.print("<th>Balance </th>");
    			 out.print("</tr>");
        		do{
        			
        			System.out.println("Record present ");
        			
        			int walletid = rs.getInt("walletid");  
        			String firstname = rs.getString("firstname");
        			String lastname = rs.getString("lastname");
        			String address = rs.getString("address");
        			long phone = rs.getLong("phone");
        			String email = rs.getString("email");
        			long aadhar = rs.getLong("aadhar");
        			String rcnum = rs.getString("rcnum");
        			int balance = rs.getInt("balance");
                  	String vehicleType = rs.getString("VEHICLETYPE");
                  	String vehicleNum = rs.getString("VEHICLENUM");
                  	String occupation = rs.getString("OCCUPATION");
                  	
	     			 out.print("<tr>");
                     out.print("<td>" + walletid + "7890</td>");// Printing transid
                     out.print("<td>" + firstname + "</td>");// Printing timestmp
                     out.print("<td>" + lastname + "</td>");
                     out.print("<td>" + address + "</td>");
                     out.print("<td>" + phone + "</td>");
                     out.print("<td>" + email + "</td>");
                     out.print("<td>" + aadhar + "</td>");
                     out.print("<td>" + rcnum + "</td>");
                     out.print("<td>" + occupation + "</td>");
                     out.print("<td>" + vehicleType + "</td>");
                     out.print("<td>" + vehicleNum + "</td>");
                     out.print("<td>" + balance + "</td>");
                     out.print("</tr>");
                    
     			
        		}while(rs.next());
        		 
        		         	}
        	out.print("</table>");
        }catch (SQLException e) { e.printStackTrace(); }
       
        %>
     	</div>
             <div class="options2">
                         <button class="buttons"><a href="admin.jsp">Back</a></button>
             
            <button class="buttons"><a href="payment.jsp">Trigger Payment</a></button>
            <button class="buttons"><a href="adminTransaction.jsp">Transactions</a></button>
            
            
            
            <form action="Logout" method="post">
      <input class="buttons" type="submit" value="Logout">
   </form>
   
</div>

   </div>
      

    </main>
  	
  	<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="g.*" %> 

</body>

</html>