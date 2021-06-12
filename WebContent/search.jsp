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
        <div class="logo"></div>
             <div class="logo"> <h1 id="login-header">Transactions</h1></div>
       <div class="content2">
        
        <div class="details2">


       
     
        
        <%
        
        String phonest=request.getParameter("phone"); 
     long phone=Long.parseLong(phonest);
             
        Connection con=GetCon.getCon();
       

        
        
        
        try{
        	String url ="jdbc:oracle:thin:@localhost:1521:XE";
        	con = DriverManager.getConnection(url, "system", "root");
        	  PreparedStatement ps=con.prepareStatement("Select * from trans where phone=? ORDER BY time DESC");
        	 ps.setLong(1,phone);
        	  ResultSet rs=ps.executeQuery();
        	
        	  
        	  //Statement stmt = con.createStatement();
        	//ResultSet rs = stmt.executeQuery ("SELECT * from trans where phone=8726421795");
        	
        	
        	
        	
        	
        	
        	
        	
        	
        	
        	if(rs.next()==false){
        		System.out.println("RESult set is empty");
        	}else{
        		
        		out.print("<table id='trans-table'>");
        		 out.print("<tr>"); 
    			 out.print("<th>Transaction Id </th>");
					 out.print("<th>Transaction time </th>");
					 out.print("<th>Debit </th>");
					 out.print("<th>Credit </th>");
					 out.print("<th>Balance </th>");
    			 out.print("</tr>");
        		do{
        			//int transid = rs.getInt("transid");        			
        			//long phonee = rs.getLong("phone");     
        			//System.out.println("Record present "+ transid);
        			//System.out.println("Record present " + phonee);
        			//out.print("<td>" + transid + "</td>");// Printing transid
                   // out.print("<td>" + phonee + "</td>");// Printing timestmp		
        			System.out.println("Record present ");
        			
        			int transid = rs.getInt("transid");        			
        			Timestamp timestmp = rs.getTimestamp("time");
        			//long phon = rs.getLong("phone");
        			int debit = rs.getInt("debit");
        			int credit = rs.getInt("credit");
        			int balance = rs.getInt("balance");
                    
                    
                    
        			
                    
        			 out.print("<tr>");
                     out.print("<td> trno" + transid + "7890</td>");// Printing transid
                     out.print("<td>" + timestmp + "</td>");// Printing timestmp
                     out.print("<td> &#8377;" + debit + "</td>");// Printing debit
                     out.print("<td> &#8377;" + credit + "</td>");// Printing credit
                     out.print("<td> &#8377;" + balance + "</td>");// Printing balance
                     out.print("</tr>");
                    
                    
 				
        			
        		}while(rs.next());
        		 
        		         	}
        	out.print("</table>");
        }catch (SQLException e) { e.printStackTrace(); }
       
      
    
  
        %>
     	
        
       </div>
     	
             <div class="options2">
                         <button class="buttons"><a href="adminTransaction.jsp">Back</a></button>
             
            <button class="buttons"><a href="payment.jsp">Trigger Payment</a></button>
            <button class="buttons"><a href="records.jsp">User Records</a></button>
            
            
            
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