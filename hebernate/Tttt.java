package hebernate;

import java.util.Iterator;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class Tttt {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Session s = HibernateSessionFactory.getSession();
		Transaction d = s.beginTransaction();
		Query query = s.createQuery("from Profile p where p.main.id = '5'");
		Query query2 = s.createQuery("from Main where id = '1'");

		Profile o = new Profile();
		Profile p = new Profile();
		Main m = new Main();
		Iterator<?> i = query.iterate();

		while (i.hasNext()) {
			o = (Profile) i.next();
		}
		Iterator<?> i2 = query2.iterate();
		while (i2.hasNext()) {
			m = (Main) i2.next();
		}
		
		p=(Profile) s.get(Profile.class, 8);
		if(p.equals(o)) System.out.print("相同");
		o.setEmail("what@whereru.com");
		s.saveOrUpdate(o);
		d.commit();
		s.close();
		
	}

}
