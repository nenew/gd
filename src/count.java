import java.util.List;

import javassist.bytecode.Descriptor.Iterator;

import hibernate.MainDAO;
import hibernate.Profile;
import hibernate.ProfileDAO;


public class count {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		MainDAO maindao = new MainDAO();
		System.out.print(maindao.count()+"\n");
		ProfileDAO profiledao = new ProfileDAO();
		Profile profile = new Profile();
		System.out.print(profiledao.count("department", "电子信息工程")+"\n");
		List<?> l =profiledao.page("department", "电子信息工程","0");
		java.util.Iterator<?> i = l.iterator();
		while(i.hasNext()){
			profile=(Profile)i.next();
			System.out.print("\n"+profile.getProfileid()+"\n");
			
		}
	}

}
