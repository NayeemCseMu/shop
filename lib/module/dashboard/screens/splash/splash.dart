import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/module/dashboard/screens/home/home_screen.dart';

class Splash extends StatefulWidget {
  static final String routeName = "/splash";

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Future.delayed(1.seconds)
        .then((value) => Get.offAndToNamed(HomeScreen.routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Image.asset('assets/images/myfeveret.webp'),
          ),
        ],
      ),
    );
  }
}
