import 'package:flutter/material.dart';
import 'package:shop/constants/size.dart';

class HeadingText extends StatelessWidget {
  const HeadingText({Key? key, @required this.text}) : super(key: key);
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
        fontSize: getTextSize(20),
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
    );
  }
}
