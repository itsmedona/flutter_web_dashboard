import 'package:get/get.dart';

class Company {
  final String name;
  final String Comp_id;
  final String Comp_code;
  final String Status;
  final String Whatsapp;
  final String Mobilenumber;

  Company({
    required this.name,
    required this.Comp_id,
    required this.Comp_code,
    required this.Status,
    required this.Whatsapp,
    required this.Mobilenumber,
  });
}

class CompanyListController extends GetxController {
  var companies = <Company>[].obs;
  var filteredCompany = <Company>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCompanies();
  }

  void fetchCompanies() {
    // Fetch or initialize company data
    var companyList = [
      Company(
        name: 'Company A',
        Comp_id: '001',
        Comp_code: 'A001',
        Status: 'Active',
        Whatsapp: '1234567890',
        Mobilenumber: '0987654321',
      ),
      Company(
        name: 'Company B',
        Comp_id: '002',
        Comp_code: 'B002',
        Status: 'Inactive',
        Whatsapp: '1234567891',
        Mobilenumber: '0987654322',
      ),
      Company(
        name: 'Company C',
        Comp_id: '003',
        Comp_code: 'C003',
        Status: 'Active',
        Whatsapp: '1234567892',
        Mobilenumber: '0987654323',
      ),
      Company(
        name: 'Company D',
        Comp_id: '004',
        Comp_code: 'D004',
        Status: 'Inactive',
        Whatsapp: '1234567893',
        Mobilenumber: '0987654324',
      ),
    ];

    companies.assignAll(companyList);
    filteredCompany.assignAll(companyList);
  }

  void filterCompanies(String status) {
    if (status.isEmpty) {
      filteredCompany.assignAll(companies);
    } else {
      filteredCompany.assignAll(
        companies.where((company) => company.Status == status).toList(),
      );
    }
  }

  void addCompany(Company company) {
    companies.add(company);
    filteredCompany.add(company);
  }

  void editCompany(int index, Company company) {
    companies[index] = company;
    filteredCompany[index] = company;
  }

  void deleteCompany(int index) {
    companies.removeAt(index);
    filteredCompany.removeAt(index);
  }
}
