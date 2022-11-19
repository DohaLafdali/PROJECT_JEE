package MDP;

import java.awt.Image;
import java.util.Collection;

public class Post {
	private int id; 
	private String text;
	private String image;
	private Utilisateur user;
	//private Collection<Commentaire> commentaires;
	
	public Post(int id, String text, String image) {
		super();
		this.id = id;
		this.text = text;
		this.image = image;
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

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
	

	

	@Override
	public String toString() {
		return "Post [id=" + id + ", text=" + text + ", image=" + image + "]";
	}
	
	
	
}
