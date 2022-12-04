package Models;

public class Commentaire {
	private int id;
	private String text;
	private int post;
	private int user;
	
	
	public Commentaire() {
		super();
	}

	public Commentaire(int id, String text,int post,int user) {
		super();
		this.id = id;
		this.text = text;
		this.post=post;
		this.user=user;
	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getText() {
		return text;
	}
	
	public void setText(String text) {
		this.text = text;
	}

	public int getPost() {
		return post;
	}

	public void setPost(int post) {
		this.post = post;
	}

	
	public int getUser() {
		return user;
	}

	public void setUser(int user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "Commentaire [id=" + id + ", text=" + text + ", post=" + post + "]";
	}
	
	
}
