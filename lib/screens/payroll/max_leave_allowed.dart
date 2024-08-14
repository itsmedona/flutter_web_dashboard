import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_application/core/animations/entrance_fader.dart';
import 'package:web_application/core/constants/colors.dart';
import 'package:web_application/core/widgets/masterlayout/portal_master_layout.dart';
import 'package:web_application/core/widgets/sized_boxes.dart';
import 'package:web_application/core/widgets/ui_component_appbar.dart';

import '../../core/constants/dimens.dart';
import '../../routes/routes.dart';

class MaxLeaveAllowed extends StatelessWidget {
  MaxLeaveAllowed({super.key});
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
            title: 'Max Leave Allowed',
            subtitle: '',
            icon: Icon(Icons.rocket),
            buttonTitle: 'Add Max Leave Allowed',
            onClick: () {
              Get.toNamed(Routes.AddMaxLeaveAllowed);
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
                                  child: DataTable(
                                    border: TableBorder(
                                        verticalInside: BorderSide(width: 0.5),
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
                                          Text('Company Id'),

                                          //  IconButton(
                                          //      onPressed: () {},
                                          //      icon: Icon(Icons.arrow_drop_down ))
                                        ],
                                      )),
                                      DataColumn(
                                          label: Row(
                                        children: [
                                          Text('Employee Category Id'),
                                          //  IconButton(
                                          //      onPressed: () {},
                                          //      icon: Icon(Icons.arrow_drop_down_sharp))
                                        ],
                                      )),
                                      DataColumn(
                                          label: Row(
                                        children: [
                                          Text('Max No Of Leave'),
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
                                    ],
                                    rows: List.generate(5, (index) {
                                      return DataRow.byIndex(
                                        index: index,
                                        cells: [
                                          DataCell(Text('#${index + 1}')),
                                          const DataCell(Text('2022-06-30')),
                                          DataCell(Text('${index + 1}')),
                                          DataCell(
                                              Text('${Random().nextInt(50)}')),
                                          DataCell(
                                              Text('${Random().nextInt(100)}')),
                                          // DataCell(Text(
                                          //     '${Random().nextInt(10000)}')),
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
              ),
            )),
      ],
    )));
  }
}
