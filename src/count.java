import hibernate.MainDAO;


public class count {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		MainDAO maindao = new MainDAO();
		System.out.print(maindao.count());
	}

}
