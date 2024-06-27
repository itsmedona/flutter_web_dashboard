import 'package:get/get.dart';

class Employee {
  final String name;
  final String Emp_id;
  final String Emp_code;
  final String Status;
  final String Mobilenumber;

  Employee({
    required this.name,
    required this.Emp_id,
    required this.Emp_code,
    required this.Status,
    required this.Mobilenumber,
  });
}

class EmployeeListController extends GetxController {
  var employees = <Employee>[].obs;
  var filteredEmployee = <Employee>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchEmployees();
  }

  void fetchEmployees() {
    // Fetch or initialize company data
    var employeeList = [
      Employee(
        name: 'Praveen',
        Emp_id: '001',
        Emp_code: 'E001',
        Status: 'Active',
        Mobilenumber: '0987654321',
      ),
      Employee(
        name: 'Tojo',
        Emp_id: '002',
        Emp_code: 'E002',
        Status: 'Active',
        Mobilenumber: '0987654322',
      ),
      Employee(
        name: 'Alona',
        Emp_id: '003',
        Emp_code: 'E003',
        Status: 'Active',
        Mobilenumber: '0987654323',
      ),
     Employee(
        name: 'Gayathri',
        Emp_id: '004',
        Emp_code: 'E004',
        Status: 'Active',
        Mobilenumber: '0987654324',
      ),
    ];

    employees.assignAll(employeeList);
    filteredEmployee.assignAll(employeeList);
  }

  void filterEmployee(String status) {
    if (status.isEmpty) {
      filteredEmployee.assignAll(employees);
    } else {
      filteredEmployee.assignAll(
        employees.where((employee) => employee.Status == status).toList(),
      );
    }
  }

  void addEmployee(Employee employee) {
    employees.add(employee);
    filteredEmployee.add(employee);
  }

  void editEmployee(int index, Employee employee) {
    employees[index] = employee;
    filteredEmployee[index] = employee;
  }

  void deleteEmployee(int index) {
    employees.removeAt(index);
    filteredEmployee.removeAt(index);
  }
}
