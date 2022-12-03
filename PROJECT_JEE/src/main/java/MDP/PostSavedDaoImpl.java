package MDP;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class PostSavedDaoImpl extends AbstractDAOA implements IDAO{

	public PostSavedDaoImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public void add(Object obj) {
		// TODO Auto-generated method stub
		PreparedStatement pst = null;
        String sql = "insert into PostSaved (id_user,id_post) values (?,?)";
        try {
            pst = connection.prepareStatement(sql);
            pst.setInt(1, ((PostSaved) obj).getId_user());
            pst.setInt(2, ((PostSaved) obj).getId_post());
            pst.executeUpdate();
        } catch (SQLException exp) {
            System.out.println(exp.getMessage());
        }
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Object getOne(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List getAll() {
		// TODO Auto-generated method stub
		return null;
	}
	

}
