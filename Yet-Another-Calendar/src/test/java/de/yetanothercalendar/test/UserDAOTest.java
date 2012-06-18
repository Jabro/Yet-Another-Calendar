package de.yetanothercalendar.test;

import org.junit.Test;

import de.yetanothercalendar.model.dao.impl.UserDAOImpl;
import de.yetanothercalendar.model.database.User;
import de.yetanothercalendar.model.database.helper.DatabaseConnectionManager;
import junit.framework.TestCase;

public class UserDAOTest extends TestCase {
	
	
	@Test
	public void testCreateUserTable() {
		UserDAOImpl user = new UserDAOImpl(new DatabaseConnectionManager(
				"admin", "admin", "localhost", 3306, "yetanothercalendar"));
		assertNotNull("Anlegen des UserDAOs fehlgeschlagen!", user);
		user.createUserTable();
	}
	
	@Test
	public void testCreateUser() {
		UserDAOImpl user = new UserDAOImpl(new DatabaseConnectionManager(
				"admin", "admin", "localhost", 3306, "yetanothercalendar"));

		if (null != user.createUser(new User("zeller@yahoo.de", "Paull",
				"Sulzer", "test")) == true) {
			System.out.println("Hat funktioniert");
		} else {
			fail("hat nicht funktioniert, User existiert wahrscheinlich ");
		}

	}
	
	
	
	@Test
	public void testReturnUser() {
		UserDAOImpl userImp = new UserDAOImpl(new DatabaseConnectionManager(
				"admin", "admin", "localhost", 3306, "yetanothercalendar"));

		if (userImp.checkUser("zeller3@yahoo.de", "test")) {
			User user = userImp.returnUser("zeller@yahoo.de");
			System.out.println("Email: " + user.getEmail() + " Vorname: "
					+ user.getForename() + " ID: " + user.getId()
					+ " Nachname: " + user.getLastname() + " Passwort: "
					+ user.getPasswordSHA1());
		} else {
			fail("Email-Adresse oder Passwort sind falsch! "
					+ "Bitte ueberpruefen");
		}

	}
}