import hibernate.MainDAO;
import hibernate.Profile;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;

public class multichoose {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		MainDAO maindao = new MainDAO();
		String queryString = "select p from Profile p,Management m where m.main= p.main and p.title != 'student' and m.permission = true";
		Query queryObject = maindao.getSession().createQuery(queryString);
		List<?> s = (List<?>) queryObject.list();
		Iterator<?> i = s.iterator();
		while(i.hasNext()){
			Profile profile =(Profile)i.next();
			System.out.print(profile.getMain().getId()+"\n");
		}
	}

}
