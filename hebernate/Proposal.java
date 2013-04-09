package hebernate;

import java.util.Date;

/**
 * Proposal entity. @author MyEclipse Persistence Tools
 */

public class Proposal implements java.io.Serializable {

	// Fields

	private Integer proposalid;
	private Main main;
	private Integer studentid;
	private String thesistitle;
	private double proposalanalysis;
	private String proposalcontent;
	private String proposalfacility;
	private String proposalprocess;
	private Integer processnum;
	private boolean ischoosen;
	private String verification;
	private String isapproved;
	private Date startdata;
	private Date enddata;
	private String requirement;
	private String content;
	private String standerd;
	private String process;
	private String literature;

	// Constructors

	/** default constructor */
	public Proposal() {
	}

	/** minimal constructor */
	public Proposal(Main main, String thesistitle, boolean ischoosen,
			Date startdata, Date enddata, String requirement, String content,
			String standerd, String process, String literature) {
		this.main = main;
		this.thesistitle = thesistitle;
		this.ischoosen = ischoosen;
		this.startdata = startdata;
		this.enddata = enddata;
		this.requirement = requirement;
		this.content = content;
		this.standerd = standerd;
		this.process = process;
		this.literature = literature;
	}

	/** full constructor */
	public Proposal(Main main, Integer studentid, String thesistitle,
			double proposalanalysis, String proposalcontent,
			String proposalfacility, String proposalprocess,
			Integer processnum, boolean ischoosen, String verification,
			String isapproved, Date startdata, Date enddata,
			String requirement, String content, String standerd,
			String process, String literature) {
		this.main = main;
		this.studentid = studentid;
		this.thesistitle = thesistitle;
		this.proposalanalysis = proposalanalysis;
		this.proposalcontent = proposalcontent;
		this.proposalfacility = proposalfacility;
		this.proposalprocess = proposalprocess;
		this.processnum = processnum;
		this.ischoosen = ischoosen;
		this.verification = verification;
		this.isapproved = isapproved;
		this.startdata = startdata;
		this.enddata = enddata;
		this.requirement = requirement;
		this.content = content;
		this.standerd = standerd;
		this.process = process;
		this.literature = literature;
	}

	// Property accessors

	public Integer getProposalid() {
		return this.proposalid;
	}

	public void setProposalid(Integer proposalid) {
		this.proposalid = proposalid;
	}

	public Main getMain() {
		return this.main;
	}

	public void setMain(Main main) {
		this.main = main;
	}

	public Integer getStudentid() {
		return this.studentid;
	}

	public void setStudentid(Integer studentid) {
		this.studentid = studentid;
	}

	public String getThesistitle() {
		return this.thesistitle;
	}

	public void setThesistitle(String thesistitle) {
		this.thesistitle = thesistitle;
	}

	public double getProposalanalysis() {
		return this.proposalanalysis;
	}

	public void setProposalanalysis(double proposalanalysis) {
		this.proposalanalysis = proposalanalysis;
	}

	public String getProposalcontent() {
		return this.proposalcontent;
	}

	public void setProposalcontent(String proposalcontent) {
		this.proposalcontent = proposalcontent;
	}

	public String getProposalfacility() {
		return this.proposalfacility;
	}

	public void setProposalfacility(String proposalfacility) {
		this.proposalfacility = proposalfacility;
	}

	public String getProposalprocess() {
		return this.proposalprocess;
	}

	public void setProposalprocess(String proposalprocess) {
		this.proposalprocess = proposalprocess;
	}

	public Integer getProcessnum() {
		return this.processnum;
	}

	public void setProcessnum(Integer processnum) {
		this.processnum = processnum;
	}

	public boolean getIschoosen() {
		return this.ischoosen;
	}

	public void setIschoosen(boolean ischoosen) {
		this.ischoosen = ischoosen;
	}

	public String getVerification() {
		return this.verification;
	}

	public void setVerification(String verification) {
		this.verification = verification;
	}

	public String getIsapproved() {
		return this.isapproved;
	}

	public void setIsapproved(String isapproved) {
		this.isapproved = isapproved;
	}

	public Date getStartdata() {
		return this.startdata;
	}

	public void setStartdata(Date startdata) {
		this.startdata = startdata;
	}

	public Date getEnddata() {
		return this.enddata;
	}

	public void setEnddata(Date enddata) {
		this.enddata = enddata;
	}

	public String getRequirement() {
		return this.requirement;
	}

	public void setRequirement(String requirement) {
		this.requirement = requirement;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getStanderd() {
		return this.standerd;
	}

	public void setStanderd(String standerd) {
		this.standerd = standerd;
	}

	public String getProcess() {
		return this.process;
	}

	public void setProcess(String process) {
		this.process = process;
	}

	public String getLiterature() {
		return this.literature;
	}

	public void setLiterature(String literature) {
		this.literature = literature;
	}

}