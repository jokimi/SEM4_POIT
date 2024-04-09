package by.kozeka.bookshop.store;

import by.kozeka.bookshop.printedProduct.PrintedProduct;

interface IBookSeller {
    void SortProductsByYear();
    PrintedProduct SearchProductByTitle(String Title);
    void AddProduct(PrintedProduct pr);
    void SellProduct(PrintedProduct pr);
}