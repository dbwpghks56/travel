package travel.util;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class DateUtil { //minmin
	public static Date convertToDate(String strdate) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date d;
		Date d2 = null;
		try {
			d = sdf.parse(strdate);
			d2 = new Date(d.getTime());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return d2;
	}
}
