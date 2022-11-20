package MDP;

import java.awt.Image;
import java.util.Collection;

public class Utilisateur {
	
	private int id;
	private String username;
	private String image_profil;
	private String email;
	private String password;
	public Utilisateur() {
		// TODO Auto-generated constructor stub
	}
	public Utilisateur(int id,String username,String image_profil,String email,String password) {
		super();
		this.id=id;
		this.username=username;
		this.image_profil=image_profil;
		this.email=email;
		this.password=password;
		
	}
	
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getImage_profil() {
		return image_profil;
	}

	public void setImage_profil(String image_profil) {
		this.image_profil = image_profil;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "Utilisateur [username=" + username + ", image_profil=" + image_profil + ", email=" + email + "]";
	}
	
}
