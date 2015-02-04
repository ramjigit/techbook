package achauhan.mail;

import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class EmailBean {

	private int port = 587;
	private String host = "smtp.techbook.me";
	private String from = "info@techbook.me";
	private boolean auth = true;
	private String username = "info@techbook.me";
	private String password = "87F6]7h8702aV~z";
	private Protocol protocol = Protocol.SMTPS;

	public void sendWelcomeMail(String to, String user) {
		Properties props = new Properties();
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		switch (protocol) {
		case SMTPS:
			props.put("mail.smtp.ssl.enable", false);
			break;
		case TLS:
			props.put("mail.smtp.starttls.enable", true);
			break;
		}
		Authenticator authenticator = null;
		if (auth) {
			props.put("mail.smtp.auth", true);
			authenticator = new Authenticator() {
				private PasswordAuthentication pass = new PasswordAuthentication(
						username, password);

				@Override
				public PasswordAuthentication getPasswordAuthentication() {
					return pass;
				}
			};
		}
		Session session = Session.getInstance(props, authenticator);
		MimeMessage message = new MimeMessage(session);
		try {
			message.setFrom(new InternetAddress(from));
			InternetAddress[] address = { new InternetAddress(to) };
			message.setRecipients(Message.RecipientType.TO, address);
			message.setSubject("Welcome to techbook, " + user);
			message.setSentDate(new Date());

			Multipart multipart = new MimeMultipart("alternative");
			MimeBodyPart textPart = new MimeBodyPart();
			String textContent = "Thank you for being the part of techbook family /";
			textPart.setText(textContent);

			MimeBodyPart htmlPart = new MimeBodyPart();
			String htmlContent = "<div style='float: left; width: 100%; margin: 0 1em 1em 0; padding: 1em; min-height: 24em; background: #b6deff;'>"
					+ "<a href='http://www.techbook.me'>"
					+ "</a> <span>Thank you very much for being the part of techbook family.</span>"
					+ "<h3>What is techbook:</h3><p>Common place to write tutorial on different technologies like hadoop, "
					+ "java, mongodb, neo4j, .net etc and share your knowledge with peoples.</p>"
					+ "Let's learn and share with people. Get start: <a href='http://techbook.me/' target='_new'>http://techbook.me/</a>"
					+ "<hr><strong>information</strong> <a href='mailto:info@techbook.com'>info@techbook.com</a>"
					+ "<br><strong>achauhan</strong> <a href='mailto:achauhan@techbook.com'>achauhan@techbook.com</a>"
					+ "<br><br><br><h4>Thanks & Regards</h4><br>techbook team";

			htmlPart.setContent(htmlContent, "text/html");
			multipart.addBodyPart(textPart);
			multipart.addBodyPart(htmlPart);
			message.setContent(multipart);
			Transport.send(message);

		} catch (MessagingException ex) {
			ex.printStackTrace();
		}

	}

	public void sendMail(String to, String subject, String body) {
		Properties props = new Properties();
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		switch (protocol) {
		case SMTPS:
			props.put("mail.smtp.ssl.enable", false);
			break;
		case TLS:
			props.put("mail.smtp.starttls.enable", true);
			break;
		}
		Authenticator authenticator = null;
		if (auth) {
			props.put("mail.smtp.auth", true);
			authenticator = new Authenticator() {
				private PasswordAuthentication pa = new PasswordAuthentication(
						username, password);

				@Override
				public PasswordAuthentication getPasswordAuthentication() {
					return pa;
				}
			};
		}
		Session session = Session.getInstance(props, authenticator);
		MimeMessage message = new MimeMessage(session);
		try {
			message.setFrom(new InternetAddress(from));
			InternetAddress[] address = { new InternetAddress(to) };
			message.setRecipients(Message.RecipientType.TO, address);
			message.setSubject(subject);
			message.setSentDate(new Date());
			message.setText(body);
			Transport.send(message);
		} catch (MessagingException ex) {
			ex.printStackTrace();
		}
	}
}