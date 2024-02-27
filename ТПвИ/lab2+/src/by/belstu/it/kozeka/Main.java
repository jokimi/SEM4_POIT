package by.belstu.it.kozeka;
import by.belstu.it.kozeka.TextFunction;
public class Main {
    public static void main(String[] args) {
        //TODO Add a new method
        System.out.print("Hi!");
        System.out.println(" I'm jokimi");
        textTest();
        for (int i = 0; i < 9; i++) {
            if (i > 2 && i < 7)
                System.out.println(i);
        }
    }
    private static void textTest() {
        TextFunction fun = new TextFunction();
        String value = fun.getValue();
        System.out.println(value);
    }
}