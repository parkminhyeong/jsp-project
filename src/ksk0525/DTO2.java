package ksk0525;

public class DTO2 {
	private String title;
	private String userID;
	private String fileName;
	private String Content;
	private String regdate;
	
	public DTO2(String title,String userID, String fileName, String Content, String regdate) {
		super();

		this.title = title;
		this.userID = userID;
		this.fileName = fileName;
		this.Content = Content;
		this.regdate = regdate;
		
	}
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	public String getContent() {
		return Content;
	}

	public void setContent(String Content) {
		this.Content = Content;
	}
	
	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

}
