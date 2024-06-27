import 'dart:math';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:web_application/view/widgets/routes.dart';
import 'package:web_application/view/widgets/sized_box.dart';
import 'package:web_application/view/widgets/card_header.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:web_application/core/animations/entrance_fader.dart';
import 'package:web_application/core/constants/color_constant.dart';
import 'package:web_application/core/constants/size_constants.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:web_application/controller/employee_list_controller.dart';
import 'package:web_application/view/widgets/master_layout/master_layout.dart';
import 'package:web_application/view/widgets/ui_components_widgets/ui_components_appbar.dart';

class EmployeeList extends StatelessWidget {
  EmployeeList({super.key});
  final _dataTableHorizontalScrollController = ScrollController();
  final EmployeeListController controller = Get.put(EmployeeListController());

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
                  title: 'Employee List',
                  subtitle: '',
                  icon: Icon(Icons.rocket),
                  buttonTitle: 'Add employee',
                  onClick: () {
                    Get.toNamed(Routes.AddEmp);
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
                bottom: kDefaultPadding / 2,
                top: kDefaultPadding,
              ),
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Padding(
                  padding: EdgeInsets.all(kDefaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CardHeader(
                        title: 'Employee Details',
                        showDivider: false,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            final double dataTableWidth =
                                max(kScreenWidthMd, constraints.maxWidth);
                            return Scrollbar(
                              controller: _dataTableHorizontalScrollController,
                              thumbVisibility: true,
                              trackVisibility: true,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                controller:
                                    _dataTableHorizontalScrollController,
                                child: SizedBox(
                                  width: dataTableWidth,
                                  child: Obx(() {
                                    return DataTable(
                                      border: TableBorder(
                                        verticalInside: BorderSide(width: 0.2),
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
                                                icon:
                                                    Icon(Icons.arrow_drop_down),
                                              ),
                                            ],
                                          ),
                                        ),
                                        DataColumn(
                                          label: Row(
                                            children: [
                                              Text('Emp_id'),
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
                                              Text('Emp_code'),
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
                                        controller.filteredEmployee.length,
                                        (index) {
                                          final employee = controller
                                              .filteredEmployee[index];
                                          return DataRow(
                                            cells: [
                                              DataCell(Text(employee.name)),
                                              DataCell(
                                                TextButton(
                                                  child: Text(employee.Emp_id),
                                                  onPressed: () {
                                                    _showDetailsDialog(context,
                                                        DialogType.info);
                                                  },
                                                ),
                                              ),
                                              DataCell(Text(employee.Emp_code)),
                                              DataCell(Text(employee.Status)),
                                              DataCell(
                                                  Text(employee.Mobilenumber)),
                                              DataCell(
                                                TextButton(
                                                  onPressed: () {
                                                    _showEmployeeDialog(context,
                                                        DialogType.info);
                                                    // Implement edit functionality here
                                                  },
                                                  child: Text(
                                                    'Edit',
                                                    style: TextStyle(
                                                      color:
                                                          AppColors.blackColor,
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
                                    );
                                  }),
                                ),
                              ),
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
}

void _showEmployeeDialog(BuildContext context, DialogType dialogType) {
  final screenWidth = MediaQuery.of(context).size.width;
  final dialogWidth = screenWidth * 0.7;
  final dialog = AwesomeDialog(
      alignment: Alignment.center,
      context: context,
      transitionAnimationDuration: const Duration(microseconds: 300),
      dialogType: dialogType,
      title: 'Employee Info',
      desc: '',
      body: Padding(
          padding: EdgeInsets.all(kDefaultPadding),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Basic Information',
                  style: GoogleFonts.montserrat(
                    fontSize: kDefaultPadding + kTextPadding,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                buildSizedBoxH(kDefaultPadding * 2),
                Row(
                  children: [
                    Flexible(
                      child: FormBuilderTextField(
                        name: 'First Name',
                        decoration: const InputDecoration(
                          labelText: 'First Name',
                          hintText: 'Andrews',
                          border: OutlineInputBorder(),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                        enableSuggestions: false,
                        keyboardType: TextInputType.name,
                        validator: FormBuilderValidators.required(),
                      ),
                    ),
                    buildSizedboxW(kDefaultPadding),
                    Flexible(
                      child: FormBuilderTextField(
                        name: 'Last Name',
                        decoration: const InputDecoration(
                          labelText: 'Last Name',
                          hintText: 'Xavier',
                          border: OutlineInputBorder(),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                        keyboardType: TextInputType.name,
                        validator: FormBuilderValidators.required(),
                      ),
                    ),
                  ],
                ),
                buildSizedBoxH(kDefaultPadding * 3),
                Row(
                  children: [
                    Flexible(
                      child: FormBuilderTextField(
                        name: 'Username',
                        decoration: const InputDecoration(
                          labelText: 'Username',
                          hintText: 'Username',
                          border: OutlineInputBorder(),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                        enableSuggestions: false,
                        keyboardType: TextInputType.name,
                        validator: FormBuilderValidators.required(),
                      ),
                    ),
                    buildSizedboxW(kDefaultPadding),
                    Flexible(
                      child: FormBuilderTextField(
                        name: 'password',
                        decoration: const InputDecoration(
                          labelText: 'password',
                          hintText: 'password',
                          border: OutlineInputBorder(),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                        keyboardType: TextInputType.name,
                        validator: FormBuilderValidators.required(),
                      ),
                    ),
                  ],
                ),
                buildSizedBoxH(kDefaultPadding * 3),
                Row(
                  children: [
                    Flexible(
                      child: FormBuilderTextField(
                        name: 'Employee ID',
                        decoration: const InputDecoration(
                          labelText: 'Employee ID',
                          hintText: 'Employee ID',
                          border: OutlineInputBorder(),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                        enableSuggestions: false,
                        keyboardType: TextInputType.name,
                        validator: FormBuilderValidators.required(),
                      ),
                    ),
                    buildSizedboxW(kDefaultPadding),
                    Flexible(
                      child: FormBuilderTextField(
                        name: 'Biometric ID',
                        decoration: const InputDecoration(
                          labelText: 'Biometric ID',
                          hintText: 'Biometric ID',
                          border: OutlineInputBorder(),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                        keyboardType: TextInputType.name,
                        validator: FormBuilderValidators.required(),
                      ),
                    ),
                  ],
                ),
                buildSizedBoxH(kDefaultPadding * 2),
                FormBuilderTextField(
                  name: 'Company Name',
                  decoration: const InputDecoration(
                    labelText: 'Company Name',
                    hintText: 'ABC Info Solutions',
                    border: OutlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  enableSuggestions: false,
                  validator: FormBuilderValidators.required(),
                ),
                buildSizedBoxH(kDefaultPadding * 3),
                Row(
                  children: [
                    Flexible(
                      child: FormBuilderTextField(
                        name: 'Department',
                        decoration: const InputDecoration(
                          labelText: 'Department',
                          hintText: 'Sales',
                          border: OutlineInputBorder(),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                        enableSuggestions: false,
                        keyboardType: TextInputType.text,
                        validator: FormBuilderValidators.required(),
                      ),
                    ),
                    buildSizedboxW(kDefaultPadding),
                    Flexible(
                      child: FormBuilderTextField(
                        name: 'Designation',
                        decoration: const InputDecoration(
                          labelText: 'Designation',
                          hintText: 'Designation',
                          border: OutlineInputBorder(),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                        keyboardType: TextInputType.text,
                        validator: FormBuilderValidators.required(),
                      ),
                    ),
                  ],
                ),
                buildSizedBoxH(kDefaultPadding * 3),
                Row(
                  children: [
                    Flexible(
                      child: FormBuilderTextField(
                        name: 'Reporting To',
                        decoration: const InputDecoration(
                          labelText: 'Reporting to',
                          hintText: ' ',
                          border: OutlineInputBorder(),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                        enableSuggestions: false,
                        keyboardType: TextInputType.text,
                        validator: FormBuilderValidators.required(),
                      ),
                    ),
                    buildSizedboxW(kDefaultPadding),
                    Flexible(
                      child: FormBuilderTextField(
                        name: 'User Type',
                        decoration: const InputDecoration(
                          labelText: 'User Type',
                          hintText: ' ',
                          border: OutlineInputBorder(),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                        keyboardType: TextInputType.text,
                        validator: FormBuilderValidators.required(),
                      ),
                    ),
                  ],
                ),
                buildSizedBoxH(kDefaultPadding * 3),
                Divider(
                  indent: kDefaultPadding * 2,
                  endIndent: kDefaultPadding * 2,
                ),
                buildSizedBoxH(kDefaultPadding * 3),
                Text(
                  'Detailed Information',
                  style: GoogleFonts.montserrat(
                    fontSize: kDefaultPadding + kTextPadding,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                buildSizedBoxH(kDefaultPadding * 2),
                Row(
                  children: [
                    Flexible(
                      child: FormBuilderTextField(
                        name: 'Father Name',
                        decoration: const InputDecoration(
                          labelText: 'Father Name',
                          hintText: 'Father Name',
                          border: OutlineInputBorder(),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                        enableSuggestions: false,
                        keyboardType: TextInputType.name,
                        validator: FormBuilderValidators.required(),
                      ),
                    ),
                    buildSizedboxW(kDefaultPadding),
                    Flexible(
                      child: FormBuilderTextField(
                        name: 'Mother Name',
                        decoration: const InputDecoration(
                          labelText: 'Mother Name',
                          hintText: 'Mother Name',
                          border: OutlineInputBorder(),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                        keyboardType: TextInputType.name,
                        validator: FormBuilderValidators.required(),
                      ),
                    ),
                  ],
                ),
                buildSizedBoxH(kDefaultPadding * 2),
                FormBuilderTextField(
                  name: 'Address',
                  decoration: const InputDecoration(
                    labelText: 'Address',
                    hintText: 'A-xyz test near test',
                    border: OutlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  enableSuggestions: false,
                  validator: FormBuilderValidators.required(),
                ),
                buildSizedBoxH(kDefaultPadding * 2),
                Row(
                  children: [
                    Flexible(
                      child: FormBuilderTextField(
                        name: 'Date of Birth',
                        decoration: const InputDecoration(
                          labelText: 'Date of Birth',
                          hintText: 'dd/mm/yyyy',
                          border: OutlineInputBorder(),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                        enableSuggestions: false,
                        keyboardType: TextInputType.name,
                        validator: FormBuilderValidators.required(),
                      ),
                    ),
                    buildSizedboxW(kDefaultPadding),
                    Flexible(
                      child: FormBuilderTextField(
                        name: 'Phone Number',
                        decoration: const InputDecoration(
                          labelText: 'Phone Number',
                          hintText: '+91 9876543210',
                          border: OutlineInputBorder(),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                        keyboardType: TextInputType.name,
                        validator: FormBuilderValidators.required(),
                      ),
                    ),
                  ],
                ),
                buildSizedBoxH(kDefaultPadding * 2),
                Row(
                  children: [
                    Flexible(
                      child: FormBuilderTextField(
                        name: 'Joining Date',
                        decoration: const InputDecoration(
                          labelText: 'Joining Date',
                          hintText: '01/06/2024',
                          border: OutlineInputBorder(),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                        enableSuggestions: false,
                        keyboardType: TextInputType.name,
                        validator: FormBuilderValidators.required(),
                      ),
                    ),
                    buildSizedboxW(kDefaultPadding),
                    Flexible(
                      child: FormBuilderTextField(
                        name: 'Is Active',
                        decoration: const InputDecoration(
                          labelText: 'Is Active',
                          hintText: 'Yes/No',
                          border: OutlineInputBorder(),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                        keyboardType: TextInputType.name,
                        validator: FormBuilderValidators.required(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
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
      title: 'Employee Info',
      desc: '',
      body: Padding(
        padding: EdgeInsets.all(kDefaultPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Basic information',
                  style: GoogleFonts.montserrat(
                      fontSize: kDefaultPadding + kTextPadding,
                      fontWeight: FontWeight.w800)),
              Divider(),
              Row(
                children: [
                  Expanded(
                      child: Text('First Name:',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500))),
                  Expanded(
                      child: Text('Last Name:',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500))),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Text('User name:',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500))),
                  Expanded(
                      child: Text('Password:',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500))),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Text('Employee ID:',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500))),
                  Expanded(
                      child: Text('Biometric ID:',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500))),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Text('Company Name:',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500))),
                  Expanded(
                      child: Text('Designation:',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500))),
                ],
              ),
              buildSizedBoxH(kDefaultPadding),
              Text('Detailed information',
                  style: GoogleFonts.montserrat(
                      fontSize: kDefaultPadding + kTextPadding,
                      fontWeight: FontWeight.w800)),
              Divider(),
              Row(
                children: [
                  Expanded(
                      child: Text('Fathers name:',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500))),
                  Expanded(
                      child: Text('Mothers Name:',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500))),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Text('Address:',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500))),
                  Expanded(
                      child: Text('Date of Birth:',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500))),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Text('Joining Date:',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500))),
                  Expanded(
                      child: Text('Is Active:',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500))),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Text('Address:',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500))),
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
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              padding: EdgeInsets.zero,
              backgroundColor: AppColors
                  .defaultColor 
              ),

          onPressed: () {
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'OK',
              style: TextStyle(color: AppColors.whiteColor),
            ),
          ),
        ),
      ));

  dialog.show();
}
