package javadbc.letters;
public class Person {
    public String snp;
    public String dateBirth;
    public String sends;
    public String receives;

    public Person(){
        snp = "no info";
        dateBirth = "no info";
        sends = "no info";
        receives = "no info";
    }

    @Override
    public String toString() {
        return "\nAuthor{ " +
                "Surname name patronymic='" + snp + '\'' + ", dateBirth='" + dateBirth + '\'' + ", sends='" + sends + '\'' + ", receives='" + receives + " " +
                '}';
    }
}