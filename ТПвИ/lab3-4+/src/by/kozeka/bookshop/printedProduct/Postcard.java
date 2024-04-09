package by.kozeka.bookshop.printedProduct;

public class Postcard extends PrintedProduct {
    public Postcard(String title, int price, int year) {
        super(title, price, year);
    }
    public Postcard() {
        super();
    }
    @Override
    public void Info() {
        System.out.println("------------Открытка-----------");
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