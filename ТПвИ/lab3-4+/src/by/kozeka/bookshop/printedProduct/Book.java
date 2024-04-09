package by.kozeka.bookshop.printedProduct;
import org.apache.log4j.Logger;

public class Book extends PrintedProduct {
    private static final Logger LOG =
            Logger.getLogger(Book.class);
    public Book(String title, int price, int year) {
        super(title, price, year);
    }
    public Book() {
        super();
    }
    @Override
    public void Info() {
        System.out.println("-------------Книга-------------");
        System.out.println("Название: " + getTitle());
        System.out.println("Цена: " + getPrice());
        System.out.println("Год: " + getYearOfPublication());
        System.out.println("-------------------------------");
    }

    @Override
    public int compare(PrintedProduct o1, PrintedProduct o2) {
        if(o1.getYearOfPublication() > o2.getYearOfPublication())
            return 1;
        else if(o1.getYearOfPublication() < o2.getYearOfPublication())
            return -1;
        else return 0;
    }
}