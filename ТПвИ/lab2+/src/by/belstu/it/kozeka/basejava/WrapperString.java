package by.belstu.it.kozeka.basejava;
import java.util.Objects;
/*
    @author jokimi (Kozeka Elizaveta)
    @version 1.1
*/
public class WrapperString {
    /*
     * @return void
     * @throws java.Exception
     * @param char old_char && char new_char
    */
    private String string;
    public WrapperString() {
    }
    public String getString() {
        return string;
    }
    public void setString(String string) {
        this.string = string;
    }
    @Override
    public String toString() {
        return "WrapperString{" +
                "string='" + string + '\'' +
                '}';
    }
    @Override
    public boolean equals(Object o) {
        if (this == o)
            return true;
        if (o == null || getClass() != o.getClass())
            return false;
        WrapperString that = (WrapperString) o;
        return Objects.equals(string, that.string);
    }
    @Override
    public int hashCode() {
        return Objects.hash(string);
    }
    public void replace (char old_char, char new_char)
    {
        string = string.replace(old_char, new_char);
    }
}