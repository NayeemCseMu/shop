import 'package:flutter/material.dart';
import 'package:shop/module/dashboard/screens/home/home_screen.dart';
import 'package:shop/module/dashboard/screens/splash/splash.dart';

Map<String, WidgetBuilder> routes = {
  Splash.routeName: (context) => Splash(),
  HomeScreen.routeName: (context) => HomeScreen(),
};
