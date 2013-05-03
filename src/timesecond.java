import java.text.ParseException;
import java.text.SimpleDateFormat;


public class timesecond {

	/**
	 * @param args
	 * @throws Exception 
	 */
	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		  SimpleDateFormat myFormatter = new SimpleDateFormat("yyyy-MM-dd");

		   java.util.Date date= myFormatter.parse("2013-05-02"); 

		   java.util.Date mydate= myFormatter.parse("1970-01-01");

		   long  day=(date.getTime()-mydate.getTime());

		   System.out.println(day);

		   System.out.println("<br>"); 	}

}
