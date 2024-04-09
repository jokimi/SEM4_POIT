package javadbc.letters;

public class Letter {
    public Integer idLetters;
    public String sender;
    public String receiver;
    public String topic;
    public String text;
    public String dateOfSend;

    public Letter(){
        sender = "no info";
        receiver = "no info";
        topic = "no info";
        text = "no info";
        dateOfSend = "no info";
    }

    @Override
    public String toString() {
        return "\nLetters{ " + "sender='" + sender + '\'' + ", receiver='" + receiver + '\'' +
                ", theme='" + topic + '\'' + ", text='" + text + '\'' +
                ", date of sending=" + dateOfSend + '\'' + ", letter_id=" + idLetters + " " +
                '}';
    }
}