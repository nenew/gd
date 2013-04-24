package hibernate;

/**
 * Security entity. @author MyEclipse Persistence Tools
 */

public class Security implements java.io.Serializable {

	// Fields

	private Integer securityid;
	private Main main;
	private String question;
	private byte[] answer;
	private Integer idcard;

	// Constructors

	/** default constructor */
	public Security() {
	}

	/** minimal constructor */
	public Security(Main main) {
		this.main = main;
	}

	/** full constructor */
	public Security(Main main, String question, byte[] answer, Integer idcard) {
		this.main = main;
		this.question = question;
		this.answer = answer;
		this.idcard = idcard;
	}

	// Property accessors

	public Integer getSecurityid() {
		return this.securityid;
	}

	public void setSecurityid(Integer securityid) {
		this.securityid = securityid;
	}

	public Main getMain() {
		return this.main;
	}

	public void setMain(Main main) {
		this.main = main;
	}

	public String getQuestion() {
		return this.question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public byte[] getAnswer() {
		return this.answer;
	}

	public void setAnswer(byte[] answer) {
		this.answer = answer;
	}

	public Integer getIdcard() {
		return this.idcard;
	}

	public void setIdcard(Integer idcard) {
		this.idcard = idcard;
	}

}