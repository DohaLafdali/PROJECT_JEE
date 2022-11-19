package MDP;

import java.sql.Connection;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
   SingleConnexion cnx = new SingleConnexion();
   Connection con = cnx.getConnection();
   Utilisateur user= new Utilisateur(1,"assia","profil","elmarjani@gmail","password");
   UtilisateurDaoImpl help = new UtilisateurDaoImpl();
   help.add(user);
	}

}
