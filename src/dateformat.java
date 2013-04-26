import java.text.SimpleDateFormat;
import java.util.Date;

public class dateformat {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Date date = new Date();
		String sdf = new SimpleDateFormat("yyyy'年'MM'月'dd'日' HH:mm:ss")
				.format(date);
		System.out.print(sdf);

	}

}
