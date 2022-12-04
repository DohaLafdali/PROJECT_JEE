package Models;


import java.io.InputStream;
//import java.sql.Blob;
import java.sql.Timestamp;

import com.mysql.cj.jdbc.Blob;



public class Post {
	private int id; 
	private String text;
	private InputStream photo;
	private int id_categorie;
	private int user;
	private String photo_name;
	private Timestamp time_post;
	
	public Post() {
		super();
	}

	public Post(int id, String text, InputStream photo,Timestamp time_post, int user) {
		super();
		this.id = id;
		this.text = text;
		this.photo = photo;
		this.time_post=time_post;
		this.user= user;
	}
	
	public Post(int id, String text, InputStream photo, int id_categorie, int user, Timestamp time_post) {
		super();
		this.id = id;
		this.text = text;
		this.photo = photo;
		this.id_categorie = id_categorie;
		this.user = user;
		this.time_post = time_post;
	}

	public Post(int id, String text, int id_categorie, int user, String photo_name, Timestamp time_post) {
		super();
		this.id = id;
		this.text = text;
		this.id_categorie = id_categorie;
		this.user = user;
		this.photo_name = photo_name;
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


	public InputStream getPhoto() {
		return photo;
	}

	public void setPhoto(InputStream photo) {
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
	
	

	public String getPhoto_name() {
		return photo_name;
	}

	public void setPhoto_name(String photo_name) {
		this.photo_name = photo_name;
	}

	@Override
	public String toString() {
		return "Post [id=" + id + ", text=" + text + ", image=" + photo + ", iduser= "+user+"]";
	}
	
	
	
}
