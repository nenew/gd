package hibernate;

import java.util.HashSet;
import java.util.Set;

/**
 * Main entity. @author MyEclipse Persistence Tools
 */

public class Main implements java.io.Serializable {

	// Fields

	private Integer id;
	private String num;
	private String name;
	private Integer priority;
	private String password;
	private String cookie;
	private boolean isprofile;
	private boolean issecurity;
	private Set securities = new HashSet(0);
	private Set processes = new HashSet(0);
	private Set proposals = new HashSet(0);
	private Set managements = new HashSet(0);
	private Set thesises = new HashSet(0);
	private Set profiles = new HashSet(0);
	private Set messages = new HashSet(0);

	// Constructors

	/** default constructor */
	public Main() {
	}

	/** minimal constructor */
	public Main(String num, String name, Integer priority, String password,
			boolean isprofile, boolean issecurity) {
		this.num = num;
		this.name = name;
		this.priority = priority;
		this.password = password;
		this.isprofile = isprofile;
		this.issecurity = issecurity;
	}

	/** full constructor */
	public Main(String num, String name, Integer priority, String password,
			String cookie, boolean isprofile, boolean issecurity,
			Set securities, Set processes, Set proposals, Set managements,
			Set thesises, Set profiles, Set messages) {
		this.num = num;
		this.name = name;
		this.priority = priority;
		this.password = password;
		this.cookie = cookie;
		this.isprofile = isprofile;
		this.issecurity = issecurity;
		this.securities = securities;
		this.processes = processes;
		this.proposals = proposals;
		this.managements = managements;
		this.thesises = thesises;
		this.profiles = profiles;
		this.messages = messages;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNum() {
		return this.num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getPriority() {
		return this.priority;
	}

	public void setPriority(Integer priority) {
		this.priority = priority;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCookie() {
		return this.cookie;
	}

	public void setCookie(String cookie) {
		this.cookie = cookie;
	}

	public boolean getIsprofile() {
		return this.isprofile;
	}

	public void setIsprofile(boolean isprofile) {
		this.isprofile = isprofile;
	}

	public boolean getIssecurity() {
		return this.issecurity;
	}

	public void setIssecurity(boolean issecurity) {
		this.issecurity = issecurity;
	}

	public Set getSecurities() {
		return this.securities;
	}

	public void setSecurities(Set securities) {
		this.securities = securities;
	}

	public Set getProcesses() {
		return this.processes;
	}

	public void setProcesses(Set processes) {
		this.processes = processes;
	}

	public Set getProposals() {
		return this.proposals;
	}

	public void setProposals(Set proposals) {
		this.proposals = proposals;
	}

	public Set getManagements() {
		return this.managements;
	}

	public void setManagements(Set managements) {
		this.managements = managements;
	}

	public Set getThesises() {
		return this.thesises;
	}

	public void setThesises(Set thesises) {
		this.thesises = thesises;
	}

	public Set getProfiles() {
		return this.profiles;
	}

	public void setProfiles(Set profiles) {
		this.profiles = profiles;
	}

	public Set getMessages() {
		return this.messages;
	}

	public void setMessages(Set messages) {
		this.messages = messages;
	}

}