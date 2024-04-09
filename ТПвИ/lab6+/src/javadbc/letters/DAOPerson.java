package javadbc.letters;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class DAOPerson implements IGenDAO <Person, Integer> {
    private final Connection connection;
    public DAOPerson(Connection connection){
        this.connection = connection;
    }

    @Override
    public List<Person> getAll() throws SQLException {
        String sql = "SELECT * FROM people;";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ResultSet resultSet = preparedStatement.executeQuery();
        List<Person> list = new ArrayList<>();
        ResultSetListPerson(resultSet, list);
        return list;
    }

    public List <Person> infoAboutPerson_N_Letter() throws SQLException {
        String sql = "SELECT people.snp, people.dateBirth, t1.receives, t2.sents FROM people\n" +
                "LEFT JOIN (SELECT (letter.receiver), COUNT(letter.receiver) as receives FROM letter GROUP BY (letter.receiver)) AS t1 ON\n" +
                "people.snp = t1.receiver LEFT JOIN (SELECT letter.sender, COUNT(letter.sender) as sents FROM letter GROUP BY (letter.sender)) AS t2 ON people.snp = t2.sender\n" +
                "ORDER BY people.snp;";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ResultSet resultSet = preparedStatement.executeQuery();
        List<Person> list = new ArrayList<>();
        while (resultSet.next()){
            Person person = new Person();
            person.snp = resultSet.getString("snp");
            person.dateBirth = resultSet.getString("dateBirth");
            person.receives = resultSet.getString("receives");
            person.sends = resultSet.getString("sents");
            list.add(person);
        }
        return list;
    }




    public void ResultSetListPerson(ResultSet resultSet, List<Person> list) throws SQLException {//для вывода
        while (resultSet.next()){
            Person person = new Person();
            person.snp = resultSet.getString("snp");
            person.dateBirth = resultSet.getString("dateBirth");
            list.add(person);
        }
    }

}