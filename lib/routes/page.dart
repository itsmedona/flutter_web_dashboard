import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:web_application/routes/routes.dart';
import 'package:web_application/screens/company_screen/add_company.dart';
import 'package:web_application/screens/company_screen/comapny_menu.dart';
import 'package:web_application/screens/company_screen/company_modules.dart';
import 'package:web_application/screens/company_screen/company_leave_type.dart';
import 'package:web_application/screens/employee_screen/add_employee.dart';
import 'package:web_application/screens/employee_screen/employee_list_all.dart';
import 'package:web_application/screens/employee_screen/employee_menu.dart';
import 'package:web_application/screens/login_screen/login_screen.dart';
import 'package:web_application/screens/payroll/Allowance_list.dart';
import 'package:web_application/screens/payroll/add_allowance.dart';
import 'package:web_application/screens/payroll/add_company_allowance_details.dart';
import 'package:web_application/screens/payroll/add_company_deduction_details.dart';
import 'package:web_application/screens/payroll/add_deduction.dart';
import 'package:web_application/screens/payroll/add_max_leave_allowed.dart';
import 'package:web_application/screens/payroll/add_processing_date.dart';
import 'package:web_application/screens/payroll/company_payroll_allowance.dart';
import 'package:web_application/screens/payroll/company_payroll_deduction.dart';
import 'package:web_application/screens/payroll/max_leave_allowed.dart';
import 'package:web_application/screens/payroll/payroll_processing_date.dart';
import 'package:web_application/screens/profile_screen.dart/profile.dart';
import 'package:web_application/screens/settings_screen/add_department.dart';
import 'package:web_application/screens/settings_screen/add_designation.dart';
import 'package:web_application/screens/settings_screen/add_employement.dart';
import 'package:web_application/screens/settings_screen/add_industry.dart';
import 'package:web_application/screens/settings_screen/department_list.dart';
import 'package:web_application/screens/settings_screen/designation_list.dart';
import 'package:web_application/screens/settings_screen/employement_category.dart';
import 'package:web_application/screens/settings_screen/industry_list.dart';

import '../screens/company_screen/company_holiday_list.dart';
import '../screens/company_screen/list_all_screen.dart';
import '../screens/dashboard_screen/dashboard_screen.dart';
import '../screens/payroll/deduction_list.dart';



class GetPages {
  static const INITAL = Routes.LOGIN;

  static final routes = [
   // GetPage(name: Routes.SPLASH, page: () => const SplashScreen()),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginScreen(),
     // binding: AuthBinding(),
    transition: Transition.noTransition, 
    ),
    GetPage(
        name: Routes.COMAPANYMODULE,
        page: () => ComapnyModules(),
      transition: Transition.noTransition
        ),
    GetPage(
        name: Routes.COMPANYHOLIDAY,
        page: () => CompanyHolidayList(),
      transition: Transition.noTransition
        ),
        GetPage(
        name: Routes.ADDCOMPANY,
        page: () => AddCompany(),  
      transition: Transition.noTransition
        ),
    GetPage(
      name: Routes.DASHBOARD,
      page: () => DashboardScreen(),
    //  binding: HomeBinding(),
    transition: Transition.noTransition, 
    ),
     GetPage(
      name: Routes.PROFILE,
      page: () => ProfileSection(),
    //  binding: HomeBinding(),
    transition: Transition.noTransition, 
    ),
     GetPage(
      name: Routes.CLISTALL,
      page: () => ListAll(), 
    //  binding: HomeBinding(),
    transition: Transition.noTransition,
    ),
     GetPage(
      name: Routes.COMPANYLEAVETYPE,
      page: () => CompanyLeaveType(), 
    //  binding: HomeBinding(),
     transition: Transition.noTransition,
    ),
     GetPage(
      name: Routes.COMPANYMENU,
      page: () => ComapnyMenu(),  
    //  binding: HomeBinding(),
    transition: Transition.noTransition,
    ),
     GetPage(
      name: Routes.EmployeeListAll,
      page: () => EmployeeListAll(),  
    //  binding: HomeBinding(),
    transition: Transition.noTransition,
    ),
      GetPage(
        name: Routes.AddEmployee,
        page: () => AddEmployee(),  
      transition: Transition.noTransition
        ),
     GetPage(
      name: Routes.EmployeeMenu,
      page: () => EmployeeMenu(),   
    //  binding: HomeBinding(),
    transition: Transition.noTransition,
    ),



    ///payroll///
    


      GetPage(
      name: Routes.AllowanceList,
      page: () => AllowanceList(), 
    //  binding: HomeBinding(),
    transition: Transition.noTransition,
    ),
     GetPage(
      name: Routes.DeductionList,
      page: () => DeductionList(), 
    //  binding: HomeBinding(),
    transition: Transition.noTransition,
    ),
    
     GetPage(
      name: Routes.CompanyPayrollAllowance,
      page: () => CompanyPayrollAllowance(),  
    //  binding: HomeBinding(),
    transition: Transition.noTransition,
    ),
     GetPage(
      name: Routes.CompanyPayrollDeduction,
      page: () => CompanyPayrollDeduction(),   
    //  binding: HomeBinding(),
    transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.PayrollProcessingDate,
      page: () => PayrollProcessingDate(),    
    //  binding: HomeBinding(),
    transition: Transition.noTransition,
    ),
     GetPage(
      name: Routes.MaxLeaveAllowed,
      page: () => MaxLeaveAllowed(),    
    //  binding: HomeBinding(),
    transition: Transition.noTransition,
    ),
     GetPage(
      name: Routes.AddAllowanceType,
      page: () => AddAllowance(),    
    //  binding: HomeBinding(),
    transition: Transition.noTransition,
    ),
      GetPage(
      name: Routes.AddDeductionType,
      page: () => AddDeduction(),    
    //  binding: HomeBinding(),
    transition: Transition.noTransition,
    ),
     GetPage(
      name: Routes.AddCompanyAllowanceDetails,
      page: () => AddCompanyAllowanceDetails(),    
    //  binding: HomeBinding(),
    transition: Transition.noTransition,
    ),
     GetPage(
      name: Routes.AddCompanyDeductionDetails,
      page: () => AddCompanyDeductionDetails(),    
    //  binding: HomeBinding(),
    transition: Transition.noTransition,
    ),
     GetPage(
      name: Routes.AddProcessingDate,
      page: () => AddProcessingDate(),    
    //  binding: HomeBinding(),
    transition: Transition.noTransition,
    ),
      GetPage(
      name: Routes.AddMaxLeaveAllowed,
      page: () => AddMaxLeaveAllowed(),    
    //  binding: HomeBinding(),
    transition: Transition.noTransition,
    ),


    ///settings///

     GetPage(
      name: Routes.IndustryList,
      page: () => IndustryList(),     
    //  binding: HomeBinding(),
    transition: Transition.noTransition,
    ),
    
     GetPage(
      name: Routes.DepartmentList,
      page: () => DepartmentList(),     
    //  binding: HomeBinding(),
    transition: Transition.noTransition,
    ),
    
     GetPage(
      name: Routes.DesignationList,
      page: () => DesignationList(),     
    //  binding: HomeBinding(),
    transition: Transition.noTransition,
    ),
    
     GetPage(
      name: Routes.EmployementCategoryList,
      page: () => EmployementCategoryList(),     
    //  binding: HomeBinding(),
    transition: Transition.noTransition,
    ),
     GetPage(
      name: Routes.AddIndustry,
      page: () => AddIndustry(),     
    //  binding: HomeBinding(),
    transition: Transition.noTransition,
    ),
     GetPage(
      name: Routes.AddDepartment,
      page: () => AddDepartment(),     
    //  binding: HomeBinding(),
    transition: Transition.noTransition,
    ),
     GetPage(
      name: Routes.AddDesignation,
      page: () => AddDesignation(),     
    //  binding: HomeBinding(),
    transition: Transition.noTransition,
    ),
     GetPage(
      name: Routes.AddEmployementCategory,
      page: () => AddEmployementCategory(),     
    //  binding: HomeBinding(),
     transition: Transition.noTransition, 
    ),
  ];
}

// GoRouter appRouter() {
//   return GoRouter(
//     initialLocation: Routes.LOGIN,
//     errorPageBuilder: (context, state) => NoTransitionPage<void>(
//       key: state.pageKey,
//       child:   DashboardScreen(), 
//     ),
//     routes: [
//       // GoRoute(
//       //   path: RouteUri.splash,
//       //   pageBuilder: (context, state) => NoTransitionPage<void>(
//       //     key: state.pageKey,
//       //     child: const SplashScreen(),
//       //   ),
//       // ),
//       GoRoute(
//         path: Routes.LOGIN,
//         pageBuilder: (context, state) => NoTransitionPage<void>(
//           key: state.pageKey,
//           child: const LoginScreen(),
//         ),
//       ),
//       GoRoute(
//         path: Routes.DASHBOARD,
//         pageBuilder: (context, state) => NoTransitionPage<void>(
//           key: state.pageKey,
//           child:  DashboardScreen(),
//         ),
//       ),
//       GoRoute(
//         path: Routes.COMAPANYMODULE,
//         pageBuilder: (context, state) => NoTransitionPage<void>(
//           key: state.pageKey,
//           child: const ComapnyModules(),
//         ),
//       ),
//       GoRoute(
//         path: Routes.COMPANYHOLIDAY,
//         pageBuilder: (context, state) => NoTransitionPage<void>(
//           key: state.pageKey,
//           child: const CompanyHolidayList(),
//         ),
//       ),
//       GoRoute(
//         path: Routes.ADDCOMPANY,
//         pageBuilder: (context, state) => NoTransitionPage<void>(
//           key: state.pageKey,
//           child: const AddCompany(),
//         ),
//       ),
//       GoRoute(
//         path: Routes.PROFILE,
//         pageBuilder: (context, state) => NoTransitionPage<void>(
//           key: state.pageKey,
//           child:  ProfileSection(),
//         ),
//       ),
//       GoRoute(
//         path: Routes.CLISTALL,
//         pageBuilder: (context, state) => NoTransitionPage<void>(
//           key: state.pageKey,
//           child:  ListAll(),
//         ),
//       ),
//       GoRoute(
//         path: Routes.COMPANYLEAVETYPE,
//         pageBuilder: (context, state) => NoTransitionPage<void>(
//           key: state.pageKey,
//           child: const CompanyLeaveType(),
//         ),
//       ),
//       GoRoute(
//         path: Routes.COMPANYMENU,
//         pageBuilder: (context, state) => NoTransitionPage<void>(
//           key: state.pageKey,
//           child: const ComapnyMenu(),
//         ),
//       ),
//       GoRoute(
//         path: Routes.EmployeeListAll,
//         pageBuilder: (context, state) => NoTransitionPage<void>(
//           key: state.pageKey,
//           child:  EmployeeListAll(),
//         ),
//       ),
//       GoRoute(
//         path: Routes.AddEmployee,
//         pageBuilder: (context, state) => NoTransitionPage<void>(
//           key: state.pageKey,
//           child: const AddEmployee(),
//         ),
//       ),
//       GoRoute(
//         path: Routes.EmployeeMenu,
//         pageBuilder: (context, state) => NoTransitionPage<void>(
//           key: state.pageKey,
//           child: const EmployeeMenu(),
//         ),
//       ),
//       GoRoute(
//         path: Routes.PayrollListall,
//         pageBuilder: (context, state) => NoTransitionPage<void>(
//           key: state.pageKey,
//           child: const PayrollListall(),
//         ),
//       ),
//       GoRoute(
//         path: Routes.PayrollMaxleaveallowed,
//         pageBuilder: (context, state) => NoTransitionPage<void>(
//           key: state.pageKey,
//           child: const PayrollMaxleaveallowed(),
//         ),
//       ),
//       GoRoute(
//         path: Routes.PayrollHolidayList,
//         pageBuilder: (context, state) => NoTransitionPage<void>(
//           key: state.pageKey,
//           child: const PayrollHolidayList(),
//         ),
//       ),
//       GoRoute(
//         path: Routes.PayrollProcessing,
//         pageBuilder: (context, state) => NoTransitionPage<void>(
//           key: state.pageKey,
//           child: const PayrollProcessing(),
//         ),
//       ),
//       GoRoute(
//         path: Routes.PayrollProcessingDate,
//         pageBuilder: (context, state) => NoTransitionPage<void>(
//           key: state.pageKey,
//           child: const PayrollProcessingDate(),
//         ),
//       ),
//       GoRoute(
//           path: Routes.IndustryList,
//           pageBuilder: (context, state) => NoTransitionPage<void>(
//                 key: state.pageKey,
//                 child:  IndustryList(),
//               )),
//       GoRoute(
//         path: Routes.DepartmentList,
//         pageBuilder: (context, state) => NoTransitionPage<void>(
//           key: state.pageKey,
//           child:  DepartmentList(),
//         ),
//       ),
//       GoRoute(
//         path: Routes.DesignationList,
//         pageBuilder: (context, state) => NoTransitionPage<void>(
//           key: state.pageKey,
//           child:  DesignationList(),
//         ),
//       ),
//       GoRoute(
//         path: Routes.EmployementCategoryList,
//         pageBuilder: (context, state) => NoTransitionPage<void>(
//           key: state.pageKey,
//           child:  EmployementCategoryList(),
//         ),
//       ),
//       GoRoute(
//         path: Routes.AddIndustry,
//         pageBuilder: (context, state) => NoTransitionPage<void>(
//           key: state.pageKey,
//           child: const AddIndustry(),
//         ),
//       ),
//       GoRoute(
//         path: Routes.AddDepartment,
//         pageBuilder: (context, state) => NoTransitionPage<void>(
//           key: state.pageKey,
//           child: const AddDepartment(),
//         ),
//       ),
//       GoRoute(
//         path: Routes.AddDesignation,
//         pageBuilder: (context, state) => NoTransitionPage<void>(
//           key: state.pageKey,
//           child: const AddDesignation(),
//         ),
//       ),
//       GoRoute(
//         path: Routes.AddEmployementCategory,
//         pageBuilder: (context, state) => NoTransitionPage<void>(
//           key: state.pageKey,
//           child: const AddEmployementCategory(),
//         ),
//       ),
      // GoRoute(
      //     path: RouteUri.reset,
      //     pageBuilder: (context, state) => NoTransitionPage<void>(
      //           key: state.pageKey,
      //           child: const ResetPasswordScreen(),
      //         )),
      // GoRoute(
      //   path: RouteUri.error404,
      //   pageBuilder: (context, state) => NoTransitionPage<void>(
      //     key: state.pageKey,
      //     child: const Error404Screen(),
      //   ),
      // ),
      // GoRoute(
      //   path: RouteUri.error500,
      //   pageBuilder: (context, state) => NoTransitionPage<void>(
      //     key: state.pageKey,
      //     child: const Error500Screen(),
      //   ),
      // ),
      // GoRoute(
      //   path: RouteUri.maintanence,
      //   pageBuilder: (context, state) => NoTransitionPage<void>(
      //     key: state.pageKey,
      //     child: const MaintanenceScreen(),
      //   ),
      // ),
      // GoRoute(
      //   path: RouteUri.commingsoon,
      //   pageBuilder: (context, state) => NoTransitionPage<void>(
      //     key: state.pageKey,
      //     child: const CommingSoonScreen(),
      //   ),
      // ),
      // GoRoute(
      //   path: RouteUri.faqs,
      //   pageBuilder: (context, state) => NoTransitionPage<void>(
      //     key: state.pageKey,
      //     child: FAQSScreen(),
      //   ),
      // ),
      // GoRoute(
      //   path: RouteUri.profile,
      //   pageBuilder: (context, state) => NoTransitionPage<void>(
      //     key: state.pageKey,
      //     child: ProfileSection(),
      //   ),
      // ),
      // GoRoute(
      //   path: RouteUri.chatscreen,
      //   pageBuilder: (context, state) => NoTransitionPage<void>(
      //     key: state.pageKey,
      //     child: const ChatScreen(),
      //   ),
      // ),
    
    // redirect: (context, state) {
    //   if (unrestrictedRoutes.contains(state.matchedLocation)) {
    //     return null;
    //   } else if (publicRoutes.contains(state.matchedLocation)) {
    //     RouteUri.home;
    //     // Is public route.
    //     // if (userDataProvider.isUserLoggedIn()) {
    //     //   // User is logged in, redirect to home page.
    //     //   return RouteUri.home;
    //     // }
    //   } else {
    //     // Not public route.
    //     // if (!userDataProvider.isUserLoggedIn()) {
    //     // User is not logged in, redirect to login page.
    //     // return RouteUri.login;
    //     // }
    //     RouteUri.home;
    //   }

    //   return null;
    // },
  