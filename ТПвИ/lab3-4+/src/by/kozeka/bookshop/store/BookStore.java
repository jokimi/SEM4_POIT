package by.kozeka.bookshop.store;
import by.kozeka.bookshop.printedProduct.PrintedProduct;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

public class BookStore {
    private ArrayList<PrintedProduct> Products = new ArrayList<PrintedProduct>();
    public BookStoreSeller bookStoreSeller;
    public BookStore(PrintedProduct PrPr) {
        Products.add(PrPr);
        bookStoreSeller = new BookStoreSeller();
    }
    public void ShowProducts() {
        for(PrintedProduct pr : Products){
            pr.Info();
        }
    }

    public class BookStoreSeller implements IBookSeller {
        public void SortProductsByYear() {
            Collections.sort(Products, (a, b) -> a.getYearOfPublication() < b.getYearOfPublication() ? -1 : a.getYearOfPublication() == b.getYearOfPublication() ? 0 : 1);
        }
        public PrintedProduct SearchProductByTitle(String Title) {
            for(PrintedProduct pr : Products) {
                if(Title.equals(pr.getTitle())) {
                    return pr;
                }
            }
            return null;
        }
        public void AddProduct(PrintedProduct pr){
            Products.add(pr);
        }
        public void SellProduct(PrintedProduct pr){
            Products.remove(pr);
        }
    }
}