package by.kozeka.bookshop.PrintedProductHandler;
import by.kozeka.bookshop.printedProduct.Book;
import by.kozeka.bookshop.printedProduct.Magazine;
import by.kozeka.bookshop.printedProduct.Postcard;
import by.kozeka.bookshop.printedProduct.PrintedProduct;
import org.xml.sax.Attributes;
import org.xml.sax.helpers.DefaultHandler;
import java.util.HashSet;
import java.util.Set;

public class PrintedProductHandler extends DefaultHandler {
    String thisElement ="";
    private Set<PrintedProduct> cards;
    private PrintedProduct current = null;
    public PrintedProductHandler() {
        cards = new HashSet<PrintedProduct>();
    }
    public Set<PrintedProduct> getCards() {
        return cards;
    }
    public void startElement(String uri, String localName, String qName, Attributes attrs) {
        if ("Book".equals(localName)) {
            current = new Book();
        }
        if ("Postcard".equals(localName)) {
            current = new Postcard();
        }
        if ("Magazine".equals(localName)) {
            current = new Magazine();
        }
        thisElement = qName;
    }
    public void endElement(String uri, String localName, String qName) {
        if ("Book".equals(localName)) {
            cards.add(current);
        }
        if ("Magazine".equals(localName)) {
            cards.add(current);
        }
        if ("Postcard".equals(localName)) {
            cards.add(current);
        }
        thisElement="";
    }
    public void characters(char[] ch, int start, int length) {
        String s = new String(ch, start, length).trim();
        if (thisElement.equals("title")) {
            current.setTitle(new String(ch, start, length));
        }
        if (thisElement.equals("price")) {
            current.setPrice(Integer.parseInt(s));
        }
        if (thisElement.equals("year")) {
            current.setYearOfPublication(Integer.parseInt(s));
        }
    }
}
