package hebernate;

import java.util.*;

import org.hibernate.Transaction;

public class Daotest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		MainDAO md = new MainDAO();
		Main m = new Main();
		// List<?> l = (List<?>) md.findById(1);
		// Iterator<?> i = l.iterator();
		// while(i.hasNext()){
		// m=(Main) i.next();
		m = (Main) md.findById(1);
		System.out.print("输出姓名：" + m.getName() + "\n输出密码：" + m.getPassword()
				+ "\n");
		m.setPassword("654321");
		m.setCookie("sfsfsfsd");
		System.out.print("输出姓名：" + m.getName() + "\n输出密码：" + m.getPassword()
				+ "\n");
		md.attachClean(m);
		Transaction tx = md.getSession().beginTransaction();
		tx.commit();
		md.getSession().close();
	}
}
