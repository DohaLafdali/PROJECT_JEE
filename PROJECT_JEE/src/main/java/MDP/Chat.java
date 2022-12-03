package MDP;

import java.sql.Timestamp;

public class Chat {

	
	private int id;
	private String content;
	private int from_user;
	private int to_user;
	private Timestamp time_msg;
	
	
	
	public Chat() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Chat(int id, String content, int from_user, int to_user, Timestamp time_msg) {
		super();
		this.id = id;
		this.content = content;
		this.from_user = from_user;
		this.to_user = to_user;
		this.time_msg = time_msg;
	}

	public Chat( String content, int from_user, int to_user, Timestamp time_msg) {
		super();
		
		this.content = content;
		this.from_user = from_user;
		this.to_user = to_user;
		this.time_msg = time_msg;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getFrom_user() {
		return from_user;
	}
	public void setFrom_user(int from_user) {
		this.from_user = from_user;
	}
	public int getTo_user() {
		return to_user;
	}
	public void setTo_user(int to_user) {
		this.to_user = to_user;
	}
	public Timestamp getTime_msg() {
		return time_msg;
	}
	public void setTime_msg(Timestamp time_msg) {
		this.time_msg = time_msg;
	}
	
	@Override
	public String toString() {
		return "Chat [id=" + id + ", content=" + content + ", from_user=" + from_user + ", to_user=" + to_user
				+ ", time_msg=" + time_msg + "]";
	}
	
 
}
