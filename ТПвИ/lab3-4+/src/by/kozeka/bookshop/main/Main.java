package by.kozeka.bookshop.main;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import by.kozeka.bookshop.JacksonParser.JacksonParser;
import by.kozeka.bookshop.PrintedProductHandler.PrintedProductHandler;
import by.kozeka.bookshop.SAX.ValidatorSAX;
import by.kozeka.bookshop.store.BookStore;
import by.kozeka.bookshop.printedProduct.*;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.log4j.xml.DOMConfigurator;
import org.xml.sax.SAXException;
import org.xml.sax.XMLReader;
import org.xml.sax.helpers.XMLReaderFactory;
import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Arrays;
import java.util.List;
import java.util.Set;

public class Main {
    static {
        new DOMConfigurator().doConfigure("log/log4j.xml", LogManager.getLoggerRepository());
    }
    private static final Logger LOG = Logger.getLogger(Main.class);
    public static void main (String[] args){
        LOG.info("Starting program_____________________________");
        ValidatorSAX validate = new ValidatorSAX();
        validate.valid();
        BookStore bookstore = new BookStore(new Book("Война и мир", 145, 2014));
        bookstore.bookStoreSeller.AddProduct(new Book("Колобок", 100, 1998));
        bookstore.bookStoreSeller.AddProduct(new Magazine("Беларуская правда", 35, 2023));

        bookstore.bookStoreSeller.SearchProductByTitle("Колобок").Info();
        try {
            bookstore.bookStoreSeller.SearchProductByTitle("Колобокывапв").Info();
        }
        catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        bookstore.ShowProducts();
        bookstore.bookStoreSeller.SortProductsByYear();
        bookstore.ShowProducts();

        try {
            PrintedProductHandler sh = new PrintedProductHandler();
            XMLReader reader = null;
            reader = XMLReaderFactory.createXMLReader();
            reader.setContentHandler(sh);
            reader.parse("D:/BSTU/4 sem/java/labs/lab3/files/data.xml");
            Set<PrintedProduct> a = sh.getCards();
            for(PrintedProduct pr : a) {
                pr.Info();
            }
        }
        catch (IOException e) {
            e.printStackTrace();
        }
        catch (SAXException e) {
            e.printStackTrace();
        }
        JacksonParser jsonParser = new JacksonParser();
        jsonParser.Ser(new Book("Legend book",75,2014));
        jsonParser.Ser(new Book("Checkmate",50,1980));
        List<PrintedProduct> list =
                Arrays.asList(new Book("Legend book",75,2014),
                        new Book("Checkmate",50,1980));
        list.stream()
            .filter(s -> s.getYearOfPublication() > 2000)
            .sorted()
            .forEach(s -> s.Info());
    }
}