import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_application/core/animations/entrance_fader.dart';
import 'package:web_application/core/constants/color_constant.dart';
import 'package:web_application/core/constants/size_constants.dart';
import 'package:web_application/view/widgets/master_layout/master_layout.dart';
import 'package:web_application/view/widgets/routes.dart';
import 'package:web_application/view/widgets/sized_box.dart';
import 'package:web_application/view/widgets/ui_components_widgets/ui_components_appbar.dart';

class DesignationList extends StatelessWidget {
  DesignationList({super.key});
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
              title: 'Designation List',
              subtitle: '',
              icon: Icon(Icons.rocket),
              buttonTitle: 'Add Designation',
              onClick: () {
                Get.toNamed(Routes.AddDesign);
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
              child: Padding(
                padding: EdgeInsets.all(kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                              controller: _dataTableHorizontalScrollController,
                              child: SizedBox(
                                width: dataTableWidth,
                                child: DataTable(
                                  border: TableBorder.all(width: 0.5),
                                  dividerThickness: 2,
                                  sortColumnIndex: 0,
                                  sortAscending: true,
                                  showCheckboxColumn: false,
                                  showBottomBorder: true,
                                  columns: [
                                    DataColumn(
                                        label: Row(
                                      children: [
                                        Text('#'),
                                      ],
                                    )),
                                    DataColumn(
                                        label: Row(
                                      children: [
                                        Text('Category name'),
                                      ],
                                    )),
                                    DataColumn(
                                        label: Row(
                                      children: [
                                        Text('Department name'),
                                      ],
                                    )),
                                    DataColumn(
                                        label: Row(
                                      children: [
                                        Text('Designation name'),
                                      ],
                                    )),
                                    DataColumn(
                                        label: Row(
                                      children: [
                                        Text('Status'),
                                      ],
                                    )),
                                  ],
                                  rows: List.generate(5, (index) {
                                    return DataRow.byIndex(
                                      index: index,
                                      cells: [
                                        DataCell(Text('#${index + 1}')),
                                        DataCell(Text('Category ${index + 1}')),
                                        DataCell(
                                            Text('Department ${index + 1}')),
                                        DataCell(
                                            Text('Designation ${index + 1}')),
                                        DataCell(Text('Active')),
                                      ],
                                    );
                                  }),
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
            )),
      ],
    )));
  }
}
