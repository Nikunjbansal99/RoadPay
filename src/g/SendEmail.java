package g;

import java.util.Properties;
import java.util.Random;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.*;
import javax.mail.internet.MimeMessage;

public class SendEmail {
    //generate verification code
    public String getRandom() {
        Random rnd = new Random();
        int number = rnd.nextInt(999999);
        return String.format("%06d", number);
    }
    
    public boolean sendEmail(Resetpass resetpass) {
        boolean test = false;

        String toEmail = resetpass.getEmail();
        final String fromEmail = "roadpayreply@gmail.com";
        final String password = "hello1234!";
        String host = "smtp.gmail.com";
        try {
        	Properties props = new Properties(); 
        	props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        	props.put("mail.smtp.host",host); 
        	props.put("mail.transport.protocol","smtp"); 
        	props.put("mail.smtp.auth","true"); 
        	props.put("mail.smtp.starttls.enable","true"); 
        	props.put("mail.user",fromEmail); 
        	props.put("mail.password",password);
        	props.put("mail.smtp.port", "587");
        	
            // your host email SMTP server details
           
 
            //get session to authenticate the host email address and password
            Session session = Session.getInstance(props, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            });

            //set email message details
            Message mess = new MimeMessage(session);

    		//set from email address
            mess.setFrom(new InternetAddress(fromEmail));
    		//set to email address or destination email address
            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
    		
    		//set email subject
            mess.setSubject("User Account Verification");
            
    		//set message text
            mess.setText("To Register Successfully. Please verify your account using this code: " + resetpass.getCode());
            //send the message
            Transport.send(mess);
            
            test=true;
            
        }catch (Exception e) {
            e.printStackTrace();
        }
        return test;
    }
        
        
    //send email to the user email
    public boolean sendEmail(User user) {
        boolean test = false;

        String toEmail = user.getEmail();
        final String fromEmail = "roadpayreply@gmail.com";
        final String password = "hello1234!";
        String host = "smtp.gmail.com";
        try {
        	Properties props = new Properties(); 
        	props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        	props.put("mail.smtp.host",host); 
        	props.put("mail.transport.protocol","smtp"); 
        	props.put("mail.smtp.auth","true"); 
        	props.put("mail.smtp.starttls.enable","true"); 
        	props.put("mail.user",fromEmail); 
        	props.put("mail.password",password);
        	props.put("mail.smtp.port", "587");
        	
            // your host email SMTP server details
           
 
            //get session to authenticate the host email address and password
            Session session = Session.getInstance(props, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            });

            //set email message details
            Message mess = new MimeMessage(session);

    		//set from email address
            mess.setFrom(new InternetAddress(fromEmail));
    		//set to email address or destination email address
            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
    		
    		//set email subject
            mess.setSubject("User Account Verification");
            
    		//set message text
            mess.setText("To Register Successfully. Please verify your account using this code: " + user.getCode());
            //send the message
            Transport.send(mess);
            
            test=true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }

        return test;
    }
}