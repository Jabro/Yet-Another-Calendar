package de.yetanothercalendar.model.dao;

<<<<<<< HEAD
import de.yetanothercalendar.model.database.Event;
=======
>>>>>>> origin/dev
import de.yetanothercalendar.model.database.User;

public interface UserDAO {

	/*
	 * (non-Javadoc)
	 * 
	 * @see de.yetanothercalendar.model.dao.impl.EventDAO#createUserTable()
	 */
	/**
	 * Erstellt die Tabelle USERS in der die Benutzer ({@link Users})
	 * abgespeichert werden sollen.
	 */
	public abstract void createUserTable();

<<<<<<< HEAD
	/**
	 * Speichert die Userdaten in die Tabelle USERS
	 * 
	 * @param email
	 * @param forename
	 * @param lastname
	 * @param password
	 * @return
	 */
	public abstract boolean createUser(String email, String forename,
			String lastname, String password);

	/**
	 * �berpr�ft ob die Email-Adresse des Users in der Tabelle USERS vorhanden
	 * ist und �berpr�ft anschlie�end ob das eingegeben Passwort mit dem
	 * Passwort in der Tabelle USERS �bereinstimmt, falls dies der Fall ist wird
	 * true zur�ckgegeben, ansonsten false
	 * 
	 * @param email
	 * @param password
	 * @return
	 */
	public abstract boolean checkUser(String email, String password);

	/**
	 * Hollt sich die Userdaten aus der Tabelle USERS und gibt ein Objekt vom
	 * Typ User zur�ck
	 * 
	 * @param email
	 * @return
	 */
	public abstract User returnUser(String email);
=======
	public abstract User createUser(User user);

	public abstract User isUserDataCorrect(String email, String password);
>>>>>>> origin/dev

}