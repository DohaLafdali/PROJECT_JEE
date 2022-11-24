package MDP;

import java.sql.Connection;

public class AbstractDAOA {
	//SingleConnexion cnx = new SingleConnexion();
    protected static Connection connection = SingleConnexion.getConnection();
	////protected Connection connection =SingleConnexion.connection;
}