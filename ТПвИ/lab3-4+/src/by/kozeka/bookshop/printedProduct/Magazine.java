package by.kozeka.bookshop.printedProduct;
public class Magazine extends PrintedProduct {
//    private ThemeType themeType;
//
//    public ThemeType getThemeType() {
//        return themeType;
//    }
//
//    public void setThemeType(ThemeType themeType) {
//        this.themeType = themeType;
//    }

    public Magazine(String title, int price, int year) {
        super(title, price, year);
        //this.themeType = themeType;
    }

    public Magazine() {
        super();
    }

    @Override
    public void Info() {
        System.out.println("-------------Журнал------------");
        System.out.println("Название: " + getTitle());
        System.out.println("Цена: " + getPrice());
        System.out.println("Год: " + getYearOfPublication());
        //System.out.println("Тема: " + getThemeType());
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