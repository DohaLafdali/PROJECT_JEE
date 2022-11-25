package MDP;



import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.Timestamp;
import java.util.Date;

import com.google.protobuf.compiler.PluginProtos.CodeGeneratorResponse.File;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

   SingleConnexion cnx = new SingleConnexion();
   Connection con = cnx.getConnection();
   
   Utilisateur user= new Utilisateur(77,"kkk","profil","elmarjani@gmail","password");
   PostDaoImpl postdao=new PostDaoImpl();
   CommentaireDaoImpl cm=new CommentaireDaoImpl();
   Date date = new Date();
   Timestamp timestamp = new Timestamp(System.currentTimeMillis());
   Post post=new Post();

  
  
  // CompteDaoImpl cc =new CompteDaoImpl();
   //cc.validate("taoutaou.chaimaa@gmail.com","123456778");
   //help.add(user);
	}




}
