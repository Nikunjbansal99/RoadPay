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
    
    
  //For Password Reset Verification
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
            mess.setSubject("Recover Account");
            
    		//set message text
            mess.setText("To Reset Password. Please verify your account using this code: " + resetpass.getCode());
            //send the message
            Transport.send(mess);
            
            test=true;
            
        }catch (Exception e) {
            e.printStackTrace();
        }
        return test;
    }
        
        
    //For User Account Verification
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

    
    //For Credit Transactions
    public boolean sendEmail(CreditTrans credittrans) {
        boolean test = false;

        String toEmail = credittrans.getEmail();
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
            mess.setSubject("Rs "+credittrans.getCredit()+" Added Successfully");
            
    		//set message text
            mess.setText("You Successfully added the Rs "+credittrans.getCredit()+" Money in a wallet linked to " + credittrans.getPhone() + ". Updated Balance is Rs " + credittrans.getbalance() + ". Having Transaction ID: "+ credittrans.gettransid());
            //send the message
            Transport.send(mess);
            
            test=true;
            
        }catch (Exception e) {
            e.printStackTrace();
        }
        return test;
    }
    
    
    //For Debit Transactions
    public boolean sendEmail(DebitTrans debittrans) {
        boolean test = false;

        String toEmail = debittrans.getEmail();
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
            mess.setSubject("You paid Rs "+debittrans.getdebit()+" Successfully");
            
    		//set message text
            mess.setText("You Successfully paid the Rs "+debittrans.getdebit()+" towards your toll fees. Having Transaction ID: "+ debittrans.gettransid() + ". Updated balance of a wallet linked to " + debittrans.getPhone() + " is Rs " + debittrans.getbalance());
            //send the message
            Transport.send(mess);
            
            test=true;
            
        }catch (Exception e) {
            e.printStackTrace();
        }
        return test;
    }
    
    
    // For Failed Transactions
    public boolean sendEmail(FailedTrans failedtrans) {
        boolean test = false;

        String toEmail = failedtrans.getEmail();
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
            mess.setSubject("Transaction Failed! Insufficient Balance");
            
    		//set message text
            mess.setText("Your Transaction having ID: "+ failedtrans.gettransid() + " of Rs " + failedtrans.getdebit() + ". Failed due to insufficient balance in a wallet linked to " + failedtrans.getPhone() + ". Current Balance is Rs " + failedtrans.getbalance());
            //send the message
            Transport.send(mess);
            
            test=true;
            
        }catch (Exception e) {
            e.printStackTrace();
        }
        return test;
    }
}