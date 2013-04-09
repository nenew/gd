package hebernate;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class Test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Main a = new Main();

		Session s = HibernateSessionFactory.getSession();
		Transaction d = s.beginTransaction();
		Query b = s.createQuery("From Main m where m.id = 1");
		Iterator<?> i = b.iterate();
		while (i.hasNext()) {
			a = (Main) i.next();
		}

		a=(Main) s.get(Main.class,1);
 
		Profile p = new Profile();
		p.setDepartment("dianxin0901");
		p.setEmail("x@xxx.com");
		p.setGrade("6");
		p.setIsfilled(true);
		p.setPhonenum("13456789012");
		p.setTitle("student");

		p.setMain(a);


		s.saveOrUpdate(p);

		d.commit();

		s.close();

	}

}
