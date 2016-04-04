package services.mail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;

import com.sun.xml.internal.messaging.saaj.packaging.mime.MessagingException;

@Service("mailService")

public class MailService {
	@Autowired
    private MailSender mailSender;
	
public void sendMail(String from, String to, String subject, String body) throws MessagingException {
        
        SimpleMailMessage message = new SimpleMailMessage();
         
        message.setFrom(from);
        message.setTo(to);
        message.setSubject(subject);
        message.setText(body);
        mailSender.send(message);
        
    }

public MailSender getMailSender() {
	return mailSender;
}

public void setMailSender(MailSender mailSender) {
	this.mailSender = mailSender;
}



}
