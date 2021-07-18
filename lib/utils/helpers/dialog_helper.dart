import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogHelper {
  DialogHelper._();
  static final DialogHelper _instance = DialogHelper._();
  static DialogHelper get instance => _instance;

  void showErrorDialog(
      {String? title = 'Error', String? description = 'Something went wrong'}) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title!,
                style: Get.textTheme.headline4,
              ),
              Text(
                description!,
                style: Get.textTheme.headline6,
              ),
              ElevatedButton(
                onPressed: () {
                  if (Get.isDialogOpen!) Get.back();
                },
                child: Text('Okay'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //show loading
  void showLoading({@required message}) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 8),
              Text(message),
            ],
          ),
        ),
      ),
    );
  }

  //hide loading
  void hideLoading() {
    if (Get.isDialogOpen!) Get.back();
  }
}
