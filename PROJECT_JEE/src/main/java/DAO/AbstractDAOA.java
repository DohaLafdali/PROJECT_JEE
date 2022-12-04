package DAO;

import java.sql.Connection;

import Controller.SingleConnexion;

public class AbstractDAOA {
	//SingleConnexion cnx = new SingleConnexion();
    protected static Connection connection = SingleConnexion.getConnection();
	////protected Connection connection =SingleConnexion.connection;
}