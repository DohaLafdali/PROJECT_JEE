package MDP;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategorieDaoImpl extends AbstractDAOA implements IDAO{

	@Override
	public void add(Object obj) {
		// TODO Auto-generated method stub
		PreparedStatement pst = null;
        String sql = "insert into Categorie (id,nom_categorie) values (?,?)";
        try {
            pst = connection.prepareStatement(sql);
            pst.setLong(1, ((Categorie) obj).getId());
            pst.setString(2, ((Categorie) obj).getNom_categorie());
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
                System.out.println(rs.getLong("id") + "" + rs.getString("nom_categorie"));
                
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
		List<Categorie> list = new ArrayList<Categorie>();
        PreparedStatement pst = null;
        ResultSet rs;
        String sql = "select *from Categorie";
        try {
            pst = connection.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                System.out.println(rs.getLong("id") + "" + rs.getString("nom_categorie"));
                list.add(new Categorie(rs.getInt("id"), rs.getString("nom_categorie")));
            }
        } catch (SQLException exp) {
            System.out.println(exp.getMessage());
        }
        return list;
	}

	
	public List getPosts(int category) {
		
		// TODO Auto-generated method stub
		List<Categorie> list = new ArrayList<Categorie>();
        PreparedStatement pst = null;
        ResultSet rs;
        String sql = "select *from Categorie";
        try {
            pst = connection.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                System.out.println(rs.getLong("id") + "" + rs.getString("nom_categorie"));
                list.add(new Categorie(rs.getInt("id"), rs.getString("nom_categorie")));
            }
        } catch (SQLException exp) {
            System.out.println(exp.getMessage());
        }
		return list;
	}


	

}
