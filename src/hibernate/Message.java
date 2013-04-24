package hibernate;

import java.util.Date;

/**
 * Message entity. @author MyEclipse Persistence Tools
 */

public class Message implements java.io.Serializable {

	// Fields

	private Integer msgnum;
	private Main main;
	private Integer toid;
	private String content;
	private Date sendtime;
	private boolean isread;

	// Constructors

	/** default constructor */
	public Message() {
	}

	/** full constructor */
	public Message(Main main, Integer toid, String content, Date sendtime,
			boolean isread) {
		this.main = main;
		this.toid = toid;
		this.content = content;
		this.sendtime = sendtime;
		this.isread = isread;
	}

	// Property accessors

	public Integer getMsgnum() {
		return this.msgnum;
	}

	public void setMsgnum(Integer msgnum) {
		this.msgnum = msgnum;
	}

	public Main getMain() {
		return this.main;
	}

	public void setMain(Main main) {
		this.main = main;
	}

	public Integer getToid() {
		return this.toid;
	}

	public void setToid(Integer toid) {
		this.toid = toid;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getSendtime() {
		return this.sendtime;
	}

	public void setSendtime(Date sendtime) {
		this.sendtime = sendtime;
	}

	public boolean getIsread() {
		return this.isread;
	}

	public void setIsread(boolean isread) {
		this.isread = isread;
	}

}