package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Models.Categorie;
import Models.Chat;

public class ChatDaoImpl extends AbstractDAOA implements IDAO{

	@Override
	public void add(Object obj) {
		// TODO Auto-generated method stub
		PreparedStatement pst = null;
        String sql = "insert into Chat (content,id_from,id_to,time_msg) values (?,?,?,?)";
        try {
            pst = connection.prepareStatement(sql);
            pst.setString(1, ((Chat) obj).getContent());
            pst.setInt(2, ((Chat) obj).getFrom_user());
            pst.setInt(3, ((Chat) obj).getTo_user());
            pst.setTimestamp(4, ((Chat) obj).getTime_msg());
            pst.executeUpdate();
        } catch (SQLException exp) {
            System.out.println(exp.getMessage());
        }
		
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		
		PreparedStatement pst = null;
        String sql = "delete *from Categorie where id= ?";
        try {
            pst = connection.prepareStatement(sql);
            pst.setLong(1, id);
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
        String sql = "select *from Categorie where id= ?";
        try {
            pst = connection.prepareStatement(sql);
            pst.setLong(1, id);
            rs = pst.executeQuery();
            if (rs.next()) {                
                return new Categorie(rs.getInt("id"), rs.getString("nom_categorie"));
            }
        } catch (SQLException exp) {
            System.out.println(exp.getMessage());
        }
        return null;
	}

	@Override
	public List getAll() {
		// TODO Auto-generated method stub
		List<Chat> list = new ArrayList<Chat>();
        PreparedStatement pst = null;
        ResultSet rs;
        String sql = "select *from Chat";
        try {
            pst = connection.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                System.out.println(rs.getLong("id") + "" + rs.getString("nom_categorie"));
            }
        } catch (SQLException exp) {
            System.out.println(exp.getMessage());
        }
        return list;
	}
	
	
	public static List getChat(int id_from,int id_to) {
		// TODO Auto-generated method stub
		List<Chat> list = new ArrayList<Chat>();
        PreparedStatement pst = null;
        ResultSet rs;
        String sql = "select *from chat where (id_from=? and id_to=?) or (id_from=? and id_to=?) ORDER BY time_msg";
        try {
            pst = connection.prepareStatement(sql);
           
            System.out.println("cc: ");
            pst.setInt(1, id_from);
            pst.setInt(2, id_to);
            pst.setInt(4, id_from);
            pst.setInt(3, id_to);
            System.out.println("cc: ");
            rs = pst.executeQuery();
            while (rs.next()) {
                list.add(new Chat(rs.getString("content"),rs.getInt("id_from"),rs.getInt("id_to"),rs.getTimestamp("time_msg")));
            }
        } catch (SQLException exp) {
            System.out.println(exp.getMessage());
        }
        return list;
	}

	

	 public static List getChatOfUser(int id_from) {
		// TODO Auto-generated method stub
		List<Chat> list = new ArrayList<Chat>();
		       PreparedStatement pst = null;
		       ResultSet rs;
		       String sql = "select *from chat where id_from=? or id_to=? ORDER BY time_msg DESC";
		       try {
		           pst = connection.prepareStatement(sql);
		         
		         
		           pst.setInt(1, id_from);
		           pst.setInt(2, id_from);
		     

		           rs = pst.executeQuery();
		           while (rs.next()) {		        
		               list.add(new Chat(rs.getInt("id"),rs.getString("content"),rs.getInt("id_from"),rs.getInt("id_to"),rs.getTimestamp("time_msg")));
		           }
		       } catch (SQLException exp) {
		           System.out.println(exp.getMessage());
		       }
		       return list;
		}

	

}
