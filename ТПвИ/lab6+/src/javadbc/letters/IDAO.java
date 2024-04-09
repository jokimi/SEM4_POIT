package javadbc.letters;

import java.sql.Connection;
import java.sql.SQLException;

public interface IDAO {
    public Connection getConnection() throws SQLException;
    public IGenDAO <Letter, Integer> getLetterDAO(Connection connection);
    public  IGenDAO<Person, Integer> getPersonDAO(Connection connection);
}