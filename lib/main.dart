import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/module/dashboard/screens/splash/splash.dart';
import 'package:shop/utils/helpers/binding.dart';
import 'config/routes/route.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: AppBinding(),
      initialRoute: Splash.routeName,
      routes: routes,
    );
  }
}
