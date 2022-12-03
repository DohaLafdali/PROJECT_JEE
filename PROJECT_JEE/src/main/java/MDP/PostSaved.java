package MDP;

public class PostSaved {
   int id;
   int id_post;
   int id_user;
	public PostSaved() {
		// TODO Auto-generated constructor stub
	}
	public PostSaved(int id, int id_post, int id_user) {
		super();
		this.id = id;
		this.id_post = id_post;
		this.id_user = id_user;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getId_post() {
		return id_post;
	}
	public void setId_post(int id_post) {
		this.id_post = id_post;
	}
	public int getId_user() {
		return id_user;
	}
	public void setId_user(int id_user) {
		this.id_user = id_user;
	}
	@Override
	public String toString() {
		return "PostSaved [id=" + id + ", id_post=" + id_post + ", id_user=" + id_user + "]";
	}
	

}
