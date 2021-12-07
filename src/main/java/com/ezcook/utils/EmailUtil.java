package com.ezcook.utils;

import com.ezcook.entities.Email;

import java.util.Date;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.UnsupportedEncodingException;
public class EmailUtil {
    public static void send(Email email) throws Exception{

        //Get properties object
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "587");
        //Get Session
        Authenticator authenticator = new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(email.getFrom(), email.getFromPassword());
            }
        };
        Session session = Session.getInstance(props, authenticator);
        try {
            //Create a new e-mail message
            Message msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(email.getFrom()));
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email.getTo()));
            msg.setSubject(email.getSubject());
            msg.setContent(email.getContent(),"text/html; charset=utf-8");
            //Send the e-mail
            Transport.send(msg);
        }catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}

