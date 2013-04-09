package hebernate;

/**
 * Thesis entity. @author MyEclipse Persistence Tools
 */

public class Thesis implements java.io.Serializable {

	// Fields

	private Integer thesisid;
	private Main main;
	private boolean isuploaded;
	private String veryfication;
	private String downloadpath;

	// Constructors

	/** default constructor */
	public Thesis() {
	}

	/** minimal constructor */
	public Thesis(Main main, boolean isuploaded) {
		this.main = main;
		this.isuploaded = isuploaded;
	}

	/** full constructor */
	public Thesis(Main main, boolean isuploaded, String veryfication,
			String downloadpath) {
		this.main = main;
		this.isuploaded = isuploaded;
		this.veryfication = veryfication;
		this.downloadpath = downloadpath;
	}

	// Property accessors

	public Integer getThesisid() {
		return this.thesisid;
	}

	public void setThesisid(Integer thesisid) {
		this.thesisid = thesisid;
	}

	public Main getMain() {
		return this.main;
	}

	public void setMain(Main main) {
		this.main = main;
	}

	public boolean getIsuploaded() {
		return this.isuploaded;
	}

	public void setIsuploaded(boolean isuploaded) {
		this.isuploaded = isuploaded;
	}

	public String getVeryfication() {
		return this.veryfication;
	}

	public void setVeryfication(String veryfication) {
		this.veryfication = veryfication;
	}

	public String getDownloadpath() {
		return this.downloadpath;
	}

	public void setDownloadpath(String downloadpath) {
		this.downloadpath = downloadpath;
	}

}