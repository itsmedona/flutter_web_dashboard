import 'dart:math';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_application/core/animations/entrance_fader.dart';
import 'package:web_application/core/constants/colors.dart';
import 'package:web_application/core/constants/dimens.dart';
import 'package:web_application/core/widgets/masterlayout/portal_master_layout.dart';
import 'package:web_application/core/widgets/ui_component_appbar.dart';
import 'package:web_application/models/designation_model.dart';
import 'package:web_application/routes/routes.dart';
import 'package:web_application/screens/settings_screen/controller/designation_controller.dart';

import '../../core/widgets/sized_boxes.dart';

class DesignationList extends StatelessWidget {
  DesignationList({super.key});
  final _dataTableHorizontalScrollController = ScrollController();
  final screenController = Get.put(DesignationController());
  @override
  Widget build(BuildContext context) {
    return PortalMasterLayout(
        body: EntranceFader(
            child: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          child: UIComponenetsAppBar(
            title: 'Designation List',
            subtitle: '',
            icon: Icon(Icons.rocket),
            buttonTitle: 'Add Designation',
            onClick: () {
              Get.toNamed(Routes.AddDesignation);
            },
          ),
        ),
        buildSizedBoxH(kDefaultPadding),
        Padding(
            padding: EdgeInsets.only(
                bottom: kDefaultPadding / 2,
                top: kDefaultPadding,
                left: kDefaultPadding / 2,
                right: kDefaultPadding / 2),
            child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: AppColors.bgGreyColor,
                    spreadRadius: 5,
                    blurRadius: 7)
              ]),
              child: Card(
                color: AppColors.whiteColor,
                clipBehavior: Clip.antiAlias,
                child: Padding(
                  padding: EdgeInsets.all(kDefaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // CardHeader(
                      //   title: 'Company Details',
                      //   showDivider: false,
                      // ),
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
                                  child: Obx(
                                    () => DataTable(
                                      border: TableBorder(
                                          verticalInside:
                                              BorderSide(width: 0.5),
                                          top: BorderSide(width: 0.5),
                                          right: BorderSide(width: 0.5),
                                          left: BorderSide(width: 0.5),
                                          bottom: BorderSide(width: 0.5)),
                                      dividerThickness: 2,
                                      sortColumnIndex: 0,
                                      sortAscending: true,
                                      showCheckboxColumn: false,
                                      showBottomBorder: true,
                                      columns: [
                                        DataColumn(
                                            // numeric: true,
                                            label: Row(
                                          children: [
                                            Text('#'),

                                            //  IconButton(
                                            //      onPressed: () {},
                                            //      icon: Icon(Icons.arrow_drop_down ))
                                          ],
                                        )),
                                        DataColumn(
                                            // numeric: true,
                                            label: Row(
                                          children: [
                                            Text('Category'),

                                            //  IconButton(
                                            //      onPressed: () {},
                                            //      icon: Icon(Icons.arrow_drop_down ))
                                          ],
                                        )),
                                        DataColumn(
                                            label: Row(
                                          children: [
                                            Text('Designation Name'),
                                            //  IconButton(
                                            //      onPressed: () {},
                                            //      icon: Icon(Icons.arrow_drop_down_sharp))
                                          ],
                                        )),
                                        DataColumn(
                                            label: Row(
                                          children: [
                                            Text('Designation List'),
                                            //  IconButton(
                                            //      onPressed: () {},
                                            //      icon: Icon(Icons.arrow_drop_down_sharp))
                                          ],
                                        )),
                                        DataColumn(
                                            label: Row(
                                          children: [
                                            Text('Status'),
                                            //  IconButton(
                                            //      onPressed: () {},
                                            //      icon: Icon(Icons.arrow_drop_down_sharp))
                                          ],
                                        )),
                                        DataColumn(
                                            label: Row(
                                          children: [
                                            //  Text('Status'),
                                            //  IconButton(
                                            //      onPressed: () {},
                                            //      icon: Icon(Icons.arrow_drop_down_sharp))
                                          ],
                                        )),
                                      ],
                                      rows: List.generate(
                                          screenController.designations.length,
                                          (index) {
                                        var designations = screenController
                                            .designations[index];
                                        return DataRow.byIndex(
                                          index: index,
                                          cells: [
                                            DataCell(Text('#${index + 1}')),
                                            const DataCell(Text('2022-06-30')),
                                            DataCell(
                                                Text(designations.designation)),
                                            DataCell(Text(
                                                '${Random().nextInt(50)}')),
                                            DataCell(Text(
                                                '${Random().nextInt(100)}')),
                                            DataCell(TextButton(
                                                onPressed: () {
                                                  showEditDialog(
                                                      context,
                                                      DialogType.info,
                                                      index,
                                                      designations);
                                                },
                                                child: const Text(
                                                  'Edit',
                                                  style: TextStyle(
                                                      color:
                                                          AppColors.blackColor,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )))
                                            // DataCell(Text(
                                            //     '${Random().nextInt(10000)}')),
                                          ],
                                        );
                                      }),
                                    ),
                                  ),
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
            )),
      ],
    )));
  }

  void showEditDialog(BuildContext context, DialogType dialogType, int index,
      Designation designation) {
    final screenWidth = MediaQuery.of(context).size.width;
    TextEditingController nameController =
        TextEditingController(text: designation.designation);
    final dialogWidth = screenWidth * 0.8;
    final dialog = AwesomeDialog(
        alignment: Alignment.center,
        context: context,
        transitionAnimationDuration: const Duration(microseconds: 300),
        dialogType: dialogType,
        title: 'Update Designation',
        desc: '',
        body: Padding(
          padding: EdgeInsets.all(kDefaultPadding),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                padding: EdgeInsets.all(kDefaultPadding),
               // decoration: BoxDecoration(color: AppColors.bgGreyColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Update Designation',
                        style: GoogleFonts.montserrat(
                            fontSize: kDefaultPadding + kTextPadding,
                            fontWeight: FontWeight.bold)),
                    buildSizedBoxH(kDefaultPadding * 2),
                    FormBuilder(
                      //  key: _formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Flexible(
                                child: FormBuilderTextField(
                                  name: 'Category/Industry',
                                  decoration: InputDecoration(
                                    labelText: 'Category/Industry',
                                    // hintText: 'test.user',
                                    // helperText: '* To test registration fail: admin',
                                    border: const OutlineInputBorder(),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                  ),
                                  enableSuggestions: false,
                                  validator: FormBuilderValidators.required(),
                                  // onSaved: (value) => (_formData.username = value ?? ''),
                                ),
                              ),
                              buildSizedboxW(kDefaultPadding),
                              Flexible(
                                child: FormBuilderTextField(
                                  name: 'Department Name',
                                  
                                  decoration: InputDecoration(
                                    labelText: 'Department Name',
                                    // hintText: 'test.user',
                                    // helperText: '* To test registration fail: admin',
                                    border: const OutlineInputBorder(),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                  ),
                                  enableSuggestions: false,
                                  validator: FormBuilderValidators.required(),
                                  // onSaved: (value) => (_formData.username = value ?? ''),
                                ),
                              ),
                            ],
                          ),
                          buildSizedBoxH(kDefaultPadding * 3),
                          Row(
                            children: [
                              Flexible(
                                child: FormBuilderTextField(
                                  name: 'Designation Name',
                                  controller:
                                    nameController, 
                                  decoration: InputDecoration(
                                    labelText: 'Designation Name',
                                    // hintText: 'test.user',
                                    // helperText: '* To test registration fail: admin',
                                    border: const OutlineInputBorder(),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                  ),
                                  enableSuggestions: false,
                                  validator: FormBuilderValidators.required(),
                                  // onSaved: (value) => (_formData.username = value ?? ''),
                                ),
                              ),
                              buildSizedboxW(kDefaultPadding),
                              Flexible(
                                child: FormBuilderTextField(
                                  name: 'Status',
                                  controller: screenController.statusController,
                                  decoration: InputDecoration(
                                    labelText: 'Status',
                                    // hintText: 'test@gmail.com',
                                    border: const OutlineInputBorder(),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  validator: FormBuilderValidators.required(),
                                  // onSaved: (value) => (_formData.email = value ?? ''),
                                ),
                              ),
                            ],
                          ),
                          buildSizedBoxH(kDefaultPadding * 3),
                          Row(
                            children: [
                              Flexible(
                                child: FormBuilderTextField(
                                  name: 'Remarks',

                                  controller:
                                      screenController.remarksController,
                                  decoration: const InputDecoration(
                                    labelText: 'Remarks',
                                    hintText: 'Test',
                                    border: OutlineInputBorder(),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                  ),
                                  enableSuggestions: false,
                                  keyboardType: TextInputType.name,
                                  validator: FormBuilderValidators.required(),
                                  // onSaved: (value) => (_formData.firstname = value ?? ''),
                                ),
                              ),
                              buildSizedboxW(kDefaultPadding),
                            ],
                          ),
                          buildSizedBoxH(kDefaultPadding * 3),
                          buildSizedBoxH(kDefaultPadding * 3),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              buildSizedBoxH(kDefaultPadding),
            ]),
          ),
        ),
        //  width: dialogWidth,
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
              designation.designation = nameController.text;
              screenController.updateDesignation(designation);
              Get.off(() => DesignationList());
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Update',
                style: TextStyle(color: AppColors.whiteColor),
              ),
            ),
            // onPressed: widget.onClick
          ),
        ));

    dialog.show();
  }
}
