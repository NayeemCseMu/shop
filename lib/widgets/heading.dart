import 'package:flutter/material.dart';
import 'package:shop/constants/size.dart';

class HeadingText extends StatelessWidget {
  const HeadingText({Key? key, @required this.text}) : super(key: key);
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Text(
        text!,
        style: TextStyle(
          fontSize: getTextSize(16),
          fontWeight: FontWeight.w800,
          color: Colors.black,
        ),
      ),
    );
  }
}
