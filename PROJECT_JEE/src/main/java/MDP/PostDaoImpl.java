package MDP;

import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PostDaoImpl extends AbstractDAOA implements IDAO{

	@Override
	public void add(Object obj) {
		// TODO Auto-generated method stub
		PreparedStatement pst = null;
        String sql = "insert into Post (text,photo,id_categorie,user,time_post) values (?,?,?,?,?)";
        try {
            pst = connection.prepareStatement(sql);
           // pst.setLong(1, ((Post) obj).getId());
            pst.setString(1, ((Post) obj).getText());
            pst.setString(2, ((Post) obj).getPhoto());
            pst.setInt(3, ((Post) obj).getId_categorie());
            pst.setInt(4, ((Post) obj).getUser());
            pst.setTimestamp(5, ((Post) obj).getTime_post());
           // pst.setDate(4, (getTimestamp) ((Post) obj).getTime_post());
           
            pst.executeUpdate();
            System.out.println("post cree");
        } catch (SQLException exp) {
            System.out.println(exp.getMessage());
        }
		
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		PreparedStatement pst = null;
        String sql = "delete *from Post where id= ?";
        try {
            pst = connection.prepareStatement(sql);
            pst.setInt(1, id);
            pst.executeUpdate();
        } catch (SQLException exp) {
            System.out.println(exp.getMessage());
        }
	}

	@Override
	public Object getOne(int id) {
		// TODO Auto-generated method stub
		PreparedStatement pst = null;
        ResultSet rs;
        String sql = "select *from Post where id= ?";
        try {
            pst = connection.prepareStatement(sql);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            if (rs.next()) {
                System.out.println(rs.getLong("id") + "" + rs.getString("text"));
                
                return new Post(rs.getInt("id"), rs.getString("text"), rs.getString("photo"),rs.getTimestamp("time_post"), rs.getInt("user"));
            }
        } catch (SQLException exp) {
            System.out.println(exp.getMessage());
        }
        return null;
	}

	@Override
	public List getAll() {
		// TODO Auto-generated method stub
		List<Post> list = new ArrayList<Post>();
        PreparedStatement pst = null;
        ResultSet rs;
        String sql = "select *from Post";
        try {
            pst = connection.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                System.out.println(rs.getLong("id") + "" + rs.getString("text"));
                list.add(new Post(rs.getInt("id"), rs.getString("text"), rs.getString("photo"),rs.getTimestamp("time_post"), rs.getInt("user")));
            }
        } catch (SQLException exp) {
            System.out.println(exp.getMessage());
        }
        return list;
	}
	/*public  List getPosts(int id_category) {
		// TODO Auto-generated method stub
		List<Post> list = new ArrayList<Post>();
        PreparedStatement pst = null;
        ResultSet rs;
        String sql = "select *from Post where id_categorie ="+id_category;
        try {
            try {
				pst = connection.prepareStatement(sql);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            rs = pst.executeQuery();
            while (rs.next()) {
                System.out.println(rs.getLong("id") + "" + rs.getString("text"));
                list.add(new Post(rs.getInt("id"), rs.getString("text"), rs.getString("image")));
            }
        } catch (SQLException exp) {
            System.out.println(exp.getMessage());
        }
        return list;
	}*/
	  public static ArrayList<Post> getPosts(int id_category){
	    	
	    	 ArrayList<Post> ls=new ArrayList<Post>();
	         PreparedStatement pst = null;
	         ResultSet rs;
	         String sql = "select *from Post where id_categorie ="+id_category;
	         try {
	 			 pst = connection.prepareStatement(sql);
	             rs = pst.executeQuery();
	            // n=rs.getInt("in");
	            
	             while (rs.next()) {
	            	
	            	UtilisateurDaoImpl utilisateurDaoImpl = new UtilisateurDaoImpl();
	                 System.out.println("cg: "+utilisateurDaoImpl.getOneO(rs.getInt("user")));
	                 ls.add(new Post(rs.getInt("id"), rs.getString("text"), rs.getString("photo"),rs.getTimestamp("time_post"), rs.getInt("user")));
	             }
	         } catch (SQLException exp) {
	             System.out.println(exp.getMessage());
	         }
	         return ls;
	    	 
	    	 
	     }

}
