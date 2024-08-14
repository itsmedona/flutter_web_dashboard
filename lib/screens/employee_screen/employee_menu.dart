import 'package:flutter/material.dart';
import 'package:web_application/core/widgets/masterlayout/portal_master_layout.dart';

class EmployeeMenu extends StatelessWidget {
  const EmployeeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PortalMasterLayout(body: ListView());
  }
}