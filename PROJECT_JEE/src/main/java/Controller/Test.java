package Controller;



import java.io.FileInputStream;

import java.sql.Connection;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.google.protobuf.compiler.PluginProtos.CodeGeneratorResponse.File;

import DAO.LikeDaoImpl;
import DAO.PostDaoImpl;
import Models.Post;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

   SingleConnexion cnx = new SingleConnexion();
   Connection con = cnx.getConnection();
   
   //Utilisateur user= new Utilisateur(77,"kkk","profil","elmarjani@gmail","password");
   //UtilisateurDaoImpl postdao=new UtilisateurDaoImpl();
  // postdao.update(new Utilisateur(2,"assia_elmarjani","profil","elmarjaniassista@gmail.com","nounou"));
  // CommentaireDaoImpl cm=new CommentaireDaoImpl();
  // Date date = new Date();
  // Timestamp timestamp = new Timestamp(System.currentTimeMillis());
   //Timestamp timestamp2 = new Timestamp("2022-11-27 11:20:53.242");
   //DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
   //Date date_mini = dateFormat.format((Date)timestamp.getTime());
  // System.out.print(timestamp);
   //System.out.print(timestamp.getMinutes()-timestamp2.getMinutes());
   Post post=new Post();
   PostDaoImpl cm=new PostDaoImpl();
   cm.delete(2);
   // test du like 
   //Like like= new Like();
   //like.setPost(5);
  // like.setUser(3);
   LikeDaoImpl likeDaoImpl = new LikeDaoImpl();
   likeDaoImpl.deleteLike(19,2);
   // String value = likeDaoImpl.getUsers(5,2);
   // System.out.println(value);
  // int compteur = likeDaoImpl.nombreLikes(1);
   //System.out.print(compteur);
  
  // CompteDaoImpl cc =new CompteDaoImpl();
   //cc.validate("taoutaou.chaimaa@gmail.com","123456778");
   //help.add(user);
	}




}
