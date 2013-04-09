package hebernate;

/**
 * Management entity. @author MyEclipse Persistence Tools
 */

public class Management implements java.io.Serializable {

	// Fields

	private Integer managementid;
	private Main main;
	private Integer limitnum;

	// Constructors

	/** default constructor */
	public Management() {
	}

	/** minimal constructor */
	public Management(Main main) {
		this.main = main;
	}

	/** full constructor */
	public Management(Main main, Integer limitnum) {
		this.main = main;
		this.limitnum = limitnum;
	}

	// Property accessors

	public Integer getManagementid() {
		return this.managementid;
	}

	public void setManagementid(Integer managementid) {
		this.managementid = managementid;
	}

	public Main getMain() {
		return this.main;
	}

	public void setMain(Main main) {
		this.main = main;
	}

	public Integer getLimitnum() {
		return this.limitnum;
	}

	public void setLimitnum(Integer limitnum) {
		this.limitnum = limitnum;
	}

}