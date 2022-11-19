package MDP;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CompteDaoImpl extends AbstractDAOA implements IDAO {
	
    @Override
    public void delete(int id) {
        PreparedStatement pst = null;
        String sql = "delete *from Utilisateur where id= ?";
        try {
            pst = connection.prepareStatement(sql);
            pst.setLong(1, id);
            pst.executeUpdate();
        } catch (SQLException exp) {
            System.out.println(exp.getMessage());
        }
    }

    @Override
    public Utilisateur getOne(int id) {
        PreparedStatement pst = null;
        ResultSet rs;
        String sql = "select *from Utilisateur where id= ?";
        try {
            pst = connection.prepareStatement(sql);
            pst.setLong(1, id);
            rs = pst.executeQuery();
            if (rs.next()) {
                System.out.println(rs.getLong("id") + "" + rs.getString("username"));
                
                return new Utilisateur(rs.getInt("id"), rs.getString("username"), rs.getString("image_profil"), rs.getString("email"),rs.getString("password"));
            }
        } catch (SQLException exp) {
            System.out.println(exp.getMessage());
        }
        return null;
    }

    @Override
    public List<Utilisateur> getAll() {
        List<Utilisateur> list = new ArrayList<Utilisateur>();
        PreparedStatement pst = null;
        ResultSet rs;
        String sql = "select *from Utilisateur";
        try {
            pst = connection.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                System.out.println(rs.getLong("id") + "" + rs.getString("username"));
                list.add(new Utilisateur(rs.getInt("id"), rs.getString("username"), rs.getString("image_profil"), rs.getString("email"),rs.getString("password")));
            }
        } catch (SQLException exp) {
            System.out.println(exp.getMessage());
        }
        return list;
    }

	@Override
	public void add(Object obj) {
		// TODO Auto-generated method stub
		PreparedStatement pst = null;
        String sql = "insert into Utilisateur (id,username,image_profil, email,) values (?,?,?,?)";
        try {
            pst = connection.prepareStatement(sql);
            pst.setLong(1, ((Utilisateur) obj).getId());
            pst.setString(1, ((Utilisateur) obj).getUsername());
            pst.setString(2, ((Utilisateur) obj).getImage_profil());
            pst.setString(3, ((Utilisateur) obj).getEmail());
            pst.executeUpdate();
        } catch (SQLException exp) {
            System.out.println(exp.getMessage());
        }
		
	}

   
}