package hebernate;

/**
 * Profile entity. @author MyEclipse Persistence Tools
 */

public class Profile implements java.io.Serializable {

	// Fields

	private Integer profileid;
	private Main main;
	private String department;
	private String grade;
	private String email;
	private String phonenum;
	private String title;
	private boolean isfilled;

	// Constructors

	/** default constructor */
	public Profile() {
	}

	/** minimal constructor */
	public Profile(Main main, boolean isfilled) {
		this.main = main;
		this.isfilled = isfilled;
	}

	/** full constructor */
	public Profile(Main main, String department, String grade, String email,
			String phonenum, String title, boolean isfilled) {
		this.main = main;
		this.department = department;
		this.grade = grade;
		this.email = email;
		this.phonenum = phonenum;
		this.title = title;
		this.isfilled = isfilled;
	}

	// Property accessors

	public Integer getProfileid() {
		return this.profileid;
	}

	public void setProfileid(Integer profileid) {
		this.profileid = profileid;
	}

	public Main getMain() {
		return this.main;
	}

	public void setMain(Main main) {
		this.main = main;
	}

	public String getDepartment() {
		return this.department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getGrade() {
		return this.grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhonenum() {
		return this.phonenum;
	}

	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public boolean getIsfilled() {
		return this.isfilled;
	}

	public void setIsfilled(boolean isfilled) {
		this.isfilled = isfilled;
	}

}