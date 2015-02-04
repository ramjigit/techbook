package achauhan
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat
import java.util.Date;

class DateTagLib {

	static namespace = "postDate"

	/**
	 * @param date
	 * @return : return implemented nice date.
	 */
	public static String getNiceDate(Date date) {
		String modifiedDate
		try {
			modifiedDate = new SimpleDateFormat("EEE, d MMM yyyy 'at' h:mma z").format(date)
		} catch (ParseException e) {
			System.out.println("ERROR: Cannot Format \"" + date + "\"")
		}
		try {
			def now = new Date()
			def diff = Math.abs(now.getTime() - date.getTime())
			long second = 1000
			long minute = 1000 * 60
			long hour = minute * 60
			long day = hour * 24
			long month = day * 30
			long year = month * 12
			def niceTime = ""
			long timeCalculation = 0L;

			timeCalculation = Math.floor(diff / year)
			if (timeCalculation > 0) {
				niceTime += timeCalculation + " year" + (timeCalculation > 1 ? "s " : " ")
				diff = diff % year
				return niceTime+" ago on "+ modifiedDate
			}

			timeCalculation = Math.floor(diff / month)
			if (timeCalculation > 0) {
				niceTime += timeCalculation + " month" + (timeCalculation > 1 ? "s " : " ")
				diff = diff % month
				return niceTime+" ago on "+ modifiedDate
			}

			timeCalculation = Math.floor(diff / day)
			if (timeCalculation > 0) {
				niceTime += timeCalculation + " day" + (timeCalculation > 1 ? "s " : " ")
				diff = diff % day
				return niceTime+" ago on "+ modifiedDate
			}

			timeCalculation = Math.floor(diff / hour)
			if (timeCalculation > 0) {
				niceTime += timeCalculation + " hr" + (timeCalculation > 1 ? "s " : " ")
				diff = diff % hour
				return niceTime+" ago on "+ modifiedDate
			}

			timeCalculation = Math.floor(diff / minute)
			if (timeCalculation > 0) {
				niceTime += timeCalculation + " min" + (timeCalculation > 1 ? "s " : " ")
				diff = diff % minute
				return niceTime+" ago on "+ modifiedDate
			}
			timeCalculation = Math.floor(diff / second)
			if (timeCalculation > 0) {
				niceTime += timeCalculation + " sec" + (timeCalculation > 1 ? "s " : " ")
				diff = diff % minute
				return niceTime+" ago on "+ modifiedDate
			}

			if (niceTime.length() == 0) {
				niceTime = "Right now"
			}
			return niceTime
		} catch (Exception e) {
			println ("Date formation error - please check DATE TAGLIB");
			e.printStackTrace()
		}
	}

	// retun only date in the format "EEE, d MMM yyyy"
	public String getOnlyDate(Date date){
		String modifiedDate
		try {
			modifiedDate = new SimpleDateFormat("EEE, d MMM yyyy").format(date)
		} catch (ParseException e) {
			System.out.println("ERROR: Cannot Format \"" + date + "\"")
		}
		return modifiedDate
	}

	public String getOnlyTime(Date date){
		String modifiedDate
		try {
			modifiedDate = new SimpleDateFormat("h:mma z").format(date)
		} catch (ParseException e) {
			System.out.println("ERROR: Cannot Format \"" + date + "\"")
		}
		return modifiedDate
	}

	def getDate = { attrs ->
		def date = attrs.date
		out << getOnlyDate(date)
	}

	def getTime = { attrs ->
		def date = attrs.date
		out << getOnlyTime(date)
	}
	
	def dateFromNow = {attrs ->
		def date = attrs.date
		out << getNiceDate(date)
	}
}