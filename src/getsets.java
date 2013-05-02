import hibernate.Management;
import hibernate.Profile;
import hibernate.ProfileDAO;

import java.util.Iterator;

public class getsets {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ProfileDAO profiledao = new ProfileDAO();
		Profile profile = new Profile();
		Iterator<?> iterator = profiledao.page("department", "电子信息工程","20")
				.iterator();
		while (iterator.hasNext()) {
			profile = (Profile) iterator.next();
			if (profile.getMain().getManagements().isEmpty() == true) {
				System.out.print(profile.getMain().getName() + "无");
			} else {
				Iterator<?> man = profile.getMain().getManagements().iterator();
				Management management = (Management) man.next();
				System.out.print("i hava management："+management.getLimitnum()+management.getPermission());
			}
		}

	}

}
