import 'dart:math';
import 'package:flutter/material.dart';
import 'package:web_application/core/animations/entrance_fader.dart';
import 'package:web_application/core/constants/color_constant.dart';
import 'package:web_application/core/constants/size_constants.dart';
import 'package:web_application/view/screens/dashboard_screen/widgets/dashboard_card_widget.dart';
import 'package:web_application/view/screens/dashboard_screen/widgets/summary_card_widget.dart';
import 'package:web_application/view/widgets/card_header.dart';
import 'package:web_application/view/widgets/line_chart_cad.dart';
import 'package:web_application/view/widgets/master_layout/master_layout.dart';

import 'package:web_application/view/widgets/sized_box.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _dataTableHorizontalScrollController = ScrollController();

  @override
  void dispose() {
    _dataTableHorizontalScrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const dashboardCardCount = 2;
    final size = MediaQuery.of(context).size;
    final summaryCardCrossAxisCount = (size.width >= kScreenWidthLg ? 4 : 2);

    return PortalMasterLayout(
      body: ListView(
        padding: EdgeInsets.all(kDefaultPadding),
        children: [
          // UIComponenetsAppBar(
          //   title: Lang.current.dashboardtitle,
          //   subtitle: Lang.current.dashboardsubtitle,
          //   icon: Assets.images.png.rocket
          //       .image(height: kDefaultPadding * 2, fit: BoxFit.cover),
          // ),
          buildSizedBoxH(kDefaultPadding),
          EntranceFader(
            child: Column(
              children: [
                Visibility(
                  visible: (size.width >= kScreenWidthXxl),
                  child: Row(
                    children: [
                      //Sidebar(sidebarConfigs: sidebarMenuConfigs),
                      Expanded(child: _buildChart()),
                      buildSizedboxW(kDefaultPadding),
                      Expanded(child: _builddashboardCard(dashboardCardCount)),
                    ],
                  ),
                ),
                Visibility(
                    visible: (size.width <= kScreenWidthXxl),
                    child: _buildChart()),
                Visibility(
                  visible: (size.width <= kScreenWidthXxl),
                  child: _builddashboardCard(dashboardCardCount),
                ),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final summaryCardWidth = ((constraints.maxWidth -
                            (kDefaultPadding *
                                (summaryCardCrossAxisCount - 1))) /
                        summaryCardCrossAxisCount);

                    return Wrap(
                      direction: Axis.horizontal,
                      spacing: kDefaultPadding,
                      runSpacing: kDefaultPadding,
                      children: [
                        SummaryCard(
                          title: 'New orders',
                          value: '87.4',
                          icon: Icons.shopping_cart_rounded,
                          backgroundColor: AppColors.whiteColor,
                          textColor: AppColors.blackColor,
                          iconColor: AppColors.bgGreyColor,
                          width: summaryCardWidth,
                        ),
                        SummaryCard(
                          title: 'Today Sales',
                          value: '+12%',
                          icon: Icons.ssid_chart_outlined,
                          backgroundColor: AppColors.whiteColor,
                          textColor: AppColors.blackColor,
                          iconColor: AppColors.bgGreyColor,
                          width: summaryCardWidth,
                        ),
                        SummaryCard(
                          title: 'New Users',
                          value: '44.4',
                          icon: Icons.group_add_rounded,
                          backgroundColor: AppColors.whiteColor,
                          textColor: AppColors.blackColor,
                          iconColor: AppColors.bgGreyColor,
                          width: summaryCardWidth,
                        ),
                        SummaryCard(
                          title: 'Pending issues',
                          value: '80',
                          icon: Icons.report_gmailerrorred_rounded,
                          backgroundColor: AppColors.whiteColor,
                          textColor: AppColors.blackColor,
                          iconColor: AppColors.bgGreyColor,
                          width: summaryCardWidth,
                        ),
                      ],
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: kDefaultPadding / 2, top: kDefaultPadding),
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CardHeader(
                          title: 'recent orders',
                          showDivider: false,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              final double dataTableWidth =
                                  max(kScreenWidthMd, constraints.maxWidth);

                              return Scrollbar(
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
                                    child: DataTable(
                                      showCheckboxColumn: false,
                                      showBottomBorder: true,
                                      columns: const [
                                        DataColumn(label: Text('No.')),
                                        DataColumn(label: Text('Date')),
                                        DataColumn(label: Text('Item')),
                                        DataColumn(
                                          label: Text('Rating'),
                                        ),
                                        DataColumn(
                                          label: Text('qty'),
                                        ),
                                        DataColumn(
                                          label: Text('Price'),
                                        ),
                                      ],
                                      rows: List.generate(5, (index) {
                                        return DataRow.byIndex(
                                          index: index,
                                          cells: [
                                            DataCell(Text('#${index + 1}')),
                                            const DataCell(Text('2022-06-30')),
                                            DataCell(Text('Item ${index + 1}')),
                                            DataCell(Text(
                                                '${Random().nextInt(50)}')),
                                            DataCell(Text(
                                                '${Random().nextInt(100)}')),
                                            DataCell(Text(
                                                '${Random().nextInt(10000)}')),
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
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChart() {
    return LineChartCard();
  }

  Widget _builddashboardCard(
    int dashboardCardCount,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final summaryCardWidth = ((constraints.maxWidth -
                  (kDefaultPadding * (dashboardCardCount - 1))) /
              dashboardCardCount);

          return Wrap(
            direction: Axis.horizontal,
            spacing: kDefaultPadding,
            runSpacing: kDefaultPadding,
            children: [
              DashboardCard(
                title: 'New Orders',
                value: '87.4',
                icon: Image.asset(
                  "assets/images/png/circular.png",
                  height: kDefaultPadding * 2.5,
                ),
                backgroundColor: AppColors.contactGradi,
                textColor: AppColors.blackColor,
                iconColor: Colors.transparent,
                width: summaryCardWidth,
                subtitle: '54.9 %',
              ),
              DashboardCard(
                title: 'Today Sales',
                value: '80.4',
                icon: Image.asset(
                  "assets/images/png/clipboard.png",
                  height: kDefaultPadding * 2.5,
                ),
                backgroundColor: AppColors.contactGradi,
                textColor: AppColors.blackColor,
                iconColor: Colors.transparent,
                width: summaryCardWidth,
                subtitle: '64.9 %',
              ),
              DashboardCard(
                title: 'New Users',
                value: '17.4k',
                icon: Image.asset(
                  "assets/images/png/greengift.png",
                  height: kDefaultPadding * 2.5,
                ),
                backgroundColor: AppColors.contactGradi,
                textColor: AppColors.blackColor,
                iconColor: Colors.transparent,
                width: summaryCardWidth,
                subtitle: '74.9 %',
              ),
              DashboardCard(
                title: 'Pending Issues',
                value: '67.4k',
                icon: Image.asset(
                  "assets/images/png/dashboard.png",
                  height: kDefaultPadding * 2.5,
                ),
                backgroundColor: AppColors.contactGradi,
                textColor: AppColors.blackColor,
                iconColor: Colors.transparent,
                width: summaryCardWidth,
                subtitle: '154.9 %',
              ),
            ],
          );
        },
      ),
    );
  }
}
