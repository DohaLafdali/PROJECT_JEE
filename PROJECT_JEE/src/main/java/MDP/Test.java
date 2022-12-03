package MDP;



import java.io.FileInputStream;

import java.sql.Connection;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import com.google.protobuf.compiler.PluginProtos.CodeGeneratorResponse.File;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

   SingleConnexion cnx = new SingleConnexion();
   Connection con = cnx.getConnection();
   
 
    Post post=new Post();
    PostDaoImpl cm=new PostDaoImpl();
    int [] tableau=null;
    ArrayList <Integer> ls = cm.getPostSaved(1);
    
    for( int i : ls) {
    	System.out.print(i);
    	post=cm.getPost(i);
    }
    
  
	}




}
