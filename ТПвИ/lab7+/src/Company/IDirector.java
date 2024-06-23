package Company;

import Staff.Worker;
import java.util.ArrayList;

// Интерфейс
public interface IDirector {
    int countWorkers(Company company);
    ArrayList<Worker> sortBySalary(Company company);
    ArrayList<Worker> searchByExp(Company company, int experience);
}