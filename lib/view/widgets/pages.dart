import 'package:web_application/view/screens/payroll_screen/company_payroll_allow.dart';
import 'package:web_application/view/screens/payroll_screen/company_payroll_ded.dart';
import 'routes.dart';
import 'package:get/get.dart';
import 'package:web_application/view/screens/payroll_screen/allowance_list.dart';
import 'package:web_application/view/screens/payroll_screen/deduction_list.dart';
import 'package:web_application/view/screens/payroll_screen/max_leave_allotted.dart';
import 'package:web_application/view/screens/login_screen/login.dart';
import 'package:web_application/view/screens/payroll_screen/payroll_processing_date.dart';
import 'package:web_application/view/screens/employee_screen/employee_list.dart';
import 'package:web_application/view/screens/settings_screen/add_department.dart';
import 'package:web_application/view/screens/settings_screen/add_designation.dart';
import 'package:web_application/view/screens/settings_screen/add_emp_category.dart';
import 'package:web_application/view/screens/settings_screen/add_industry.dart';
import 'package:web_application/view/screens/company_screen/add_company.dart';
import 'package:web_application/view/screens/company_screen/company_list.dart';
import 'package:web_application/view/screens/dashboard_screen/dashboard.dart';
import 'package:web_application/view/screens/employee_screen/add_employee.dart';
import 'package:web_application/view/screens/profile_screen/profile_screen.dart';
import 'package:web_application/view/screens/settings_screen/department_list.dart';
import 'package:web_application/view/screens/settings_screen/designation_list.dart';
import 'package:web_application/view/screens/settings_screen/emp_category_list.dart';
import 'package:web_application/view/screens/settings_screen/industry_list.dart';
import 'package:web_application/view/screens/employee_screen/employee_menu.dart';

class GetPages {
  static const INITAL = Routes.LOGIN;

  static final routes = [
    GetPage(name: Routes.LOGIN, page: () => const LoginScreen()),
    GetPage(
      name: Routes.DASHBOARD,
      page: () => DashboardScreen(),
      //  binding: AuthBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
        name: Routes.PROFILE,
        page: () => ProfileSection(),
        transition: Transition.noTransition),

    /////Company Sub Menus///////
    GetPage(
        name: Routes.ComLISTALL,
        page: () => CompanyList(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.AddComp,
        page: () => AddCompany(),
        transition: Transition.noTransition),

    /////Settings Sub menus/////////
    GetPage(
        name: Routes.IndustryList,
        page: () => IndustryList(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.AddInd,
        page: () => AddIndustry(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.DepartmentList,
        page: () => DepartmentList(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.AddDep,
        page: () => AddDepartment(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.DesignationList,
        page: () => DesignationList(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.AddDesign,
        page: () => AddDesignation(),
        transition: Transition.noTransition),
//////Employee Sub menus/////
    GetPage(
        name: Routes.EmpList,
        page: () => EmployeeList(),
        transition: Transition.noTransition),
    GetPage(
      name: Routes.EmpMenu,
      page: () => EmployeeMenu(),
      transition: Transition.noTransition,
    ),
    GetPage(
        name: Routes.AddEmp,
        page: () => AddEmployee(),
        transition: Transition.noTransition),

    GetPage(
      name: Routes.EmpCategoryList,
      page: () => EmpCategoryList(),
      transition: Transition.noTransition,
    ),
    GetPage(
        name: Routes.AddEmpCat,
        page: () => AddEmpCategory(),
        transition: Transition.noTransition),
    //////Payroll Submenus//////

    GetPage(
        name: Routes.PayProcessDate,
        page: () => PayrollProcessingDate(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.AllowanceList,
        page: () => AllowanceList(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.DeductionList,
        page: () => DeductionList(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.MaxLeaveAllow,
        page: () => MaxLeaveAllowed(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.CompPayAllo,
        page: () => CompanyPayrollAllowance(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.CompPayDed,
        page: () => CompanyPayrollDeduction(),
        transition: Transition.noTransition),
  ];
}
