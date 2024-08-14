//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:web_application/core/generated/l10n.dart';
import 'package:web_application/routes/routes.dart';
import 'package:web_application/screens/login_screen/login_screen.dart';


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
      );
  }
}
