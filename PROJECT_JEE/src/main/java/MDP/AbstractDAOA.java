package MDP;

import java.sql.Connection;

public class AbstractDAOA {
	//SingleConnexion cnx = new SingleConnexion();
    protected Connection connection = SingleConnexion.getConnection();
	////protected Connection connection =SingleConnexion.connection;
}