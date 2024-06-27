import 'dart:math';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_application/controller/company_list_controller.dart';
import 'package:web_application/core/animations/entrance_fader.dart';
import 'package:web_application/core/constants/color_constant.dart';
import 'package:web_application/core/constants/size_constants.dart';
import 'package:web_application/view/widgets/card_header.dart';
import 'package:web_application/view/widgets/company_list_widget.dart';
import 'package:web_application/view/widgets/master_layout/master_layout.dart';
import 'package:web_application/view/widgets/routes.dart';
import 'package:web_application/view/widgets/sized_box.dart';
import 'package:web_application/view/widgets/ui_components_widgets/ui_components_appbar.dart';

class CompanyList extends StatelessWidget {
  CompanyList({super.key});
  final CompanyListController companyController =
      Get.put(CompanyListController());
  final _dataTableHorizontalScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return PortalMasterLayout(
      body: EntranceFader(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              child: Container(
                child: UIComponenetsAppBar(
                  title: 'Total Companies : 4',
                  subtitle: '',
                  icon: Icon(Icons.rocket),
                  buttonTitle: 'Add Company',
                  onClick: () {
                    Get.toNamed(Routes.AddComp);
                  },
                ),
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: AppColors.blackColor.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                  ),
                ]),
              ),
            ),
            buildSizedBoxH(kDefaultPadding),
            Padding(
              padding: EdgeInsets.only(
                  bottom: kDefaultPadding / 2, top: kDefaultPadding),
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor, // Changed to white
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.blackColor.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        //offset: Offset(0, 3), // Shadow position
                      ),
                    ],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.all(kDefaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CardHeader(
                        title: 'Company Details',
                        showDivider: false,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            final double dataTableWidth =
                                max(kScreenWidthMd, constraints.maxWidth);

                            return Column(
                              children: [
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  controller:
                                      _dataTableHorizontalScrollController,
                                  child: SizedBox(
                                    width: dataTableWidth,
                                    child: Container(
                                      child: DataTable(
                                        border: TableBorder(
                                          verticalInside:
                                              BorderSide(width: 0.2),
                                          top: BorderSide(width: 0.5),
                                          right: BorderSide(width: 0.5),
                                          left: BorderSide(width: 0.5),
                                          bottom: BorderSide(width: 0.5),
                                        ),
                                        dividerThickness: 2,
                                        sortColumnIndex: 0,
                                        sortAscending: true,
                                        showCheckboxColumn: false,
                                        showBottomBorder: true,
                                        columns: [
                                          DataColumn(
                                            label: Row(
                                              children: [
                                                Text('Name'),
                                                IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                      Icons.arrow_drop_down),
                                                ),
                                              ],
                                            ),
                                          ),
                                          DataColumn(
                                            label: Row(
                                              children: [
                                                Text('Comp_Id'),
                                                IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(Icons
                                                      .arrow_drop_down_sharp),
                                                ),
                                              ],
                                            ),
                                          ),
                                          DataColumn(
                                            label: Row(
                                              children: [
                                                Text('Comp_Code'),
                                                IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(Icons
                                                      .arrow_drop_down_sharp),
                                                ),
                                              ],
                                            ),
                                          ),
                                          DataColumn(
                                            label: Row(
                                              children: [
                                                Text('Status'),
                                                IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(Icons
                                                      .arrow_drop_down_sharp),
                                                ),
                                              ],
                                            ),
                                          ),
                                          DataColumn(
                                            label: Row(
                                              children: [
                                                Text('WhatsApp'),
                                                IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(Icons
                                                      .arrow_drop_down_sharp),
                                                ),
                                              ],
                                            ),
                                          ),
                                          DataColumn(
                                            label: Row(
                                              children: [
                                                Text('Mob_no'),
                                                IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(Icons
                                                      .arrow_drop_down_sharp),
                                                ),
                                              ],
                                            ),
                                          ),
                                          DataColumn(
                                            label: Text(''),
                                          ),
                                        ],
                                        rows: List<DataRow>.generate(
                                          companyController
                                              .filteredCompany.length,
                                          (index) {
                                            return DataRow(
                                              cells: [
                                                DataCell(
                                                  Text(companyController
                                                      .filteredCompany[index]
                                                      .name),
                                                ),
                                                DataCell(
                                                  GestureDetector(
                                                    onTap: () {
                                                      print('tapped');
                                                      _showDetailsDialog(
                                                          context,
                                                          DialogType.info);
                                                    },
                                                    child: Text(
                                                        companyController
                                                            .filteredCompany[
                                                                index]
                                                            .Comp_id),
                                                  ),
                                                ),
                                                DataCell(Text(companyController
                                                    .filteredCompany[index]
                                                    .Comp_code)),
                                                DataCell(Text(companyController
                                                    .filteredCompany[index]
                                                    .Status)),
                                                DataCell(Text(companyController
                                                    .filteredCompany[index]
                                                    .Whatsapp)),
                                                DataCell(Text(companyController
                                                    .filteredCompany[index]
                                                    .Mobilenumber)),
                                                DataCell(
                                                  TextButton(
                                                    onPressed: () {
                                                      _showEditDialog(
                                                          context,
                                                          DialogType.info,
                                                          companyController,
                                                          index);
                                                    },
                                                    child: Text(
                                                      'Edit',
                                                      style: TextStyle(
                                                        color: AppColors
                                                            .blackColor,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Scrollbar(
                                  controller:
                                      _dataTableHorizontalScrollController,
                                  thumbVisibility: true,
                                  trackVisibility: true,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    controller:
                                        _dataTableHorizontalScrollController,
                                    child: SizedBox(
                                      width: dataTableWidth,
                                      child:
                                          Container(), // Empty container to hold the scrollbar
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context, DialogType dialogType) {
    final dialog = AwesomeDialog(
      context: context,
      transitionAnimationDuration: const Duration(microseconds: 300),
      dialogType: dialogType,
      title: 'Dialog Title',
      desc: 'Dialog body...',
      width: kDialogWidth,
      btnOkOnPress: () {
        Get.back();
      },
      btnCancelOnPress: () {},
      body: Center(
        child: Text("Updated Successfully"),
      ),
    );
    dialog.show();
  }

  void _showDetailsDialog(BuildContext context, DialogType dialogType) {
    final screenWidth = MediaQuery.of(context).size.width;
    final dialogWidth = screenWidth * 0.7;
    final dialog = AwesomeDialog(
      alignment: Alignment.center,
      context: context,
      transitionAnimationDuration: const Duration(microseconds: 300),
      dialogType: dialogType,
      title: 'Company Info',
      desc: '',
      body: Padding(
        padding: EdgeInsets.all(kDefaultPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Basic information',
                style: GoogleFonts.montserrat(
                  fontSize: kDefaultPadding + kTextPadding,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Divider(),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Company Id:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Company Code:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Company Name:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Industry/Category:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Status:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Group Name:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              buildSizedBoxH(kDefaultPadding),
              Text(
                'Detailed Information',
                style: GoogleFonts.montserrat(
                  fontSize: kDefaultPadding + kTextPadding,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Divider(),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Legal Name:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Founder/Owner:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Email:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Pan:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'WhatsApp:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Phone Number:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Address:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  // Expanded(child: Text('Landmark:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Landmark:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  // Expanded(child: Text('Landmark:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'City:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'State:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Country:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'VAT Number:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'VAT Rate:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'GST Number:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'GST Compounding:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Expanded(child: SizedBox.shrink()),
                ],
              ),
            ],
          ),
        ),
      ),
      width: dialogWidth,
      btnOkOnPress: () {},
      btnOk: Container(
        alignment: Alignment.bottomRight,
        width: 150,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            padding: EdgeInsets.zero,
            backgroundColor: AppColors.defaultColor,
          ),
          onPressed: () {
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'OK ',
              style: TextStyle(color: AppColors.whiteColor),
            ),
          ),
        ),
      ),
    );

    dialog.show();
  }

  void _showEditDialog(BuildContext context, DialogType dialogType,
      CompanyListController controller, int index) {
    TextEditingController namecontroller =
        TextEditingController(text: controller.filteredCompany[index].name);
    TextEditingController idcontroller =
        TextEditingController(text: controller.filteredCompany[index].Comp_id);
    TextEditingController codecontroller = TextEditingController(
        text: controller.filteredCompany[index].Comp_code);
    TextEditingController statuscontroller =
        TextEditingController(text: controller.filteredCompany[index].Status);
    TextEditingController whatsappcontroller =
        TextEditingController(text: controller.filteredCompany[index].Whatsapp);
    TextEditingController mobcontroller = TextEditingController(
        text: controller.filteredCompany[index].Mobilenumber);
    final screenWidth = MediaQuery.of(context).size.width;
    final dialogWidth = screenWidth * 0.7;
    final dialog = AwesomeDialog(
        alignment: Alignment.center,
        context: context,
        transitionAnimationDuration: const Duration(microseconds: 300),
        dialogType: dialogType,
        title: 'Company Info',
        desc: '',
        body: Padding(
          padding: EdgeInsets.all(kDefaultPadding),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Basic Information',
                  style: GoogleFonts.montserrat(
                      fontSize: kDefaultPadding + kTextPadding,
                      fontWeight: FontWeight.bold)),
              buildSizedBoxH(kDefaultPadding),
              CompanyListWidget(
                companyIdController: idcontroller,
                companyCodeController: codecontroller,
                companyNameController: namecontroller,
                statusController: statuscontroller,
                whatsappController: whatsappcontroller,
                phoneNumberController: mobcontroller,
                industryController: TextEditingController(),
                groupNameController: TextEditingController(),
                legalNameController: TextEditingController(),
                founderController: TextEditingController(),
                emailController: TextEditingController(),
                panController: TextEditingController(),
                addressController: TextEditingController(),
                landmarkController: TextEditingController(),
                cityController: TextEditingController(),
                stateController: TextEditingController(),
                countryController: TextEditingController(),
              )
            ]),
          ),
        ),
        width: dialogWidth,
        btnOkOnPress: () {},
        btnOk: Container(
          alignment: Alignment.bottomRight,
          width: 150,
          //  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                // fixedSize: const Size.fromHeight(3),
                padding: EdgeInsets.zero,
                backgroundColor: AppColors
                    .defaultColor // Change this color to your desired color
                ),
            onPressed: () {
              _showDialog(context, DialogType.success);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Update ',
                style: TextStyle(color: AppColors.whiteColor),
              ),
            ),
          ),
        ));

    dialog.show();
  }
}
