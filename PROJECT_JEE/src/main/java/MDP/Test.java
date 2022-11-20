package MDP;

import java.sql.Connection;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

   //SingleConnexion cnx = new SingleConnexion();
   //Connection con = cnx.getConnection();
   Utilisateur user= new Utilisateur(77,"kkk","profil","elmarjani@gmail","password");
   UtilisateurDaoImpl help = new UtilisateurDaoImpl();
  // CompteDaoImpl cc =new CompteDaoImpl();
   //cc.validate("taoutaou.chaimaa@gmail.com","123456778");
   help.add(user);
	}




}
