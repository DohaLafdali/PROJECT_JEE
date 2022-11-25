package MDP;

public class Like {
    int id;
    int user;
    int post;
	public Like() {
		// TODO Auto-generated constructor stub
	}
	public Like(int id, int user, int post) {
		super();
		this.id = id;
		this.user = user;
		this.post = post;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUser() {
		return user;
	}
	public void setUser(int user) {
		this.user = user;
	}
	public int getPost() {
		return post;
	}
	public void setPost(int post) {
		this.post = post;
	}


}
