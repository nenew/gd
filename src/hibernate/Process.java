package hibernate;

/**
 * Process entity. @author MyEclipse Persistence Tools
 */

public class Process implements java.io.Serializable {

	// Fields

	private Integer processid;
	private Main main;
	private Integer plannum;
	private Integer finishnum;
	private boolean isplaned;

	// Constructors

	/** default constructor */
	public Process() {
	}

	/** minimal constructor */
	public Process(Main main, boolean isplaned) {
		this.main = main;
		this.isplaned = isplaned;
	}

	/** full constructor */
	public Process(Main main, Integer plannum, Integer finishnum,
			boolean isplaned) {
		this.main = main;
		this.plannum = plannum;
		this.finishnum = finishnum;
		this.isplaned = isplaned;
	}

	// Property accessors

	public Integer getProcessid() {
		return this.processid;
	}

	public void setProcessid(Integer processid) {
		this.processid = processid;
	}

	public Main getMain() {
		return this.main;
	}

	public void setMain(Main main) {
		this.main = main;
	}

	public Integer getPlannum() {
		return this.plannum;
	}

	public void setPlannum(Integer plannum) {
		this.plannum = plannum;
	}

	public Integer getFinishnum() {
		return this.finishnum;
	}

	public void setFinishnum(Integer finishnum) {
		this.finishnum = finishnum;
	}

	public boolean getIsplaned() {
		return this.isplaned;
	}

	public void setIsplaned(boolean isplaned) {
		this.isplaned = isplaned;
	}

}