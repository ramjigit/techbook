package achauhan.mail

import org.codehaus.groovy.grails.commons.GrailsApplication;

class EmailService {

	private EmailBean email = new EmailBean();;

	/**
	 * 
	 * @param to
	 * @param subject
	 * @param body
	 * @return
	 */
	def sendMail(String to, String subject, String body){
		email.sendMail(to, subject, body);
	}
	/**
	 * @param to
	 * @return
	 */
	def sendWelcomeMail(String to, String user){
		email.sendWelcomeMail(to, user);
	}
}
