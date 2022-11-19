package MDP;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CommentaireDaoImpl extends AbstractDAOA implements IDAO{

	@Override
	public void add(Object obj) {
		// TODO Auto-generated method stub
		PreparedStatement pst = null;
        String sql = "insert into Commentaire (id,text) values (?,?)";
        try {
            pst = connection.prepareStatement(sql);
            pst.setLong(1, ((Commentaire) obj).getId());
            pst.setString(2, ((Commentaire) obj).getText());
            pst.executeUpdate();
        } catch (SQLException exp) {
            System.out.println(exp.getMessage());
        }
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		PreparedStatement pst = null;
        String sql = "delete *from Commentaire where id= ?";
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
                System.out.println(rs.getLong("id") + "" + rs.getString("text"));
                
                return new Commentaire(rs.getInt("id"), rs.getString("text"));
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
                list.add(new Commentaire(rs.getInt("id"), rs.getString("text")));
            }
        } catch (SQLException exp) {
            System.out.println(exp.getMessage());
        }
        return list;
	}

}
