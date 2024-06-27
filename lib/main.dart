//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:web_application/generated/l10n.dart';
import 'package:web_application/view/screens/login_screen/login.dart';
//import 'package:web_application/view/widgets/environment.dart';
import 'package:web_application/view/widgets/pages.dart';
import 'package:web_application/view/widgets/routes.dart';

void main() {
  //Environment.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        supportedLocales: Lang.delegate.supportedLocales,
        localizationsDelegates: const [
          Lang.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
        initialRoute: Routes.LOGIN,
        getPages: GetPages.routes);
  }
}