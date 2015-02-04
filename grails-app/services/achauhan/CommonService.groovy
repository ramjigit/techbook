package achauhan

import java.security.SecureRandom;
import java.util.Random;

class CommonService {

	static final String RANDOM_STRING = "0123456789AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz";
	static SecureRandom rnd = new SecureRandom();

	String randomString(int len) {
		StringBuilder sb = new StringBuilder(len);
		for (int i = 0; i < len; i++)
			sb.append(RANDOM_STRING.charAt(rnd.nextInt(RANDOM_STRING.length())));
		return sb.toString();
	}
}