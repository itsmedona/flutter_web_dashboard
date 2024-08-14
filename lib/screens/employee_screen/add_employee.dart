import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_application/core/animations/entrance_fader.dart';
import 'package:web_application/core/constants/colors.dart';
import 'package:web_application/core/constants/dimens.dart';
import 'package:web_application/core/widgets/masterlayout/portal_master_layout.dart';
import 'package:web_application/core/widgets/sized_boxes.dart';
import 'package:web_application/screens/employee_screen/controller/employee_controller.dart';
import 'package:web_application/screens/employee_screen/widget/employee_form_widget.dart';

class AddEmployee extends StatelessWidget {
   AddEmployee({super.key});
 final screenController = Get.put(EmployeeController()); 
 //  final employeeCategoryController = Get.put(EmployeeCategoryController());  
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return PortalMasterLayout(
        body: EntranceFader(
            child: ListView(
      children: [
        Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 150,
                  color: AppColors.defaultColor.withOpacity(0.6),
                ),
                Align(
                  // heightFactor: 0.01,
                  child: Container(
                    height: 100,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    margin: EdgeInsets.all(kDefaultPadding),
                    decoration: BoxDecoration(
                        color: AppColors.bgGreyColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration( 
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                  image: AssetImage('assets/profile3.jpg'),
                                  fit: BoxFit.cover)),
                        ),
                        buildSizedboxW(kDefaultPadding),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Add Employee',  
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            buildSizedBoxH(kDefaultPadding * 3),
            screenSize.width >= kScreenWidthLg
                ? Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: kDefaultPadding,
                        vertical: kDefaultPadding + kTextPadding),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(flex: 4 , child: addemployee()), 
                        buildSizedboxW(kDefaultPadding),
                      ],
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: kDefaultPadding,
                        vertical: kDefaultPadding + kTextPadding),
                    child: Column(
                      children: [
                      addemployee(),
                        buildSizedBoxH(kDefaultPadding),
                      ],
                    ),
                  ),
          ],
        ),
      ],
    )));
  }

  Widget addemployee() {
    return Container(
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
          color: AppColors.bgGreyColor,
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Basic Information',
              style: GoogleFonts.montserrat(
                  fontSize: kDefaultPadding + kTextPadding,
                  fontWeight: FontWeight.bold)),
          buildSizedBoxH(kDefaultPadding),
          buildSizedBoxH(kDefaultPadding * 2),
          EmployeeFormWidget(), 
           
          buildSizedBoxH(kDefaultPadding * 3),
          Divider(indent: kDefaultPadding * 2, endIndent: kDefaultPadding * 2),
        ],
      ),
    );
  }
}
