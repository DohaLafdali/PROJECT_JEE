package MDP;



import java.io.FileInputStream;

import java.sql.Connection;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.google.protobuf.compiler.PluginProtos.CodeGeneratorResponse.File;

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
 //  likeDaoImpl.deleteLike(19,2);
   
   final List<Chat> chats = ChatDaoImpl.getChatOfUser(1);
  
  	List<Integer> array_L= new ArrayList<Integer>();
  	for(int i=0;i<chats.size();i++){
  		//System.out.println(chats.get(i).getContent());
  		//out.println(chats.get(i).getFrom_user());
  		array_L.add(chats.get(i).getTo_user());
  	}
  	 Set<Integer> mySet = new HashSet<Integer>(array_L);
  	 
  	    // Créer une Nouvelle ArrayList à partir de Set
  	    List<Integer> array_L2 = new ArrayList<Integer>(mySet);
  			System.out.println(array_L2);
  			for(int j=0;j<array_L2.size();j++) {
  				final List<Chat> disc = ChatDaoImpl.getChat(1, array_L2.get(j));
  				System.out.println(disc);
  				System.out.println("another one");
  			}
  			 
   // String value = likeDaoImpl.getUsers(5,2);
   // System.out.println(value);
  // int compteur = likeDaoImpl.nombreLikes(1);
   //System.out.print(compteur);
  
  // CompteDaoImpl cc =new CompteDaoImpl();
   //cc.validate("taoutaou.chaimaa@gmail.com","123456778");
   //help.add(user);
	}




}
