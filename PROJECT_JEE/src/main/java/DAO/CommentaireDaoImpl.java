package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Models.Commentaire;
import Models.Like;

public class CommentaireDaoImpl extends AbstractDAOA implements IDAO{

	@Override
	public void add(Object obj) {
		// TODO Auto-generated method stub
		PreparedStatement pst = null;
        String sql = "insert into Commentaire (text,id_post,id_user) values (?,?,?)";
        try {
            pst = connection.prepareStatement(sql);
            pst.setString(1, ((Commentaire) obj).getText());
            pst.setInt(2, ((Commentaire) obj).getPost());
            pst.setInt(3, ((Commentaire) obj).getUser());
            pst.executeUpdate();
        } catch (SQLException exp) {
            System.out.println(exp.getMessage());
        }
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		PreparedStatement pst = null;
        String sql = "delete from Commentaire where id= ?";
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
        String sql = "select *from Commentaire where id= ?";
        try {
            pst = connection.prepareStatement(sql);
            pst.setLong(1, id);
            rs = pst.executeQuery();
            if (rs.next()) {
                
                return new Commentaire(rs.getInt("id"), rs.getString("text"),rs.getInt("id_post"),rs.getInt("id_user"));
            }
        } catch (SQLException exp) {
            System.out.println(exp.getMessage());
        }
        return null;
	}

	@Override
	public List getAll() {
		// TODO Auto-generated method stub
		List<Commentaire> list = new ArrayList<Commentaire>();
        PreparedStatement pst = null;
        ResultSet rs;
        String sql = "select *from Commentaire";
        try {
            pst = connection.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                System.out.println(rs.getLong("id") + "" + rs.getString("text"));
                list.add(new Commentaire(rs.getInt("id"), rs.getString("text"),rs.getInt("id_post"),rs.getInt("id_user")));
            }
        } catch (SQLException exp) {
            System.out.println(exp.getMessage());
        }
        return list;
	}

	public static  List getCmnt(int post) {
		// TODO Auto-generated method stub
		List<Commentaire> list = new ArrayList<Commentaire>();
        PreparedStatement pst = null;
        ResultSet rs;
        String sql = "select *from Commentaire where id_post=?";
        try {
            pst = connection.prepareStatement(sql);
            pst.setInt(1, post);
            rs = pst.executeQuery();
            while (rs.next()) {
                System.out.println(rs.getLong("id") + "" + rs.getString("text"));
                list.add(new Commentaire(rs.getInt("id"), rs.getString("text"),rs.getInt("id_post"),rs.getInt("id_user")));
            }
        } catch (SQLException exp) {
            System.out.println(exp.getMessage());
        }
        return list;
	}
	
	public String getUsers(int post,int user) {
		// TODO Auto-generated method stub
		List<Like> list = new ArrayList<Like>();
        PreparedStatement pst = null;
        ResultSet rs;
        String value="";
        String sql = "select u.username from Utilisateur u,Commentaire c where c.id_post=? and u.id=?";
        try {
            pst = connection.prepareStatement(sql);
            pst.setInt(1, post);
            pst.setInt(2, user);
            rs = pst.executeQuery();
            while (rs.next()) {
            
               value=rs.getString(1);
               
            }
            pst.close();
            
        } catch (SQLException exp) {
            System.out.println(exp.getMessage());
        }
        
        return value;
	}

}
