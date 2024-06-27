import 'package:flutter/material.dart';
import 'package:web_application/view/widgets/master_layout/master_layout.dart';

class HolidayList extends StatelessWidget {
  const HolidayList({super.key});

  @override
  Widget build(BuildContext context) {
    return PortalMasterLayout(body:ListView());
  }
}