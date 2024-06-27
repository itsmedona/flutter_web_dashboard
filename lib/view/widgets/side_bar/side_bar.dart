import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_application/core/constants/color_constant.dart';
import 'package:web_application/core/constants/size_constants.dart';

class SidebarMenuConfig {
  final String uri;
  final IconData icon;
  final String Function(BuildContext context) title;
  final List<SidebarChildMenuConfig> children;

  const SidebarMenuConfig({
    required this.uri,
    required this.icon,
    required this.title,
    List<SidebarChildMenuConfig>? children,
  }) : children = children ?? const [];
}

class SidebarChildMenuConfig {
  final String uri;
  final IconData icon;
  final String Function(BuildContext context) title;

  const SidebarChildMenuConfig({
    required this.uri,
    required this.icon,
    required this.title,
  });
}

class Sidebar extends StatefulWidget {
  final bool autoSelectMenu;
  final String? selectedMenuUri;
  final List<SidebarMenuConfig> sidebarConfigs;

  Sidebar({
    Key? key,
    this.autoSelectMenu = true,
    this.selectedMenuUri,
    required this.sidebarConfigs,
  }) : super(key: key);

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  final _scrollController = ScrollController();
  late String currentLocation;

  void initState() {
    super.initState();
    currentLocation = widget.selectedMenuUri ?? '';
    if (currentLocation.isEmpty && widget.autoSelectMenu) {
      currentLocation = Get.currentRoute;
    }
    debugPrint('Initial currentLocation: $currentLocation');
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final theme = Theme.of(context);

    return Drawer(
      elevation: 4,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        children: [
          Visibility(
            visible: (mediaQueryData.size.width <= kScreenWidthLg),
            child: Container(
              decoration: BoxDecoration(color: theme.scaffoldBackgroundColor),
              alignment: Alignment.centerRight,
              height: kToolbarHeight + kDefaultPadding - 1,
              padding: EdgeInsets.only(left: kDefaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Percapita',
                    style: GoogleFonts.pacifico(
                      fontSize: kDefaultPadding * 2 - kTextPadding,
                      color: AppColors.defaultColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (Scaffold.of(context).isDrawerOpen) {
                        Scaffold.of(context).closeDrawer();
                      }
                    },
                    icon: const Icon(CupertinoIcons.clear_thick),
                    color: AppColors.whiteColor,

                    ///changed to white from grey
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Scrollbar(
              controller: _scrollController,
              child: ListView(
                controller: _scrollController,
                padding: EdgeInsets.symmetric(
                  vertical: kDefaultPadding,
                  horizontal: kDefaultPadding / 2,
                ),
                children: [
                  _sidebarMenuList(context, currentLocation),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sidebarMenuList(BuildContext context, String currentLocation) {
    return Column(
      children: widget.sidebarConfigs.map<Widget>((menu) {
        if (menu.children.isEmpty) {
          return _sidebarMenu(
            context,
            EdgeInsets.fromLTRB(10, 10, 10, 10),
            menu.uri,
            menu.icon,
            menu.title(context),
            (currentLocation.startsWith(menu.uri)),
          );
        } else {
          return _expandableSidebarMenu(
            context,
            EdgeInsets.fromLTRB(10, 10, 10, 10),
            menu.uri,
            menu.icon,
            menu.title(context),
            menu.children,
            currentLocation,
          );
        }
      }).toList(growable: false),
    );
  }

  Widget _sidebarMenu(
    BuildContext context,
    EdgeInsets padding,
    String uri,
    IconData icon,
    String title,
    bool isSelected,
  ) {
    return Padding(
      padding: padding,
      child: ListTile(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            isSelected
                ? Icon(
                    icon == Icons.dashboard_rounded ||
                            icon == Icons.bar_chart ||
                            icon == Icons.dataset_rounded ||
                            icon == Icons.table_chart ||
                            icon == Icons.location_on_outlined ||
                            icon == Icons.laptop_windows_rounded ||
                            icon == Icons.person_2
                        ? icon
                        : Icons.stop_circle_outlined,
                    size: (kDefaultFontSize + 4.0),
                    color: AppColors.whiteColor,
                  )
                : Icon(
                    icon,
                    size: (kDefaultFontSize + 4.0),
                    color: AppColors.blackColor,
                  ),
            SizedBox(width: kDefaultPadding * 0.5),
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? AppColors.whiteColor : AppColors.blackColor,
              ),
            ),
          ],
        ),
        onTap: () {
          setState(() {
            currentLocation = uri;
          });
          Get.toNamed(uri);
        },
        selected: isSelected,
        textColor: isSelected ? AppColors.textgreyColor : AppColors.blackColor,
        hoverColor: !isSelected ? AppColors.hoverColor : Colors.transparent,
        selectedTileColor:
            isSelected ? AppColors.hoverColor : AppColors.blackColor,
      ),
    );
  }

  Widget _expandableSidebarMenu(
    BuildContext context,
    EdgeInsets padding,
    String uri,
    IconData icon,
    String title,
    List<SidebarChildMenuConfig> children,
    String currentLocation,
  ) {
    final themeData = Theme.of(context);
    final hasSelectedChild =
        children.any((e) => currentLocation.startsWith(e.uri));
    final parentTextColor =
        (hasSelectedChild ? AppColors.GreyColor : AppColors.blackColor);
    bool isSelected = hasSelectedChild;

    return Theme(
      data: themeData.copyWith(
          hoverColor: AppColors.hoverColor, dividerColor: Colors.transparent),
      child: ExpansionTile(
        key: PageStorageKey<String>(uri),
        textColor: parentTextColor,
        collapsedTextColor: parentTextColor,
        iconColor: parentTextColor,
        collapsedIconColor: parentTextColor,
        initiallyExpanded: hasSelectedChild,
        childrenPadding: EdgeInsets.only(
          top: 0,
          bottom: 0,
        ),
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: isSelected ? AppColors.hoverColor : AppColors.blackColor,
                size: 20,
              ),
              SizedBox(width: kDefaultPadding * 0.5),
              Text(
                title,
                style: TextStyle(
                    fontSize: 12,
                    color: isSelected
                        ? AppColors.hoverColor
                        : AppColors.blackColor),
              ),
            ],
          ),
        ),
        children: children.map<Widget>((childMenu) {
          return _sidebarMenu(
            context,
            EdgeInsets.fromLTRB(10, 10, 10, 10),
            childMenu.uri,
            childMenu.icon,
            childMenu.title(context),
            (currentLocation.startsWith(childMenu.uri)),
          );
        }).toList(growable: false),
      ),
    );
  }
}
