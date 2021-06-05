package g;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
public class verifyLogin1 {

public static boolean checkLogin(long phone,String password){
	boolean status=false;
	Connection con=GetCon.getCon();
	try {
		System.out.println("connection formed");
		
		//PreparedStatement ps=con.prepareStatement("Select * from MAILCASTINGUSER where EMAILADD = ? and PASSWORD =?");
		PreparedStatement ps=con.prepareStatement("Select * from users where phone=? and password =?");
		ps.setLong(1,phone);
		ps.setString(2,password);
		
		ResultSet rs=ps.executeQuery();

		status=rs.next();
		System.out.println(status);

	} catch (SQLException e) {
		e.printStackTrace();
	}
	return status;
}
}

