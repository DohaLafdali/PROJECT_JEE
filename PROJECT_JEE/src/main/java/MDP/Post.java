package MDP;

import java.awt.Image;

import java.sql.Timestamp;
import java.util.Collection;
import java.util.Date;

public class Post {
	private int id; 
	private String text;
	private String photo;
	private int id_categorie;
	private int user;
	
	private Timestamp time_post;
	
	public Post() {
		super();
	}

	public Post(int id, String text, String photo,Timestamp time_post, int user) {
		super();
		this.id = id;
		this.text = text;
		this.photo = photo;
		this.time_post=time_post;
		this.user= user;
	}
	
	public Post(int id, String text, String photo, int id_categorie, int user, Timestamp time_post) {
		super();
		this.id = id;
		this.text = text;
		this.photo = photo;
		this.id_categorie = id_categorie;
		this.user = user;
		this.time_post = time_post;
	}

	public Timestamp getTime_post() {
		return time_post;
	}

	public void setTime_post(Timestamp time_post) {
		this.time_post = time_post;
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


	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public int getUser() {
		return user;
	}

	public void setUser(int user) {
		this.user = user;
	}

	
	public int getId_categorie() {
		return id_categorie;
	}

	public void setId_categorie(int id_categorie) {
		this.id_categorie = id_categorie;
	}

	@Override
	public String toString() {
		return "Post [id=" + id + ", text=" + text + ", image=" + photo + ", iduser= "+user+"]";
	}
	
	
	
}
