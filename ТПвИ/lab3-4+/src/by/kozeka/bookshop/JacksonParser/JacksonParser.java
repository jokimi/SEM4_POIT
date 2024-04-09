package by.kozeka.bookshop.JacksonParser;
import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.PropertyAccessor;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import by.kozeka.bookshop.printedProduct.PrintedProduct;
import java.io.*;
public class JacksonParser {
    static int count = 0;
    public JacksonParser() {}
    public void Ser(PrintedProduct prProducts) {
        OutputStream stream = new ByteArrayOutputStream();

        ObjectMapper mapper = new ObjectMapper();
        mapper.setVisibility(PropertyAccessor.FIELD, JsonAutoDetect.Visibility.ANY);
        ObjectNode node = mapper.createObjectNode();

        node.put("id", count++);
        ObjectNode child  = node.putObject("Card");
        try {
            String json = mapper.writeValueAsString(prProducts);
            System.out.println(json);
            mapper.writeValue(new FileWriter("file.json", true), prProducts);
            FileWriter fileWriter = new FileWriter("file.json",true);
            BufferedWriter bufferWriter = new BufferedWriter(fileWriter);
            bufferWriter.write(",\n");
            bufferWriter.close();
        }
        catch (JsonProcessingException e) {
            System.out.println("error  --  " + e.getMessage());
        }
        catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public void DeSer() throws FileNotFoundException {
        BufferedReader buf = new BufferedReader(new FileReader("file.json"));
        try {
            ObjectMapper mapper = new ObjectMapper();
            mapper.setVisibility(PropertyAccessor.FIELD, JsonAutoDetect.Visibility.ANY);
            String line;
            while ((line = buf.readLine()) != null) {
                PrintedProduct prPr = mapper.readValue(line, PrintedProduct.class);
                prPr.Info();
            }
        }
        catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}