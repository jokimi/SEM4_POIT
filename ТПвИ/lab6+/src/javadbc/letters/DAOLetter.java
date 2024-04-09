package javadbc.letters;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DAOLetter implements IGenDAO<Letter, Integer> {
    public final Connection connection;
    public  DAOLetter(Connection connection){
        this.connection = connection;
    }

    public List <Letter> personWithSmallestLetter() throws SQLException {
        String sql = "SELECT letter.sender FROM letter WHERE LENGTH(letter.text) = (SELECT MIN(LENGTH(letter.text)) FROM letter);";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ResultSet resultSet = preparedStatement.executeQuery();
        List<Letter> list = new ArrayList<>();

        while (resultSet.next()){
            Letter letter = new Letter();
            letter.sender = resultSet.getString("sender");
            list.add(letter);
        }

        return list;
    }

    public List <Letter> receiversWithTopic() throws SQLException {
        String sql = "SELECT * FROM letter WHERE topic = \"Тема письма 4\";";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ResultSet resultSet = preparedStatement.executeQuery();
        List<Letter> list = new ArrayList<>();
        ResulSetListLetter(resultSet, list);

        return list;
    }

    public List <Letter> receiversWithoutTopic() throws SQLException {
        String sql = "SELECT DISTINCT * FROM letter WHERE receiver  NOT IN (SELECT receiver FROM letter WHERE topic = \"Тема письма 4\");";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ResultSet resultSet = preparedStatement.executeQuery();
        List<Letter> list = new ArrayList<>();
        ResulSetListLetter(resultSet, list);

        return list;
    }

    @Override
    public List <Letter> getAll() throws SQLException{
        String sql = "SELECT * FROM letter;";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ResultSet resultSet = preparedStatement.executeQuery();
        List<Letter> list = new ArrayList<>();

        ResulSetListLetter(resultSet, list);
        return list;
    }

    public void pointLetter(String Name, String Topic) throws SQLException {
        var allNames = new ArrayList<String>();

        var query = connection.createStatement();
        ResultSet rs = query.executeQuery("SELECT snp from people");

        while (rs.next()) {
            allNames.add(rs.getString("snp"));
        }
        var st = connection.prepareStatement("INSERT INTO letter (receiver, sender, topic, `text`, dateOfSend) VALUES(?, ?, ?, ?, '2024-05-23');");

        for (var name : allNames) {
            st.setString(1, Name);
            st.setString(2, Name);
            st.setString(3, Topic);
            st.setString(4, "THIS IS SPAM!!");
            st.executeUpdate();
        }
    }

    public void ResulSetListLetter(ResultSet resultSet, List<Letter> list) throws SQLException {
        while (resultSet.next()) {
            Letter letter = new Letter();
            letter.idLetters = resultSet.getInt("idletter");
            letter.sender = resultSet.getString("sender");
            letter.receiver = resultSet.getString("receiver");
            letter.topic = resultSet.getString("topic");
            letter.text = resultSet.getString("text");
            letter.dateOfSend = resultSet.getString("dateOfSend");
            list.add(letter);
        }
    }
}