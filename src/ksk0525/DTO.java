package ksk0525;

public class DTO {
	private String title;
	private String userID;
	private String regdate;
	private String Content;
	
	public DTO(String title,String userID, String regdate,String Content) {
		super();
		this.title = title;
		this.userID = userID;
		this.regdate = regdate;
		this.Content = Content;

	}
	public String gettitle() {
		return title;
	}
	public void settitle(String title) {
		this.title = title;
	}
	public String getuserID() {
		return userID;
	}
	public void setuserID(String userID) {
		this.userID = userID;
	}
	
	public String getregdate() {
		return regdate;
	}
	public void setregdate(String regdate) {
		this.regdate = regdate;
	}
	public String getContent() {
		return Content;
	}
	public void setContent(String Content) {
		this.Content = Content;
	}

}
