import Company.Company;
import Staff.Engineer;
import Staff.ProgType;
import Staff.Programmer;
import Staff.SysAdmin;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.log4j.xml.DOMConfigurator;

public class Main {
    static {
        new DOMConfigurator().doConfigure("log/log4j.xml", LogManager.getLoggerRepository());
    }
    private static final Logger LOG = Logger.getLogger(Main.class);

    public static void main(String[] args) {
        try {
            LOG.info("Starting program");
            Company ITCompany = new Company();
            Company.Director director = ITCompany.new Director("Bill Gates");
            //director.sortBySalary(ITCompany);
            ITCompany.addWorker(new Engineer("Симонов", "Андрей", 20, 5, 3));
            ITCompany.addWorker(new SysAdmin("Иванов", "Иван", 28, 3000, 6));
            ITCompany.addWorker(new Programmer("Петров", "Петр", 27, 4000,
                    7, ProgType.Middle));
            ITCompany.addWorker(new Programmer("Васильев", "Василий", 30, 4500,
                    10, ProgType.Senior));
            ITCompany.addWorker(new Programmer("Данилевич", "Анастасия", 29, 4500,
                    10, ProgType.Senior));
            System.out.println(director.countWorkers(ITCompany));
            System.out.println("----------------------------------------------------------");
            for (var w : director.searchByExp(ITCompany, 10)) {
                System.out.println(w.toString());
            }
            System.out.println("----------------------------------------------------------");
            for (var w : director.sortBySalary(ITCompany)) {
                System.out.println(w.getName() + " " + w.getSalary());
            }
        }
        catch (NullPointerException ex) {
            System.out.println(ex.getMessage());
        }

    }
}