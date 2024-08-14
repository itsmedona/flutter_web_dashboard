import 'package:flutter/material.dart';

import 'package:get/get_navigation/src/routes/route_middleware.dart';
import 'package:web_application/core/services/getx/settings_service.dart';
import 'package:web_application/routes/routes.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    ///if user authenticated
    if (SettingsServices.get.isAuthenticated.value) {
      return null;
    } else {
      //if not authenticated, redirect to login screen
      return const RouteSettings(name: Routes.LOGIN);
    }
  }
}