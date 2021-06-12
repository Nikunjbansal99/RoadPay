<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>RoadPay</title>
    <link href="css/style.css" rel="stylesheet" type="text/css">
  
</head>
<body>

    <main id="main-holder">
        <div class="logo"></div>
        <h1 id='trans-pg'>Transactions</h1>

        <%
        
        long phone = (Long)session.getAttribute("phone");			//Retriving from session
        
        Connection con=GetCon.getCon();
       
       try{
        	String url ="jdbc:oracle:thin:@localhost:1521:XE";
        	con = DriverManager.getConnection(url, "system", "root");
        	PreparedStatement ps=con.prepareStatement("Select * from trans where phone=?");
        	ps.setLong(1,phone);
        	ResultSet rs=ps.executeQuery();
 	
        	
        	int cnt=0;												//Counter to display recent 5 transactions only
        	
        	if(rs.next()==false){								   //If no transactions have been made just print. else display recent transactions
        		System.out.println("RESult set is empty");
        	}
        	else{       		
         			 out.print("<table id='trans-table'>");
        			 out.print("<tr>"); 
    				 out.print("<th>Transaction Id </th>");
					 out.print("<th>Transaction time </th>");
					 out.print("<th>Debit </th>");
					 out.print("<th>Credit </th>");
					 out.print("<th>Balance </th>");
    			 	 out.print("</tr>");
        		do{												//We are using do while instead of While because when we are checking if ResultSet is empty or not, the cursor moves to the first row which will be missed in while loop 
        			if(cnt>4){									//Counter that helps to display only 5 recent transactions
        				break;
        			}
        			      			
        			int transid = rs.getInt("transid");        			
        			Timestamp timestmp = rs.getTimestamp("time");      			
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
                                     
 				    cnt++;      			
        		}while(rs.next());
        		 
        		         	}
        	out.print("</table>");
        }catch (SQLException e) { e.printStackTrace(); }
       
      
    
  
        %>
     	
        
         <button class="buttons-trans"><a href="dashboard.jsp">Dashboard</a></button>
          <form action="Logout" method="post">
      		<input class="buttons-trans-lg" type="submit" value="Logout">
   		  </form>
        
        </div>

    </main>
  	
  	<%@ page import="java.sql.*"%>
	<%@ page import="java.io.*" %>
	<%@ page import="javax.servlet.*"%>
	<%@ page import="g.*" %> 

</body>

</html>  