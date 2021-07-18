import 'package:flutter/material.dart';
import 'package:shop/utils/service/api/api_service.dart';

class HomeScreen extends StatelessWidget {
  static final String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ElevatedButton(
            onPressed: () async {
              await ApiService.instance.getTrendingSeller();
            },
            child: Text("Get Tren Seller"),
          )),
    );
  }
}
