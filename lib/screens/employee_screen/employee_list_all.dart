import 'dart:math';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_application/core/animations/entrance_fader.dart';
import 'package:web_application/core/constants/colors.dart';
import 'package:web_application/core/constants/dimens.dart';
import 'package:web_application/core/widgets/card_header.dart';
import 'package:web_application/core/widgets/dialog_widgets.dart';
import 'package:web_application/core/widgets/masterlayout/portal_master_layout.dart';
import 'package:web_application/core/widgets/sized_boxes.dart';
import 'package:web_application/core/widgets/ui_component_appbar.dart';
import 'package:web_application/routes/routes.dart';
import 'package:web_application/screens/employee_screen/controller/employee_controller.dart';

class EmployeeListAll extends StatelessWidget {
  EmployeeListAll({super.key});
  final screenController = Get.put(EmployeeController());
  final _dataTableHorizontalScrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return PortalMasterLayout(
        body: EntranceFader(
            child: ListView(
      children: [
        Padding( 
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          child: UIComponenetsAppBar(
            title: 'Total Employee : ${screenController.users.length}',
            subtitle: '', 
            icon: const Icon(Icons.rocket),
            buttonTitle: 'Add Employee',
            onClick: () {
              Get.toNamed(Routes.AddEmployee);
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
                      const CardHeader(
                        title: 'Employee Details',
                        showDivider: false,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            final double dataTableWidth =
                                max(kScreenWidthXxl, constraints.maxWidth);

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
                                  child: Obx(()=>
                                     DataTable(
                                      border: const TableBorder(
                                          verticalInside: BorderSide(width: 0.2),
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
                                            const Text('Emp Name'),
                                            IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.arrow_drop_down))
                                          ],
                                        )),
                                        DataColumn(
                                            label: Row(
                                          children: [
                                            const Text('Emp Id'),
                                            IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.arrow_drop_down_sharp))
                                          ],
                                        )),
                                        DataColumn(
                                            label: Row(
                                          children: [
                                            const Text('Status'),
                                            IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.arrow_drop_down_sharp))
                                          ],
                                        )),
                                        DataColumn(
                                          label: Row(
                                            children: [
                                              const Text('Mob Number'),
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: const Icon(Icons
                                                      .arrow_drop_down_sharp))
                                            ],
                                          ),
                                        ),
                                        const DataColumn(
                                          label: Text(''),
                                        ),
                                      ],
                                      rows: List.generate(screenController.users.length, (index) {
                                        var user=screenController.users[index];
                                        return DataRow.byIndex(
                                          index: index,
                                          cells: [
                                            DataCell(GestureDetector(
                                                onTap: () {
                                                  DialogWidgets
                                                      .showEmpDetailsDialog(
                                                          context,
                                                          DialogType.info);
                                                },
                                                child: Text(
                                                   user.userName))),
                                             DataCell(Text(user.id)),
                                            DataCell(Text('IsActive')),
                                            DataCell(Text('123456789')),
                                            DataCell(TextButton(
                                                onPressed: () {
                                                  DialogWidgets.showEmpEditDialog(
                                                      context, DialogType.info,user);
                                                },
                                                child: const Text(
                                                  'Edit',
                                                  style: TextStyle(
                                                      color: AppColors.blackColor,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )))
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
}
